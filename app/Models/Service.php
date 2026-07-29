<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory, HasSlug;

    protected $fillable = [
        'title',
        'slug',
        'icon',
        'summary',
        'includes',
        'sort_order',
        'is_published',
    ];

    protected $casts = [
        'includes' => 'array',
        'is_published' => 'boolean',
    ];
}
