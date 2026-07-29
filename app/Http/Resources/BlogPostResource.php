<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BlogPostResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'title' => $this->title,
            'category' => $this->category,
            'tags' => $this->tags ?? [],
            'excerpt' => $this->excerpt,
            'cover' => $this->cover_url,
            'author' => $this->author?->name ?? 'Michael Awuah Sarpong',
            'date' => optional($this->published_at ?? $this->created_at)->format('Y-m-d'),
            'readingTime' => $this->reading_time,
            'content' => $this->content,
            'published' => $this->is_published,
        ];
    }
}
