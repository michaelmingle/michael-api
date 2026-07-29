<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\BlogPostRequest;
use App\Http\Resources\BlogPostResource;
use App\Models\BlogPost;

class BlogPostController extends Controller
{
    public function index()
    {
        return BlogPostResource::collection(BlogPost::latest()->get());
    }

    public function show(BlogPost $blog)
    {
        return new BlogPostResource($blog);
    }

    public function store(BlogPostRequest $request)
    {
        $data = $request->safe()->except(['cover']);
        $data['author_id'] = $request->user()->id;
        if (! empty($data['is_published']) && empty($data['published_at'])) {
            $data['published_at'] = now();
        }

        $post = BlogPost::create($data);

        if ($request->hasFile('cover')) {
            $post->addMediaFromRequest('cover')->toMediaCollection('cover');
        }

        return new BlogPostResource($post);
    }

    public function update(BlogPostRequest $request, BlogPost $blog)
    {
        $data = $request->safe()->except(['cover']);
        if (! empty($data['is_published']) && empty($blog->published_at) && empty($data['published_at'])) {
            $data['published_at'] = now();
        }

        $blog->update($data);

        if ($request->hasFile('cover')) {
            $blog->addMediaFromRequest('cover')->toMediaCollection('cover');
        }

        return new BlogPostResource($blog);
    }

    public function destroy(BlogPost $blog)
    {
        $blog->delete();

        return response()->json(['message' => 'Post deleted.']);
    }
}
