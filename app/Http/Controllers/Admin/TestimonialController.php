<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\TestimonialRequest;
use App\Http\Resources\TestimonialResource;
use App\Models\Testimonial;

class TestimonialController extends Controller
{
    public function index()
    {
        return TestimonialResource::collection(Testimonial::orderBy('sort_order')->get());
    }

    public function show(Testimonial $testimonial)
    {
        return new TestimonialResource($testimonial);
    }

    public function store(TestimonialRequest $request)
    {
        $testimonial = Testimonial::create($request->safe()->except(['avatar']));

        if ($request->hasFile('avatar')) {
            $testimonial->addMediaFromRequest('avatar')->toMediaCollection('avatar');
        }

        return new TestimonialResource($testimonial);
    }

    public function update(TestimonialRequest $request, Testimonial $testimonial)
    {
        $testimonial->update($request->safe()->except(['avatar']));

        if ($request->hasFile('avatar')) {
            $testimonial->addMediaFromRequest('avatar')->toMediaCollection('avatar');
        }

        return new TestimonialResource($testimonial);
    }

    public function destroy(Testimonial $testimonial)
    {
        $testimonial->delete();

        return response()->json(['message' => 'Testimonial deleted.']);
    }
}
