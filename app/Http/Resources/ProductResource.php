<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'name' => $this->name,
            'category' => $this->category,
            'tagline' => $this->tagline,
            'cover' => $this->cover_url,
            'gallery' => $this->gallery_urls,
            'rating' => (float) $this->rating,
            'reviews' => $this->reviews_count,
            'features' => $this->features ?? [],
            'pricing' => $this->pricing ?? ['oneTime' => null, 'subscription' => []],
            'demoUrl' => $this->demo_url,
            'hasFreeTrial' => $this->has_free_trial,
            'hasDocs' => $this->has_docs,
            'published' => $this->is_published,
        ];
    }
}
