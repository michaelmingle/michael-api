<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ProductRequest;
use App\Http\Resources\ProductResource;
use App\Models\Product;

class ProductController extends Controller
{
    public function index()
    {
        return ProductResource::collection(Product::latest()->get());
    }

    public function show(Product $product)
    {
        return new ProductResource($product);
    }

    public function store(ProductRequest $request)
    {
        $product = Product::create($request->safe()->except(['cover', 'gallery']));

        $this->syncMedia($product, $request);

        return new ProductResource($product);
    }

    public function update(ProductRequest $request, Product $product)
    {
        $product->update($request->safe()->except(['cover', 'gallery']));

        $this->syncMedia($product, $request);

        return new ProductResource($product);
    }

    public function destroy(Product $product)
    {
        $product->delete();

        return response()->json(['message' => 'Product deleted.']);
    }

    private function syncMedia(Product $product, ProductRequest $request): void
    {
        if ($request->hasFile('cover')) {
            $product->addMediaFromRequest('cover')->toMediaCollection('cover');
        }

        foreach ($request->file('gallery', []) as $file) {
            $product->addMedia($file)->toMediaCollection('gallery');
        }
    }
}
