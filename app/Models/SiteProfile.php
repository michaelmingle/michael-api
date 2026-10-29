<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class SiteProfile extends Model implements HasMedia
{
    use InteractsWithMedia;

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('photo')->singleFile();
    }

    public static function current(): self
    {
        return static::query()->first() ?? static::query()->create();
    }

    public function getPhotoUrlAttribute(): ?string
    {
        return $this->getFirstMediaUrl('photo') ?: null;
    }
}
