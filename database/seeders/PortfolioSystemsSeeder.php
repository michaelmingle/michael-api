<?php

namespace Database\Seeders;

use App\Models\Project;
use Illuminate\Database\Seeder;

/**
 * Adds the full set of systems built beyond the original seven case studies.
 *
 * Idempotent (upserts by slug, never deletes) so it is safe to run on
 * production: `php artisan db:seed --class=PortfolioSystemsSeeder --force`.
 * Descriptions are limited to what each codebase actually contains — no
 * invented metrics or client quotes. Edit/extend them from the dashboard.
 */
class PortfolioSystemsSeeder extends Seeder
{
    public function run(): void
    {
        $systems = [
            [
                'slug' => 'ofi-eats',
                'title' => 'OFI Eats — Food Ordering Marketplace',
                'category' => 'Web Platform',
                'tech' => ['React', 'TypeScript', 'Vite', 'Tailwind CSS', 'TanStack Query', 'Zustand', 'PWA', 'Laravel'],
                'summary' => 'A Bolt-Food-style multi-restaurant ordering app where customers browse restaurants, build a basket and track orders live — plugged into the OFI-CIA restaurant POS so restaurants never re-enter menus or orders.',
                'features' => ['Multi-restaurant discovery', 'Guest checkout', 'Basket & delivery fee', 'Live order tracking', 'Opt-in per branch', 'Installable PWA', 'Orders accepted from the restaurant admin'],
                'architecture' => 'Mobile-first React PWA consuming a thin public marketplace layer on the OFI-CIA Laravel API. App orders flow into the normal restaurant Orders screen, then the kitchen and bar boards drive the customer\'s tracker.',
            ],
            [
                'slug' => 'ghsusu',
                'title' => 'GHSuSu — Susu Collections Platform',
                'category' => 'Web Platform',
                'tech' => ['Laravel', 'React', 'Tailwind CSS', 'PWA', 'Sanctum', 'SMS API'],
                'summary' => 'A mobile-first platform for susu agents to register customers, record collections and manage withdrawals, with SMS notifications and an admin console for every business rule.',
                'features' => ['Agent collection workflow', 'Customer balances & withdrawals with fees', 'Collection → deposit posting to bank', 'SMS notifications', 'Admin-tunable settings', 'Installable PWA for phones'],
                'demo_url' => 'https://ghsusu.com',
                'architecture' => 'Laravel API with Sanctum bearer tokens and a React single-page PWA, rebuilt from a page-reload Blade app so agents get instant navigation on phones.',
            ],
            [
                'slug' => 'jimah-labs',
                'title' => 'Jimah Labs — Laboratory Management',
                'category' => 'Web Platform',
                'tech' => ['Laravel', 'React', 'TypeScript', 'shadcn/ui', 'Sanctum', 'MySQL'],
                'summary' => 'A role-based diagnostics platform covering reception, laboratory, radiology, accounting and consultant reporting for a medical laboratory.',
                'features' => ['Role-based dashboards', 'Reception & patient registration', 'Laboratory & radiology workflows', 'Service types & pricing', 'Accounting', 'Consultant reports'],
                'architecture' => 'Laravel API with role middleware on a users.role column; React + TypeScript frontend with role-gated routes and shadcn/ui components.',
            ],
            [
                'slug' => 'easykeys',
                'title' => 'EasyKeys — Car Marketplace & Auctions',
                'category' => 'Mobile App',
                'tech' => ['Flutter', 'Laravel', 'Livewire', 'MySQL'],
                'summary' => 'A vehicle marketplace app with car listings, live auctions and notifications, backed by a Laravel/Livewire admin panel.',
                'features' => ['Car listings', 'Auctions', 'Push & in-app notifications', 'Admin panel'],
                'architecture' => 'Flutter mobile client talking to a Laravel 13 API; Livewire powers the back-office admin.',
            ],
            [
                'slug' => 'smartmeasure-ai',
                'title' => 'SmartMeasure AI — Body Measurement for Tailors',
                'category' => 'AI Tool',
                'tech' => ['Flutter', 'FastAPI', 'MediaPipe', 'PostgreSQL', 'Docker'],
                'summary' => 'A tailoring app that estimates body measurements from camera scans using pose detection, so tailors can capture a client\'s measurements from a phone.',
                'features' => ['Camera-based body scan', 'Pose-landmark measurement estimation', 'Client measurement records', 'Containerised API'],
                'architecture' => 'Flutter app calling a FastAPI service that runs MediaPipe pose estimation, persisted in PostgreSQL and shipped with Docker Compose.',
            ],
            [
                'slug' => 'wishme',
                'title' => 'WishMe — Celebration Gifting Platform',
                'category' => 'Mobile App',
                'tech' => ['Flutter', 'Laravel', 'Paystack', 'Mobile Money API'],
                'summary' => 'A celebration app where friends send gifts to event hosts, collecting by Mobile Money prompt or card and paying hosts out instantly.',
                'features' => ['Event gifting', 'Mobile Money collection (STK push)', 'Instant payout to host wallets', 'Card & bank payments via Paystack', 'Payment webhooks & settlement'],
                'architecture' => 'Flutter client with a Laravel API integrating the QIB Mobile Money gateway for collection and instant disbursement, alongside Paystack for card and bank payments.',
            ],
            [
                'slug' => 'ejisu-municipal-assembly',
                'title' => 'Ejisu Municipal Assembly — Government Portal',
                'category' => 'Web Platform',
                'tech' => ['React', 'TypeScript', 'Vite', 'Tailwind CSS', 'Framer Motion', 'Leaflet', 'Zod'],
                'summary' => 'A full multi-page redesign of a Ghanaian municipal assembly website with services, departments, projects, news, gallery, documents and an interactive map.',
                'features' => ['Services & departments', 'Projects & news', 'Gallery & documents', 'Interactive map', 'Validated contact forms', 'Responsive, animated UI'],
                'architecture' => 'React 19 + TypeScript SPA with a Tailwind v4 design system, content kept in a single typed source of truth.',
            ],
            [
                'slug' => 'monday-style-work-management',
                'title' => 'Work Management Boards (Monday-style)',
                'category' => 'Web Platform',
                'tech' => ['Laravel', 'React', 'MySQL', 'Redis', 'Laravel Reverb', 'WebSockets'],
                'summary' => 'A Monday.com-style project management app with Kanban boards, calendar, charts and an inbox, updated in real time over WebSockets.',
                'features' => ['Kanban boards', 'Calendar view', 'Charts', 'Inbox', 'Real-time updates', 'Queued background jobs'],
                'architecture' => 'React/shadcn frontend wired to a Laravel 13 API using Redis queues and Laravel Reverb private channels per board.',
            ],
            [
                'slug' => 'july-08-limited-accounting-pos',
                'title' => 'July 08 Limited — Accounting & POS',
                'category' => 'Web Platform',
                'tech' => ['Laravel', 'React', 'TypeScript', 'Sanctum', 'Spatie Permission', 'MySQL'],
                'summary' => 'A multi-branch accounting and point-of-sale system for a Ghanaian building-materials company, where every sale posts to double-entry books.',
                'features' => ['Multi-branch role-based access', 'POS sales', 'Double-entry accounting', 'Expense approval workflow'],
                'architecture' => 'Laravel 12 API with service classes for accounting and sales, Spatie roles and branch-scoped models, and a React 19 frontend.',
            ],
            [
                'slug' => 'tentra-ticketing',
                'title' => 'Tentra — Event Ticketing & Gate Access',
                'category' => 'SaaS',
                'tech' => ['Laravel', 'Flutter', 'Sanctum', 'Spatie Permission', 'Docker'],
                'summary' => 'Event ticketing and gate access for Ghana: organisers sell tickets, attendees keep them in a wallet, and staff scan entry at the gate.',
                'features' => ['Events & checkout', 'Attendee wallet', 'Refunds', 'Ticket delivery', 'Gate scanner'],
                'architecture' => 'Monorepo with a Laravel 13 API, a Flutter attendee wallet and offline gate scanner, and shared design tokens.',
            ],
            [
                'slug' => 'payav-autos',
                'title' => 'PAYAV AUTOS — Vehicle Marketplace & Car Finance',
                'category' => 'Web Platform',
                'tech' => ['Laravel', 'React', 'TypeScript', 'Tailwind CSS', 'React Query', 'MySQL'],
                'summary' => 'Ghana\'s vehicle marketplace and car-finance MVP with an indicative finance calculator, a multi-step application flow, a customer dashboard and an admin back office.',
                'features' => ['Vehicle marketplace', 'Finance calculator', 'Multi-step finance application', 'Customer dashboard', 'Admin review of applications'],
                'architecture' => 'API-only Laravel 13 with Sanctum and a React 19 + TypeScript frontend using lazy-loaded routes and React Query.',
            ],
            [
                'slug' => 'kinetiq-gym-management',
                'title' => 'Kinetiq — Gym Management & Fitness Coaching',
                'category' => 'SaaS',
                'tech' => ['Laravel', 'Flutter', 'Riverpod', 'Sanctum', 'MySQL'],
                'summary' => 'A multi-tenant SaaS for gyms and fitness coaches, with separate manager and member mobile apps.',
                'features' => ['Multi-tenant gyms', 'Gym manager app', 'Member app', 'Shared API client package'],
                'architecture' => 'Laravel 12 REST API (/api/v1) with Sanctum, and two Flutter apps built on Riverpod and go_router sharing a core Dart package.',
            ],
            [
                'slug' => 'just-delivery',
                'title' => 'Just Delivery — Last-Mile Delivery Platform',
                'category' => 'Mobile App',
                'tech' => ['NestJS', 'Socket.IO', 'PostgreSQL', 'Redis', 'Docker', 'Flutter'],
                'summary' => 'A last-mile delivery platform with a customer app, a rider app and an admin dashboard on a real-time backend.',
                'features' => ['Customer delivery requests', 'Rider app', 'Admin dashboard', 'Real-time tracking'],
                'architecture' => 'NestJS REST API plus Socket.IO server on PostgreSQL and Redis via Docker, with Flutter customer and rider apps.',
            ],
            [
                'slug' => 'band-ai-worship-accompanist',
                'title' => 'Band — AI Worship & Praise Accompanist',
                'category' => 'AI Tool',
                'tech' => ['Flutter', 'Python', 'MIDI'],
                'summary' => 'A live accompaniment app that plays like a keyboardist for singers and worship leaders, adapting key, tempo and chord progressions in real time.',
                'features' => ['12-key instant transposition', 'Worship & praise modes', 'Chord progression engine', 'Tempo 60–160 BPM with tap tempo', 'Smart looping', 'Instrument toggles'],
                'architecture' => 'MIDI-based audio (not MP3) so key, tempo and chords change live; Flutter app with a Python backend.',
            ],
            [
                'slug' => 'jarvis-ai-assistant',
                'title' => 'JARVIS — Personal AI Assistant & Command Center',
                'category' => 'AI Tool',
                'tech' => ['Python', 'FastAPI', 'React', 'Whisper'],
                'summary' => 'A voice-enabled personal assistant with a command-center dashboard that monitors websites, projects and business metrics.',
                'features' => ['Assistant & command-center tabs', 'Speech recognition (Whisper)', 'Website & project monitoring', 'Business-metrics feed', 'VPS deploy scripts'],
                'architecture' => 'FastAPI backend with a profile-driven config, a React frontend, and install/push scripts for running on a VPS.',
            ],
            [
                'slug' => 'ai-video-editor',
                'title' => 'AiVideoEditor — Local Video Engine',
                'category' => 'AI Tool',
                'tech' => ['Python', 'FFmpeg'],
                'summary' => 'A local video-editing engine and desktop app that shortens long pauses, adjusts colour and denoises audio without ever modifying the original file.',
                'features' => ['Silence / pause removal', 'Colour adjustments', 'Audio denoise', 'H.264/AAC export', 'Original verified unchanged by SHA-256'],
                'architecture' => 'Standard-library Python CLI orchestrating FFmpeg/FFprobe, with a desktop app wrapper.',
            ],
            [
                'slug' => 'next-era-construction',
                'title' => 'Next Era — Construction Company Website',
                'category' => 'Web Platform',
                'tech' => ['React', 'Vite', 'Tailwind CSS', 'Framer Motion', 'Laravel', 'MySQL'],
                'summary' => 'A professional marketing website for a construction company with animated UI and an AI chat assistant.',
                'features' => ['Corporate design system', 'Animated UI', 'AI chat assistant', 'Laravel API'],
                'architecture' => 'React (Vite) frontend with a Laravel + Sanctum API on MySQL.',
            ],
            [
                'slug' => 'onero-portfolio',
                'title' => 'Onero — Portfolio with Content Dashboard',
                'category' => 'Web Platform',
                'tech' => ['React', 'PHP'],
                'summary' => 'A portfolio site with a content dashboard, built for cPanel shared hosting with no database.',
                'features' => ['Public site', 'Password-protected /admin dashboard', 'JSON-file content', 'Image uploads'],
                'architecture' => 'React frontend with a plain-PHP API; content lives in a JSON file and images in an uploads folder.',
            ],
        ];

        $order = (int) Project::max('sort_order');

        foreach ($systems as $data) {
            $existing = Project::where('slug', $data['slug'])->first();

            Project::updateOrCreate(['slug' => $data['slug']], $data + [
                'is_published' => true,
                'is_featured' => false,
                'sort_order' => $existing?->sort_order ?? ++$order,
            ]);
        }
    }
}
