<?php

namespace Database\Seeders;

use App\Models\BlogPost;
use App\Models\User;
use Illuminate\Database\Seeder;

class BlogPostSeeder extends Seeder
{
    public function run(): void
    {
        $authorId = User::where('email', 'michaelmingle.mas@gmail.com')->value('id');

        $posts = [
            [
                'slug' => 'structuring-large-laravel-apis',
                'title' => 'Structuring Large Laravel APIs for Long-Term Maintainability',
                'category' => 'Laravel',
                'tags' => ['Laravel', 'Architecture', 'API'],
                'excerpt' => 'How I organize service classes, form requests, and API resources in Laravel projects that need to survive years of feature growth.',
                'reading_time' => 7,
                'published_at' => '2026-06-02',
                'content' => <<<'MD'
Large Laravel codebases rot for predictable reasons: fat controllers, business logic leaking into models, and no consistent place for validation.

The pattern that has held up best across a dozen production apps is a strict separation between HTTP concerns (controllers, form requests, API resources) and domain logic (service classes, actions). Controllers stay thin — they validate, delegate to a service, and format a response. Everything that could be unit-tested without booting HTTP lives in a service or action class.

Form Requests handle authorization and validation exclusively. API Resources own response shaping, so the frontend never sees raw model attributes. This alone eliminates most of the "why does this endpoint return different fields sometimes" bugs.

The payoff shows up eighteen months in, when a new hire can trace a feature from route to database without reading the whole app.
MD,
            ],
            [
                'slug' => 'react-query-vs-redux-in-2026',
                'title' => 'React Query vs Redux: What I Actually Reach For in 2026',
                'category' => 'React',
                'tags' => ['React', 'State Management'],
                'excerpt' => 'Server state and client state are different problems. Most apps only need one of these tools, not both.',
                'reading_time' => 6,
                'published_at' => '2026-05-14',
                'content' => <<<'MD'
The mistake I see most often is teams reaching for Redux to store data that came from an API. That's server state — it has its own cache, its own staleness, its own retry semantics. React Query models that correctly out of the box.

Redux (or a lighter Context-based store) still earns its place for genuinely client-only state: UI toggles, multi-step form state, optimistic local-only preferences.

On recent projects, splitting these two concerns cut boilerplate dramatically and made cache invalidation bugs almost disappear, because there was only ever one cache to reason about for server data.
MD,
            ],
            [
                'slug' => 'offline-first-flutter-sync',
                'title' => 'Designing Offline-First Sync for Flutter Apps in Low-Connectivity Markets',
                'category' => 'Mobile',
                'tags' => ['Flutter', 'Offline', 'Mobile'],
                'excerpt' => 'Lessons from building InvoiceFlow Africa and Vendex POS, both of which must work with zero signal.',
                'reading_time' => 9,
                'published_at' => '2026-04-22',
                'content' => <<<'MD'
Building for markets where connectivity is intermittent, not absent, changes the design brief. The app can't just show an error screen when offline — it has to keep working.

The core pattern: a local-first data layer (SQLite or Hive) that the UI always reads from, and a background sync service that reconciles with the server opportunistically. Writes are queued locally with a client-generated UUID so retries are idempotent on the server side.

Conflict resolution is the hard part. For POS sales, last-write-wins is wrong — you need server-side stock validation that can reject a sync and surface it to the user rather than silently overselling inventory.
MD,
            ],
            [
                'slug' => 'role-based-access-laravel-sanctum',
                'title' => 'Role-Based Access Control with Laravel Sanctum and Spatie Permission',
                'category' => 'Laravel',
                'tags' => ['Laravel', 'Sanctum', 'Security'],
                'excerpt' => 'A practical setup for SPA authentication with fine-grained roles and permissions.',
                'reading_time' => 8,
                'published_at' => '2026-03-11',
                'content' => <<<'MD'
Sanctum handles authentication; it deliberately doesn't handle authorization. Pairing it with spatie/laravel-permission gives you roles and permissions without building that system yourself.

For SPA auth, the key detail people miss is the CSRF cookie flow: hit /sanctum/csrf-cookie before login, keep withCredentials true on the client, and make sure your session domain matches across frontend and backend origins in local development.

From there, permission checks belong in policies, not scattered if-statements in controllers — it keeps authorization logic testable and in one place per model.
MD,
            ],
            [
                'slug' => 'picking-a-tech-stack-for-african-startups',
                'title' => 'Picking a Tech Stack for Startups Building in Africa',
                'category' => 'Architecture',
                'tags' => ['Architecture', 'Startups'],
                'excerpt' => 'Bandwidth, hosting costs, and payment rails change the calculus most stack-choice articles ignore.',
                'reading_time' => 6,
                'published_at' => '2026-02-18',
                'content' => <<<'MD'
Most "how to choose a tech stack" advice assumes US-grade bandwidth and hosting proximity. Building for markets across Ghana and the wider region means designing around variable connectivity and higher relative hosting costs from day one.

Laravel remains a strong default backend choice: mature ecosystem, cheap to host, huge local talent pool. On the frontend, a lean React SPA with aggressive code-splitting beats heavier meta-frameworks when every kilobyte matters on 3G.

Payments deserve special attention early — mobile money integration (via gateways like Paystack) isn't a nice-to-have, it's often the primary payment method your users expect.
MD,
            ],
            [
                'slug' => 'what-freelancing-taught-me',
                'title' => 'What Freelance Engineering Taught Me About Scoping Projects',
                'category' => 'Career',
                'tags' => ['Career', 'Freelance'],
                'excerpt' => 'The projects that went badly almost always had one thing in common: a scope that was never actually written down.',
                'reading_time' => 5,
                'published_at' => '2026-01-09',
                'content' => <<<'MD'
Every difficult client engagement I can remember traces back to scope that lived only in conversation. Now, no project starts without a written scope document the client signs off on — what's included, what's explicitly excluded, and what counts as a change request.

The second lesson: charge for the discovery phase. Free scoping calls select for clients who don't value planning, which correlates strongly with scope creep later.

The third: build in a structured revision policy up front. "Two rounds of revisions included" prevents the slow drift of "just one more small thing" that erodes margin on fixed-price work.
MD,
            ],
        ];

        foreach ($posts as $data) {
            $data['author_id'] = $authorId;
            $data['is_published'] = true;
            BlogPost::updateOrCreate(['slug' => $data['slug']], $data);
        }
    }
}
