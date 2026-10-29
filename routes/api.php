<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\BlogPostController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\TestimonialController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

Route::get('/health', function () {
    return response()->json([
        'status' => 'ok',
        'app' => config('app.name'),
        'timestamp' => now()->toIso8601String(),
    ]);
});

// Streams uploaded media through Laravel instead of relying on the host to
// serve /storage directly — some shared hosts block that path regardless of
// symlink setup (see config/filesystems.php).
Route::get('/media/{path}', function (string $path) {
    if (str_contains($path, '..')) {
        abort(404);
    }

    $disk = Storage::disk('public');

    abort_unless($disk->exists($path), 404);

    return $disk->response($path);
})->where('path', '.*');

Route::get('/projects', [ProjectController::class, 'index']);
Route::get('/projects/{slug}', [ProjectController::class, 'show']);
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{slug}', [ProductController::class, 'show']);
Route::get('/blog', [BlogPostController::class, 'index']);
Route::get('/blog/{slug}', [BlogPostController::class, 'show']);
Route::get('/services', [ServiceController::class, 'index']);
Route::get('/testimonials', [TestimonialController::class, 'index']);
Route::get('/profile', [ProfileController::class, 'show']);

Route::post('/contact', [ContactController::class, 'store']);
Route::post('/bookings', [BookingController::class, 'store']);

Route::post('/auth/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/auth/logout', [AuthController::class, 'logout']);
    Route::get('/auth/me', [AuthController::class, 'me']);
});

require __DIR__.'/api-admin.php';
