<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Product extends Model implements HasMedia
{
    use HasFactory, HasSlug, InteractsWithMedia;

    protected function slugSourceField(): string
    {
        return 'name';
    }

    protected $fillable = [
        'category',
        'name',
        'slug',
        'tagline',
        'features',
        'pricing',
        'demo_url',
        'has_free_trial',
        'has_docs',
        'rating',
        'reviews_count',
        'is_published',
    ];

    protected $casts = [
        'features' => 'array',
        'pricing' => 'array',
        'has_free_trial' => 'boolean',
        'has_docs' => 'boolean',
        'is_published' => 'boolean',
        'rating' => 'float',
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
