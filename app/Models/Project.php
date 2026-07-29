<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Project extends Model implements HasMedia
{
    use HasFactory, HasSlug, InteractsWithMedia;

    protected $fillable = [
        'category',
        'title',
        'slug',
        'summary',
        'tech',
        'features',
        'problem',
        'solution',
        'architecture',
        'challenges',
        'results',
        'demo_url',
        'github_url',
        'store_links',
        'client_name',
        'client_role',
        'client_testimonial',
        'is_featured',
        'is_published',
        'sort_order',
    ];

    protected $casts = [
        'tech' => 'array',
        'features' => 'array',
        'challenges' => 'array',
        'results' => 'array',
        'store_links' => 'array',
        'is_featured' => 'boolean',
        'is_published' => 'boolean',
    ];

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('cover')->singleFile();
        $this->addMediaCollection('gallery');
    }

    public function getCoverUrlAttribute(): ?string
    {
        return $this->getFirstMediaUrl('cover') ?: null;
    }

    public function getGalleryUrlsAttribute(): array
    {
        return $this->getMedia('gallery')->map(fn (Media $m) => $m->getUrl())->values()->all();
    }
}
