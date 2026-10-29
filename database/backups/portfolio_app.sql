-- MySQL dump 10.13  Distrib 9.3.0, for macos14.7 (x86_64)
--
-- Host: localhost    Database: portfolio_app
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_post_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comments_blog_post_id_foreign` (`blog_post_id`),
  CONSTRAINT `blog_comments_blog_post_id_foreign` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comments`
--

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` json DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `reading_time` int unsigned NOT NULL DEFAULT '1',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  KEY `blog_posts_author_id_foreign` (`author_id`),
  CONSTRAINT `blog_posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_posts`
--

LOCK TABLES `blog_posts` WRITE;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
INSERT INTO `blog_posts` VALUES (1,'Laravel','[\"Laravel\", \"Architecture\", \"API\"]',1,'Structuring Large Laravel APIs for Long-Term Maintainability','structuring-large-laravel-apis','How I organize service classes, form requests, and API resources in Laravel projects that need to survive years of feature growth.','Large Laravel codebases rot for predictable reasons: fat controllers, business logic leaking into models, and no consistent place for validation.\n\nThe pattern that has held up best across a dozen production apps is a strict separation between HTTP concerns (controllers, form requests, API resources) and domain logic (service classes, actions). Controllers stay thin — they validate, delegate to a service, and format a response. Everything that could be unit-tested without booting HTTP lives in a service or action class.\n\nForm Requests handle authorization and validation exclusively. API Resources own response shaping, so the frontend never sees raw model attributes. This alone eliminates most of the \"why does this endpoint return different fields sometimes\" bugs.\n\nThe payoff shows up eighteen months in, when a new hire can trace a feature from route to database without reading the whole app.',7,1,'2026-06-02 00:00:00','2026-07-29 16:53:35','2026-07-29 16:53:35'),(2,'React','[\"React\", \"State Management\"]',1,'React Query vs Redux: What I Actually Reach For in 2026','react-query-vs-redux-in-2026','Server state and client state are different problems. Most apps only need one of these tools, not both.','The mistake I see most often is teams reaching for Redux to store data that came from an API. That\'s server state — it has its own cache, its own staleness, its own retry semantics. React Query models that correctly out of the box.\n\nRedux (or a lighter Context-based store) still earns its place for genuinely client-only state: UI toggles, multi-step form state, optimistic local-only preferences.\n\nOn recent projects, splitting these two concerns cut boilerplate dramatically and made cache invalidation bugs almost disappear, because there was only ever one cache to reason about for server data.',6,1,'2026-05-14 00:00:00','2026-07-29 16:53:35','2026-07-29 16:53:35'),(3,'Mobile','[\"Flutter\", \"Offline\", \"Mobile\"]',1,'Designing Offline-First Sync for Flutter Apps in Low-Connectivity Markets','offline-first-flutter-sync','Lessons from building InvoiceFlow Africa and Vendex POS, both of which must work with zero signal.','Building for markets where connectivity is intermittent, not absent, changes the design brief. The app can\'t just show an error screen when offline — it has to keep working.\n\nThe core pattern: a local-first data layer (SQLite or Hive) that the UI always reads from, and a background sync service that reconciles with the server opportunistically. Writes are queued locally with a client-generated UUID so retries are idempotent on the server side.\n\nConflict resolution is the hard part. For POS sales, last-write-wins is wrong — you need server-side stock validation that can reject a sync and surface it to the user rather than silently overselling inventory.',9,1,'2026-04-22 00:00:00','2026-07-29 16:53:35','2026-07-29 16:53:35'),(4,'Laravel','[\"Laravel\", \"Sanctum\", \"Security\"]',1,'Role-Based Access Control with Laravel Sanctum and Spatie Permission','role-based-access-laravel-sanctum','A practical setup for SPA authentication with fine-grained roles and permissions.','Sanctum handles authentication; it deliberately doesn\'t handle authorization. Pairing it with spatie/laravel-permission gives you roles and permissions without building that system yourself.\n\nFor SPA auth, the key detail people miss is the CSRF cookie flow: hit /sanctum/csrf-cookie before login, keep withCredentials true on the client, and make sure your session domain matches across frontend and backend origins in local development.\n\nFrom there, permission checks belong in policies, not scattered if-statements in controllers — it keeps authorization logic testable and in one place per model.',8,1,'2026-03-11 00:00:00','2026-07-29 16:53:35','2026-07-29 16:53:35'),(5,'Architecture','[\"Architecture\", \"Startups\"]',1,'Picking a Tech Stack for Startups Building in Africa','picking-a-tech-stack-for-african-startups','Bandwidth, hosting costs, and payment rails change the calculus most stack-choice articles ignore.','Most \"how to choose a tech stack\" advice assumes US-grade bandwidth and hosting proximity. Building for markets across Ghana and the wider region means designing around variable connectivity and higher relative hosting costs from day one.\n\nLaravel remains a strong default backend choice: mature ecosystem, cheap to host, huge local talent pool. On the frontend, a lean React SPA with aggressive code-splitting beats heavier meta-frameworks when every kilobyte matters on 3G.\n\nPayments deserve special attention early — mobile money integration (via gateways like Paystack) isn\'t a nice-to-have, it\'s often the primary payment method your users expect.',6,1,'2026-02-18 00:00:00','2026-07-29 16:53:35','2026-07-29 16:53:35'),(6,'Career','[\"Career\", \"Freelance\"]',1,'What Freelance Engineering Taught Me About Scoping Projects','what-freelancing-taught-me','The projects that went badly almost always had one thing in common: a scope that was never actually written down.','Every difficult client engagement I can remember traces back to scope that lived only in conversation. Now, no project starts without a written scope document the client signs off on — what\'s included, what\'s explicitly excluded, and what counts as a change request.\n\nThe second lesson: charge for the discovery phase. Free scoping calls select for clients who don\'t value planning, which correlates strongly with scope creep later.\n\nThe third: build in a structured revision policy up front. \"Two rounds of revisions included\" prevents the slow drift of \"just one more small thing\" that erodes margin on fixed-price work.',5,1,'2026-01-09 00:00:00','2026-07-29 16:53:35','2026-07-29 16:53:35');
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date` date NOT NULL,
  `scheduled_time` time NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_logos`
--

DROP TABLE IF EXISTS `client_logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_logos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_logos`
--

LOCK TABLES `client_logos` WRITE;
/*!40000 ALTER TABLE `client_logos` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_07_29_151802_create_media_table',1),(5,'2026_07_29_151802_create_permission_tables',1),(6,'2026_07_29_151802_create_personal_access_tokens_table',1),(7,'2026_07_29_152248_create_products_table',1),(8,'2026_07_29_152248_create_projects_table',1),(9,'2026_07_29_152248_create_services_table',1),(10,'2026_07_29_152249_create_blog_posts_table',1),(11,'2026_07_29_152249_create_bookings_table',1),(12,'2026_07_29_152249_create_testimonials_table',1),(13,'2026_07_29_152250_create_messages_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` json DEFAULT NULL,
  `pricing` json DEFAULT NULL,
  `demo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_free_trial` tinyint(1) NOT NULL DEFAULT '0',
  `has_docs` tinyint(1) NOT NULL DEFAULT '0',
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `reviews_count` int unsigned NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Retail','Vendex POS','vendex-pos','Offline-first point of sale for multi-branch retail','[\"Inventory\", \"Sales\", \"Receipts\", \"Customers\", \"Suppliers\", \"Branches\", \"Reports\", \"Offline Sync\"]','{\"oneTime\": {\"price\": 1200, \"currency\": \"USD\"}, \"subscription\": [{\"tier\": \"Starter\", \"price\": 29, \"period\": \"mo\", \"features\": [\"1 Branch\", \"Core POS\", \"Email Support\"]}, {\"tier\": \"Growth\", \"price\": 79, \"period\": \"mo\", \"features\": [\"5 Branches\", \"Offline Sync\", \"Priority Support\"]}, {\"tier\": \"Enterprise\", \"price\": 199, \"period\": \"mo\", \"features\": [\"Unlimited Branches\", \"Dedicated Support\", \"Custom Integrations\"]}]}','https://vendex.ofi-cia.com',1,1,4.80,42,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(2,'Education','School Management Suite','school-management','Admissions to report cards, fully managed','[\"Student Management\", \"Fees\", \"Attendance\", \"Examinations\", \"SMS\", \"Parents Portal\"]','{\"oneTime\": {\"price\": 1800, \"currency\": \"USD\"}, \"subscription\": [{\"tier\": \"Basic\", \"price\": 39, \"period\": \"mo\", \"features\": [\"Up to 300 Students\", \"Core Modules\"]}, {\"tier\": \"Standard\", \"price\": 99, \"period\": \"mo\", \"features\": [\"Up to 1500 Students\", \"SMS Included\"]}, {\"tier\": \"Premium\", \"price\": 249, \"period\": \"mo\", \"features\": [\"Unlimited Students\", \"Multi-campus\"]}]}',NULL,1,1,4.90,31,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(3,'Non-profit','Ecclesia Church Suite','church-management','Membership, giving, and attendance in one dashboard','[\"Attendance\", \"Departments\", \"Biometric Integration\", \"Tithes & Offerings\", \"Events\"]','{\"oneTime\": {\"price\": 1500, \"currency\": \"USD\"}, \"subscription\": [{\"tier\": \"Congregation\", \"price\": 25, \"period\": \"mo\", \"features\": [\"Up to 500 Members\"]}, {\"tier\": \"Ministry\", \"price\": 69, \"period\": \"mo\", \"features\": [\"Up to 3000 Members\", \"Biometrics\"]}]}','https://ecclesia.ofi-cia.com',1,1,4.70,24,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(4,'Hospitality','Aspen Restaurant Suite','restaurant-management','Kitchen to checkout, unified in real time','[\"Kitchen Display\", \"Orders\", \"Reservations\", \"POS\", \"Inventory\", \"Delivery\"]','{\"oneTime\": {\"price\": 1600, \"currency\": \"USD\"}, \"subscription\": [{\"tier\": \"Cafe\", \"price\": 35, \"period\": \"mo\", \"features\": [\"1 Outlet\"]}, {\"tier\": \"Restaurant\", \"price\": 89, \"period\": \"mo\", \"features\": [\"Up to 3 Outlets\"]}]}','https://aspen.ofi-cia.com',1,1,4.60,18,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(5,'Productivity','Lixxie Task Manager','task-management','Kanban, time tracking, and invoicing for agile teams','[\"Tasks\", \"Teams\", \"Kanban\", \"Invoices\", \"Time Tracking\", \"Subscriptions\"]','{\"oneTime\": null, \"subscription\": [{\"tier\": \"Solo\", \"price\": 9, \"period\": \"mo\", \"features\": [\"1 User\", \"3 Projects\"]}, {\"tier\": \"Team\", \"price\": 29, \"period\": \"mo\", \"features\": [\"Up to 15 Users\", \"Unlimited Projects\"]}, {\"tier\": \"Agency\", \"price\": 79, \"period\": \"mo\", \"features\": [\"Unlimited Users\", \"White-label\"]}]}','https://lixxie.ofi-cia.com',1,1,4.80,55,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(6,'Retail','Inventory Pro','inventory-system','Real-time stock tracking across warehouses','[\"Stock Tracking\", \"Purchase Orders\", \"Low-stock Alerts\", \"Multi-warehouse\", \"Reports\"]','{\"oneTime\": {\"price\": 900, \"currency\": \"USD\"}, \"subscription\": [{\"tier\": \"Standard\", \"price\": 45, \"period\": \"mo\", \"features\": [\"3 Warehouses\"]}]}',NULL,0,1,4.50,13,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(7,'HR','PayrollHQ','payroll-software','Payroll, payslips, and statutory deductions handled','[\"Payslips\", \"Tax Calculations\", \"SSNIT Deductions\", \"Direct Deposit\", \"Reports\"]','{\"oneTime\": {\"price\": 1100, \"currency\": \"USD\"}, \"subscription\": [{\"tier\": \"Business\", \"price\": 59, \"period\": \"mo\", \"features\": [\"Up to 100 Employees\"]}]}',NULL,1,1,4.60,9,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(8,'Finance','InvoiceFlow','invoice-software','Create, send, and track invoices from anywhere','[\"Invoices\", \"Clients\", \"Payments\", \"Reports\", \"Offline Mode\"]','{\"oneTime\": null, \"subscription\": [{\"tier\": \"Free\", \"price\": 0, \"period\": \"mo\", \"features\": [\"5 Invoices/mo\"]}, {\"tier\": \"Pro\", \"price\": 12, \"period\": \"mo\", \"features\": [\"Unlimited Invoices\", \"Custom Branding\"]}]}',NULL,1,1,4.90,61,1,'2026-07-29 16:53:35','2026-07-29 16:53:35');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tech` json DEFAULT NULL,
  `features` json DEFAULT NULL,
  `problem` text COLLATE utf8mb4_unicode_ci,
  `solution` text COLLATE utf8mb4_unicode_ci,
  `architecture` text COLLATE utf8mb4_unicode_ci,
  `challenges` json DEFAULT NULL,
  `results` json DEFAULT NULL,
  `demo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_links` json DEFAULT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_testimonial` text COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Web Platform','School Management System','school-management-system','An all-in-one platform for schools covering admissions, fees, attendance, examinations, and dedicated portals for parents, teachers, and admins.','[\"Laravel\", \"React\", \"MySQL\", \"Sanctum\"]','[\"Student Management\", \"Fees & Billing\", \"Attendance Tracking\", \"Examinations & Report Cards\", \"SMS Notifications\", \"Parents Portal\", \"Teachers Portal\", \"Admin Dashboard\"]','A cluster of private schools were managing admissions, fees, and grading across spreadsheets and paper registers, causing lost records and slow parent communication.','Built a unified Laravel + React platform with role-based portals for admins, teachers, and parents, replacing manual processes with real-time dashboards and automated SMS updates.','Laravel API backend with Sanctum-secured role-based access, MySQL for relational student/fee data, queued jobs for SMS/email notifications, and a React SPA frontend consuming the API.','[\"Modelling complex fee structures with discounts, installments, and scholarships\", \"Keeping attendance and grading fast on low-bandwidth school networks\", \"Designing a permissions system that scales across dozens of staff roles\"]','[\"70% reduction in time spent on fee reconciliation\", \"Parent SMS updates cut absentee follow-up calls by half\", \"Report card generation time dropped from days to minutes\"]',NULL,NULL,NULL,'School Administrator','Headteacher','The system transformed how we run the school. Fees, attendance, and report cards that used to take our staff days now take minutes.',1,1,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(2,'Web Platform','Ecclesia — Church Management System','ecclesia-church-management','A church management platform handling membership, attendance, biometric check-in, tithes & offerings, departments, and events.','[\"Laravel\", \"React\", \"MySQL\", \"Biometrics API\"]','[\"Attendance Tracking\", \"Departments\", \"Biometric Integration\", \"SMS\", \"Tithes & Offerings\", \"Events\", \"Reports\", \"Dashboard\"]','A growing congregation needed accurate attendance, giving records, and department coordination beyond what manual registers could support.','Delivered a dashboard-driven system with biometric check-in devices integrated over a local API, automated giving records, and department/event management.','Laravel API with biometric-device webhook ingestion, MySQL reporting schema, scheduled jobs for weekly/monthly financial reports, React dashboard for church leadership.','[\"Integrating third-party biometric hardware with reliable offline queuing\", \"Building financial reports that satisfy both leadership and auditors\", \"Multi-branch data isolation for a church with several campuses\"]','[\"Attendance capture time dropped from ~20 minutes to under 2 minutes per service\", \"Giving reconciliation now fully digital and auditable\", \"Department leaders self-serve their own reports\"]','https://ecclesia.ofi-cia.com',NULL,NULL,'Church Administrator','Operations Lead','Ecclesia gave our leadership real visibility into attendance and giving for the first time. It\'s become essential to how we run the church.',1,1,2,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(3,'Web Platform','Aspen — Restaurant Management System','aspen-restaurant-management','A restaurant operations platform spanning kitchen display, orders, table reservations, POS, inventory, delivery, and reporting.','[\"Laravel\", \"React\", \"MySQL\", \"POS\"]','[\"Kitchen Display\", \"Orders\", \"Reservations\", \"POS\", \"Inventory\", \"Reports\", \"Delivery\"]','A multi-outlet restaurant group needed to unify orders, kitchen workflow, and inventory across front-of-house, kitchen, and delivery.','Built a real-time order pipeline from POS to kitchen display screens, with live inventory deduction and a reservations calendar.','Laravel API with WebSocket-driven live order updates, MySQL for menu/inventory data, POS terminal client, and a React admin dashboard for reporting.','[\"Sub-second order sync between POS terminals and kitchen displays\", \"Inventory deduction accuracy across combo items and modifiers\", \"Reservation and walk-in conflicts during peak hours\"]','[\"Average order-to-kitchen latency under 1 second\", \"Inventory waste reporting reduced stock discrepancies by 35%\", \"Reservation no-shows tracked and reduced with automated reminders\"]','https://aspen.ofi-cia.com',NULL,NULL,'Restaurant Manager','Operations Manager, Aspen','Our kitchen and front-of-house finally work off the same real-time picture. Service is faster and far less chaotic.',1,1,3,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(4,'Web Platform','Vendex POS','vendex-pos','A multi-branch point-of-sale system with offline-first sales sync, supplier management, and detailed reporting.','[\"Laravel\", \"React\", \"MySQL\", \"Offline Sync\"]','[\"Inventory\", \"Sales\", \"Receipts\", \"Customers\", \"Suppliers\", \"Branches\", \"Reports\", \"Offline Sync\"]','Retail chains with unreliable internet needed a POS that kept selling during outages without losing transaction data.','Built an offline-first POS client that queues sales locally and syncs to the central Laravel API once connectivity returns, with conflict-safe merge logic.','Local-first storage layer in the POS client, Laravel API with idempotent sync endpoints, MySQL as source of truth, branch-level data partitioning.','[\"Conflict resolution when the same stock is sold offline across branches\", \"Keeping receipt printing consistent across thermal printer models\", \"Supplier and purchase-order workflows that stay in sync with live stock\"]','[\"Zero lost sales during internet outages since launch\", \"Multi-branch stock visibility in a single dashboard\", \"Supplier reconciliation time cut significantly\"]','https://vendex.ofi-cia.com',NULL,NULL,'Retail Chain Owner','Founder','Vendex keeps ringing up sales even when our internet goes down — that alone paid for itself in the first month.',0,1,4,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(5,'Web Platform','Lixxie — Project Management','lixxie-project-management','A project & team management SaaS with Kanban boards, invoicing, time tracking, and subscription billing.','[\"Laravel\", \"React\", \"MySQL\", \"Stripe\"]','[\"Tasks\", \"Teams\", \"Kanban\", \"Invoices\", \"Time Tracking\", \"Projects\", \"Subscriptions\", \"Reports\"]','Small agencies needed a lightweight alternative to expensive project-management SaaS, tailored to how African freelance teams invoice clients.','Delivered a Kanban-based project tool with built-in time tracking that converts logged hours directly into client invoices.','Laravel API with Cashier-driven subscription billing, MySQL for projects/tasks/time entries, React drag-and-drop Kanban UI.','[\"Real-time drag-and-drop board updates across multiple team members\", \"Accurate time-to-invoice conversion across multiple currencies\", \"Subscription tier gating without disrupting active projects\"]','[\"Agencies cut invoicing prep time from hours to minutes\", \"Kanban adoption led to measurably faster task turnaround\", \"Built-in subscriptions replaced three separate paid tools for early customers\"]','https://lixxie.ofi-cia.com',NULL,NULL,'Agency Founder','Creative Director','Lixxie replaced our Trello, Toggl, and invoicing app with one clean tool our whole team actually uses.',0,1,5,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(6,'Mobile App','InvoiceFlow Africa','invoiceflow-africa','A Flutter invoicing app for African freelancers and small businesses with offline support and mobile-money-aware payments.','[\"Flutter\", \"Laravel\", \"MySQL\"]','[\"Invoices\", \"Clients\", \"Payments\", \"Reports\", \"Offline Mode\"]','Freelancers and micro-businesses across Africa needed simple invoicing that worked offline and understood local payment habits.','Built a Flutter app that creates, sends, and tracks invoices offline, syncing to a Laravel backend once online, with clear payment status tracking.','Flutter client with local SQLite cache, Laravel REST API, background sync service, PDF invoice generation.','[\"Reliable offline-to-online sync without duplicate invoices\", \"PDF generation that renders identically across devices\", \"Designing for low-end Android devices with limited storage\"]','[\"Used by hundreds of small businesses across multiple countries\", \"Average invoice creation time under 60 seconds\", \"Consistently rated highly for offline reliability\"]',NULL,NULL,'{\"appStore\": \"#\", \"googlePlay\": \"#\"}','Freelance Contractor','App User','I create and send invoices between job sites with no signal, and they go out the moment I\'m back online. Exactly what I needed.',0,1,6,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(7,'Mobile App','BuildWithGKB','buildwithgkb','A property marketplace connecting buyers, artisans, and landlords with bookings, messaging, and integrated payments.','[\"Flutter\", \"Laravel\", \"MySQL\", \"Maps API\"]','[\"Property Marketplace\", \"Artisans\", \"Payments\", \"Messaging\", \"Booking\", \"Maps\"]','Property buyers and artisans lacked a trusted, unified marketplace to discover listings, hire vetted tradespeople, and transact safely.','Built a two-sided Flutter marketplace with map-based property discovery, in-app messaging, artisan booking, and escrow-style payments.','Flutter client with Google Maps integration, Laravel API with role-based marketplace logic, real-time messaging via WebSockets, payment gateway integration.','[\"Trust & verification flow for artisans and listings\", \"Real-time chat at scale between buyers and sellers\", \"Location-based search performance across dense listings\"]','[\"Marketplace live with verified artisans and active listings\", \"In-app messaging reduced off-platform deal leakage\", \"Booking-to-completion flow fully trackable end to end\"]',NULL,NULL,'{\"appStore\": \"#\", \"googlePlay\": \"#\"}','Property Buyer','App User','BuildWithGKB made it possible for us to trust who we were hiring and hold conversations, bookings, and payment all in one place.',0,1,7,'2026-07-29 16:53:35','2026-07-29 16:53:35');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2026-07-29 16:53:34','2026-07-29 16:53:34');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `includes` json DEFAULT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Custom Web Development','custom-web-development','code','Bespoke web applications built on Laravel & React, engineered for scale from day one.','[\"Architecture & planning\", \"Laravel API + React frontend\", \"Testing & QA\", \"Deployment & handover\"]',0,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(2,'Mobile App Development','mobile-app-development','mobile','Cross-platform apps in React Native & Flutter that feel native on iOS and Android.','[\"UI/UX for mobile\", \"React Native / Flutter build\", \"App Store & Play Store launch\", \"Push notifications\"]',1,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(3,'API Development','api-development','api','Secure, documented REST & GraphQL APIs designed for multiple client apps.','[\"Sanctum / OAuth2 auth\", \"Rate limiting & versioning\", \"OpenAPI docs\", \"Webhooks & queues\"]',2,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(4,'POS Systems','pos-systems','cart','Point-of-sale platforms with offline sync, receipts, and multi-branch inventory.','[\"Sales & checkout flow\", \"Inventory sync\", \"Receipt printing\", \"Offline-first support\"]',3,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(5,'School Management Systems','school-management-systems','school','End-to-end platforms for admissions, fees, attendance, exams, and parent portals.','[\"Student & staff records\", \"Fees & billing\", \"Exams & report cards\", \"SMS/email notifications\"]',4,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(6,'Church Management Systems','church-management-systems','church','Membership, attendance, tithes & offerings, and biometric check-in for congregations.','[\"Membership & departments\", \"Attendance & biometrics\", \"Tithes & offerings\", \"Event management\"]',5,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(7,'Business Automation','business-automation','automation','Workflow automation that removes manual, repetitive work from your operations.','[\"Process mapping\", \"Custom internal tools\", \"Third-party integrations\", \"Reporting dashboards\"]',6,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(8,'UI/UX Design','ui-ux-design','design','Interfaces that are as usable as they are beautiful, backed by real design systems.','[\"User research\", \"Wireframes & prototypes\", \"Design systems\", \"Usability testing\"]',7,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(9,'Consultancy','consultancy','consult','Technical advisory for founders and teams making architecture or hiring decisions.','[\"Tech stack audits\", \"Code reviews\", \"Scaling strategy\", \"Team mentorship\"]',8,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(10,'Maintenance','maintenance','wrench','Ongoing support, bug fixes, and feature updates for existing applications.','[\"SLA-backed support\", \"Security patching\", \"Feature iterations\", \"Monitoring\"]',9,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(11,'Cloud Deployment','cloud-deployment','cloud','Dockerized deployments on Nginx with CI/CD pipelines that ship safely.','[\"Docker & Nginx setup\", \"GitHub Actions CI/CD\", \"Zero-downtime deploys\", \"Env & secrets management\"]',10,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(12,'Performance Optimization','performance-optimization','speed','Faster load times, leaner queries, and better Core Web Vitals across the stack.','[\"Query & index tuning\", \"Frontend bundle audits\", \"Caching strategy\", \"Lighthouse scoring\"]',11,1,'2026-07-29 16:53:35','2026-07-29 16:53:35');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('5MnDoejpcgzv4peATG6vQuhh37tilKX8LAnOAOcB',NULL,'127.0.0.1','curl/8.7.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVZwUUZnVGwwZzd2YzF0YW1FYmhXMFVXUzlENTdITGR3aTB5TzRKViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAzMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1785344083),('5WSULlKNbcWCzBIlEClEhY1mjFPAmN7iw4qFS42W',NULL,'127.0.0.1','curl/8.7.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU5Oa3JpT3JrT1R3Q21HSVY2REtnN2NFRUdaMUlveDhKZWNKM05LSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAzMC9hcGkvYWRtaW4vc3RhdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1785344126),('74uS6Dmx8IqNdKqPggvpC5qlQncYozAGFnIeswzv',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Claude/1.24012.9 Chrome/148.0.7778.280 Electron/42.7.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU1IMHJzSGtXUlQ1UjJhWkJVcnVhaGFiaDJyODNna1NnR3o4VE1TZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAzMC9hcGkvcHJvamVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1785365371),('7rezZYpJFEhHg0zYuJa3d055FW9mwefBWyOLNA3t',NULL,'127.0.0.1','curl/8.7.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiekVsUmJvVmFuaUtMTHFlZDkzTzBFbkZtVDFoelFqWkRYeDFieWhqTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAzMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1785344126),('dCV2fElnTHbS0QGHB8OT6v8kgQ22rHtaKsFsSTPs',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Claude/1.24012.9 Chrome/148.0.7778.280 Electron/42.7.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNzVHZzlYQXk5Nk9rZUtSakhJSUNvSFJ3SGVDblV2U2dyajhBOFN2QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAzMC9hcGkvYWRtaW4vcHJvamVjdHMiO3M6NToicm91dGUiO3M6MTQ6InByb2plY3RzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiODk5ZDMzYjc5ODU2ZGVlOWU0MzQ2NDI5MGI5ZmJjNmYzOGRhZDk2YzYwMDE1MmIzN2NjNmUwN2Y1ZDBkOTRiZiI7fQ==',1785352468),('F1RBFLoxF8dvNdyQAuZjTJlxwKCrsBXtPLhvQdXl',NULL,'127.0.0.1','curl/8.7.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUppSHdoOUk4U0o0YkRNZ2ZWTjBzMDRTdFRMdkhvMU9tT2NRU1JsRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAzMC9hcGkvYWRtaW4vc3RhdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1785344163),('K9IjMHbWIipN6Kcu3m4ppIdFy6zJkhFjljB4J9Ku',NULL,'127.0.0.1','curl/8.7.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3RMVUdoOUlKeTg0cFFUeTJiaGh6b2pJc3laOTFwdTdBdVJSazFheiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAzMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1785344163),('OmIuypOK3frHeoHFC3tz8kFYx9xleWR9Nd71k6Dy',1,'127.0.0.1','curl/8.7.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV2hLOHpwb3hZRWlPcUs0OEZGaW96bU5FdEJLcUpjZjI2cXJ4MmtQYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAzMC9hcGkvYWRtaW4vc3RhdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6Ijg5OWQzM2I3OTg1NmRlZTllNDM0NjQyOTBiOWZiYzZmMzhkYWQ5NmM2MDAxNTJiMzdjYzZlMDdmNWQwZDk0YmYiO30=',1785344240),('qcCeVt5GRHskLquhUsO12OOi1lQcjEgUaLGoVeRd',NULL,'127.0.0.1','curl/8.7.1','YToyOntzOjY6Il90b2tlbiI7czo0MDoiR3BKYnJOS3VXU1hZT2h5eERReDdUa0xKSm1QUDZ6S01iWGJ0WmZkcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1785344126),('T7cocGHGzPiZyPbtcLiyjjwCjzuvYL55vDFV5ZN9',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiamxaRTdKYnh3SDN4VEFVTGZVbzZydG9uTEtENm5JOEtMYksyNEFUdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1785346380),('TNfwjHaUBbrItJs5Qje9iAtSQbml6RzXR5mauzB4',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Claude/1.24012.9 Chrome/148.0.7778.280 Electron/42.7.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNUxaSEpJdFFoNGtoMDlwaUNPeVRybTZBaFQ4eWxXOHZTczQwYUU4eCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAzMC9hcGkvYXV0aC9tZSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiODk5ZDMzYjc5ODU2ZGVlOWU0MzQ2NDI5MGI5ZmJjNmYzOGRhZDk2YzYwMDE1MmIzN2NjNmUwN2Y1ZDBkOTRiZiI7fQ==',1785368599),('tSVXM4m39L2APF0uHmwXmZXvdcwEuRG68SZa0Ibr',NULL,'127.0.0.1','curl/8.7.1','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUUx1czhzQ1Qwd0RYTGZnUk1EaTAxNEVCQjhpWUVIYThtWmt4NXRBNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1785344163),('UBQKTsS8eJfP8Wr3RwvB7vMDQ7uVKMRlSAjkdftv',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Claude/1.24012.9 Chrome/148.0.7778.280 Electron/42.7.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXhSZG1NeExLandCZTJrajFyTUY0THg4VjRpaEpoWElrSk95Z2dMQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAzMC9hcGkvcHJvamVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1785345595),('yiMQ4kTlknsvyhmIVUZgoxMhLqxqTtaqz2UMVwCT',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Claude/1.24012.9 Chrome/148.0.7778.280 Electron/42.7.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVRWVXV5UUpaRFNHQkVsVVJUWk9vekZaSzM4OVNhZ3NJT1hpT1lyaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAzMC9hcGkvYmxvZyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1785365371),('ZOxbMyR9CqDmwCcWq81XwQPg7pIYHLmOxli8Utf5',NULL,'127.0.0.1','curl/8.7.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoicWlsYTVTQkhqSXJoenpVSDBFclBTMXllVnlhMTBwaVFNWHhHVUtmZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAzMC9hcGkvcHJvamVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1785366994);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint unsigned NOT NULL DEFAULT '5',
  `quote` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Kwame Ofori-Antwi','Headteacher','Amanfo International School',5,'The School Management System transformed how we run admissions, fees, and grading. What used to take our staff days now takes minutes, and parents finally have real visibility into their children\'s progress.',NULL,1,0,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(2,'Pastor Emmanuel Boateng','Operations Lead','Ecclesia Church',5,'Ecclesia gave our leadership real visibility into attendance and giving for the first time. Biometric check-in alone saved us hours every Sunday.',NULL,1,1,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(3,'Ama Serwaa','Operations Manager','Aspen Restaurant Group',5,'Our kitchen and front-of-house finally work off the same real-time picture. Service is faster and far less chaotic, especially during peak hours.',NULL,1,2,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(4,'Yaw Darko','Founder','Darko Retail Group',5,'Vendex keeps ringing up sales even when our internet goes down — that alone paid for itself in the first month across our five branches.',NULL,1,3,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(5,'Efua Mensah','Creative Director','Studio Nine Agency',5,'Lixxie replaced our Trello, Toggl, and invoicing app with one clean tool our whole team actually uses every day.',NULL,1,4,'2026-07-29 16:53:35','2026-07-29 16:53:35'),(6,'Nana Kwaku Duah','Founder','BuildWithGKB',4,'Michael understood our marketplace vision immediately and shipped a product our users trust with real transactions.',NULL,1,5,'2026-07-29 16:53:35','2026-07-29 16:53:35');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Michael Awuah Sarpong','michaelmingle.mas@gmail.com','2026-07-29 16:53:34','$2y$12$PDjIxCrRmq7URYbESR0pxuP4sB.df0DoCgLR5y8eCtiKHUnECji.a',NULL,'2026-07-29 16:53:35','2026-07-29 16:53:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'portfolio_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-30  0:01:23
