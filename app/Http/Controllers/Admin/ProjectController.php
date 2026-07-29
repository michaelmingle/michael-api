<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ProjectRequest;
use App\Http\Resources\ProjectResource;
use App\Models\Project;

class ProjectController extends Controller
{
    public function index()
    {
        return ProjectResource::collection(Project::latest()->get());
    }

    public function show(Project $project)
    {
        return new ProjectResource($project);
    }

    public function store(ProjectRequest $request)
    {
        $project = Project::create($request->safe()->except(['cover', 'gallery']));

        $this->syncMedia($project, $request);

        return new ProjectResource($project);
    }

    public function update(ProjectRequest $request, Project $project)
    {
        $project->update($request->safe()->except(['cover', 'gallery']));

        $this->syncMedia($project, $request);

        return new ProjectResource($project);
    }

    public function destroy(Project $project)
    {
        $project->delete();

        return response()->json(['message' => 'Project deleted.']);
    }

    private function syncMedia(Project $project, ProjectRequest $request): void
    {
        if ($request->hasFile('cover')) {
            $project->addMediaFromRequest('cover')->toMediaCollection('cover');
        }

        foreach ($request->file('gallery', []) as $file) {
            $project->addMedia($file)->toMediaCollection('gallery');
        }
    }
}
