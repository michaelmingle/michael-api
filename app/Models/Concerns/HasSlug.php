<?php

namespace App\Models\Concerns;

use Illuminate\Support\Str;

trait HasSlug
{
    public static function bootHasSlug(): void
    {
        static::creating(function ($model) {
            if (empty($model->slug)) {
                $model->slug = $model->uniqueSlugFrom($model->slugSourceField());
            }
        });
    }

    protected function slugSourceField(): string
    {
        return 'title';
    }

    protected function uniqueSlugFrom(string $field): string
    {
        $base = Str::slug($this->{$field});
        $slug = $base;
        $suffix = 2;

        while (static::where('slug', $slug)->exists()) {
            $slug = "{$base}-{$suffix}";
            $suffix++;
        }

        return $slug;
    }
}
