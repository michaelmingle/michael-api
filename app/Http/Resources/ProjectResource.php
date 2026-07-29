<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProjectResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'title' => $this->title,
            'category' => $this->category,
            'tech' => $this->tech ?? [],
            'summary' => $this->summary,
            'cover' => $this->cover_url,
            'gallery' => $this->gallery_urls,
            'features' => $this->features ?? [],
            'demoUrl' => $this->demo_url,
            'githubUrl' => $this->github_url,
            'storeLinks' => $this->store_links,
            'problem' => $this->problem,
            'solution' => $this->solution,
            'architecture' => $this->architecture,
            'challenges' => $this->challenges ?? [],
            'results' => $this->results ?? [],
            'testimonial' => $this->client_name ? [
                'quote' => $this->client_testimonial,
                'author' => $this->client_name,
                'role' => $this->client_role,
            ] : null,
            'featured' => $this->is_featured,
            'published' => $this->is_published,
        ];
    }
}
