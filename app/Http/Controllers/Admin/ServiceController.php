<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ServiceRequest;
use App\Http\Resources\ServiceResource;
use App\Models\Service;

class ServiceController extends Controller
{
    public function index()
    {
        return ServiceResource::collection(Service::orderBy('sort_order')->get());
    }

    public function show(Service $service)
    {
        return new ServiceResource($service);
    }

    public function store(ServiceRequest $request)
    {
        return new ServiceResource(Service::create($request->validated()));
    }

    public function update(ServiceRequest $request, Service $service)
    {
        $service->update($request->validated());

        return new ServiceResource($service);
    }

    public function destroy(Service $service)
    {
        $service->delete();

        return response()->json(['message' => 'Service deleted.']);
    }
}
