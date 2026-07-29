<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->id();
            $table->string('category')->nullable();
            $table->string('title');
            $table->string('slug')->unique();
            $table->text('summary');
            $table->json('tech')->nullable();
            $table->json('features')->nullable();
            $table->text('problem')->nullable();
            $table->text('solution')->nullable();
            $table->text('architecture')->nullable();
            $table->json('challenges')->nullable();
            $table->json('results')->nullable();
            $table->string('demo_url')->nullable();
            $table->string('github_url')->nullable();
            $table->json('store_links')->nullable();
            $table->string('client_name')->nullable();
            $table->string('client_role')->nullable();
            $table->text('client_testimonial')->nullable();
            $table->boolean('is_featured')->default(false);
            $table->boolean('is_published')->default(true);
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('projects');
    }
};
