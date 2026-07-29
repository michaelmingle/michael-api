<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class ProjectRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'category' => ['nullable', 'string', 'max:255'],
            'title' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255'],
            'summary' => ['required', 'string'],
            'tech' => ['nullable', 'array'],
            'tech.*' => ['string'],
            'features' => ['nullable', 'array'],
            'features.*' => ['string'],
            'problem' => ['nullable', 'string'],
            'solution' => ['nullable', 'string'],
            'architecture' => ['nullable', 'string'],
            'challenges' => ['nullable', 'array'],
            'challenges.*' => ['string'],
            'results' => ['nullable', 'array'],
            'results.*' => ['string'],
            'demo_url' => ['nullable', 'string', 'max:255'],
            'github_url' => ['nullable', 'string', 'max:255'],
            'store_links' => ['nullable', 'array'],
            'client_name' => ['nullable', 'string', 'max:255'],
            'client_role' => ['nullable', 'string', 'max:255'],
            'client_testimonial' => ['nullable', 'string'],
            'is_featured' => ['nullable', 'boolean'],
            'is_published' => ['nullable', 'boolean'],
            'sort_order' => ['nullable', 'integer'],
            'cover' => ['nullable', 'image', 'max:5120'],
            'gallery' => ['nullable', 'array'],
            'gallery.*' => ['image', 'max:5120'],
        ];
    }
}
