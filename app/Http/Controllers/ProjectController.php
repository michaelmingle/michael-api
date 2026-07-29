<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProjectResource;
use App\Models\Project;

class ProjectController extends Controller
{
    public function index()
    {
        return ProjectResource::collection(
            Project::where('is_published', true)
                ->orderByDesc('is_featured')
                ->orderBy('sort_order')
                ->latest()
                ->get()
        );
    }

    public function show(string $slug)
    {
        $project = Project::where('slug', $slug)->where('is_published', true)->firstOrFail();

        return new ProjectResource($project);
    }
}
