<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProfileResource;
use App\Models\SiteProfile;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function show()
    {
        return new ProfileResource(SiteProfile::current());
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'photo' => ['nullable', 'image', 'max:5120'],
            'remove_photo' => ['nullable', 'boolean'],
        ]);

        $profile = SiteProfile::current();

        if ($request->hasFile('photo')) {
            $profile->addMediaFromRequest('photo')->toMediaCollection('photo');
        } elseif (! empty($data['remove_photo'])) {
            $profile->clearMediaCollection('photo');
        }

        return new ProfileResource($profile->fresh());
    }
}
