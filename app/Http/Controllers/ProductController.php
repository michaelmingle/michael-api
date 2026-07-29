<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductResource;
use App\Models\Product;

class ProductController extends Controller
{
    public function index()
    {
        return ProductResource::collection(
            Product::where('is_published', true)->latest()->get()
        );
    }

    public function show(string $slug)
    {
        $product = Product::where('slug', $slug)->where('is_published', true)->firstOrFail();

        return new ProductResource($product);
    }
}
