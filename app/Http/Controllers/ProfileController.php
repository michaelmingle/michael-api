<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProfileResource;
use App\Models\SiteProfile;

class ProfileController extends Controller
{
    public function show()
    {
        return new ProfileResource(SiteProfile::current());
    }
}
