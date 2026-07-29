<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TestimonialResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'role' => $this->role,
            'company' => $this->company,
            'avatar' => $this->avatar_url,
            'rating' => $this->rating,
            'quote' => $this->quote,
            'video' => $this->video_url,
            'published' => $this->is_published,
        ];
    }
}
