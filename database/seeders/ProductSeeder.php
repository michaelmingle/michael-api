<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $products = [
            [
                'slug' => 'vendex-pos',
                'name' => 'Vendex POS',
                'category' => 'Retail',
                'tagline' => 'Offline-first point of sale for multi-branch retail',
                'rating' => 4.8,
                'reviews_count' => 42,
                'features' => ['Inventory', 'Sales', 'Receipts', 'Customers', 'Suppliers', 'Branches', 'Reports', 'Offline Sync'],
                'pricing' => [
                    'oneTime' => ['price' => 1200, 'currency' => 'USD'],
                    'subscription' => [
                        ['tier' => 'Starter', 'price' => 29, 'period' => 'mo', 'features' => ['1 Branch', 'Core POS', 'Email Support']],
                        ['tier' => 'Growth', 'price' => 79, 'period' => 'mo', 'features' => ['5 Branches', 'Offline Sync', 'Priority Support']],
                        ['tier' => 'Enterprise', 'price' => 199, 'period' => 'mo', 'features' => ['Unlimited Branches', 'Dedicated Support', 'Custom Integrations']],
                    ],
                ],
                'demo_url' => 'https://vendex.ofi-cia.com',
                'has_free_trial' => true,
                'has_docs' => true,
            ],
            [
                'slug' => 'school-management',
                'name' => 'School Management Suite',
                'category' => 'Education',
                'tagline' => 'Admissions to report cards, fully managed',
                'rating' => 4.9,
                'reviews_count' => 31,
                'features' => ['Student Management', 'Fees', 'Attendance', 'Examinations', 'SMS', 'Parents Portal'],
                'pricing' => [
                    'oneTime' => ['price' => 1800, 'currency' => 'USD'],
                    'subscription' => [
                        ['tier' => 'Basic', 'price' => 39, 'period' => 'mo', 'features' => ['Up to 300 Students', 'Core Modules']],
                        ['tier' => 'Standard', 'price' => 99, 'period' => 'mo', 'features' => ['Up to 1500 Students', 'SMS Included']],
                        ['tier' => 'Premium', 'price' => 249, 'period' => 'mo', 'features' => ['Unlimited Students', 'Multi-campus']],
                    ],
                ],
                'demo_url' => null,
                'has_free_trial' => true,
                'has_docs' => true,
            ],
            [
                'slug' => 'church-management',
                'name' => 'Ecclesia Church Suite',
                'category' => 'Non-profit',
                'tagline' => 'Membership, giving, and attendance in one dashboard',
                'rating' => 4.7,
                'reviews_count' => 24,
                'features' => ['Attendance', 'Departments', 'Biometric Integration', 'Tithes & Offerings', 'Events'],
                'pricing' => [
                    'oneTime' => ['price' => 1500, 'currency' => 'USD'],
                    'subscription' => [
                        ['tier' => 'Congregation', 'price' => 25, 'period' => 'mo', 'features' => ['Up to 500 Members']],
                        ['tier' => 'Ministry', 'price' => 69, 'period' => 'mo', 'features' => ['Up to 3000 Members', 'Biometrics']],
                    ],
                ],
                'demo_url' => 'https://ecclesia.ofi-cia.com',
                'has_free_trial' => true,
                'has_docs' => true,
            ],
            [
                'slug' => 'restaurant-management',
                'name' => 'Aspen Restaurant Suite',
                'category' => 'Hospitality',
                'tagline' => 'Kitchen to checkout, unified in real time',
                'rating' => 4.6,
                'reviews_count' => 18,
                'features' => ['Kitchen Display', 'Orders', 'Reservations', 'POS', 'Inventory', 'Delivery'],
                'pricing' => [
                    'oneTime' => ['price' => 1600, 'currency' => 'USD'],
                    'subscription' => [
                        ['tier' => 'Cafe', 'price' => 35, 'period' => 'mo', 'features' => ['1 Outlet']],
                        ['tier' => 'Restaurant', 'price' => 89, 'period' => 'mo', 'features' => ['Up to 3 Outlets']],
                    ],
                ],
                'demo_url' => 'https://aspen.ofi-cia.com',
                'has_free_trial' => true,
                'has_docs' => true,
            ],
            [
                'slug' => 'task-management',
                'name' => 'Lixxie Task Manager',
                'category' => 'Productivity',
                'tagline' => 'Kanban, time tracking, and invoicing for agile teams',
                'rating' => 4.8,
                'reviews_count' => 55,
                'features' => ['Tasks', 'Teams', 'Kanban', 'Invoices', 'Time Tracking', 'Subscriptions'],
                'pricing' => [
                    'oneTime' => null,
                    'subscription' => [
                        ['tier' => 'Solo', 'price' => 9, 'period' => 'mo', 'features' => ['1 User', '3 Projects']],
                        ['tier' => 'Team', 'price' => 29, 'period' => 'mo', 'features' => ['Up to 15 Users', 'Unlimited Projects']],
                        ['tier' => 'Agency', 'price' => 79, 'period' => 'mo', 'features' => ['Unlimited Users', 'White-label']],
                    ],
                ],
                'demo_url' => 'https://lixxie.ofi-cia.com',
                'has_free_trial' => true,
                'has_docs' => true,
            ],
            [
                'slug' => 'inventory-system',
                'name' => 'Inventory Pro',
                'category' => 'Retail',
                'tagline' => 'Real-time stock tracking across warehouses',
                'rating' => 4.5,
                'reviews_count' => 13,
                'features' => ['Stock Tracking', 'Purchase Orders', 'Low-stock Alerts', 'Multi-warehouse', 'Reports'],
                'pricing' => [
                    'oneTime' => ['price' => 900, 'currency' => 'USD'],
                    'subscription' => [
                        ['tier' => 'Standard', 'price' => 45, 'period' => 'mo', 'features' => ['3 Warehouses']],
                    ],
                ],
                'demo_url' => null,
                'has_free_trial' => false,
                'has_docs' => true,
            ],
            [
                'slug' => 'payroll-software',
                'name' => 'PayrollHQ',
                'category' => 'HR',
                'tagline' => 'Payroll, payslips, and statutory deductions handled',
                'rating' => 4.6,
                'reviews_count' => 9,
                'features' => ['Payslips', 'Tax Calculations', 'SSNIT Deductions', 'Direct Deposit', 'Reports'],
                'pricing' => [
                    'oneTime' => ['price' => 1100, 'currency' => 'USD'],
                    'subscription' => [
                        ['tier' => 'Business', 'price' => 59, 'period' => 'mo', 'features' => ['Up to 100 Employees']],
                    ],
                ],
                'demo_url' => null,
                'has_free_trial' => true,
                'has_docs' => true,
            ],
            [
                'slug' => 'invoice-software',
                'name' => 'InvoiceFlow',
                'category' => 'Finance',
                'tagline' => 'Create, send, and track invoices from anywhere',
                'rating' => 4.9,
                'reviews_count' => 61,
                'features' => ['Invoices', 'Clients', 'Payments', 'Reports', 'Offline Mode'],
                'pricing' => [
                    'oneTime' => null,
                    'subscription' => [
                        ['tier' => 'Free', 'price' => 0, 'period' => 'mo', 'features' => ['5 Invoices/mo']],
                        ['tier' => 'Pro', 'price' => 12, 'period' => 'mo', 'features' => ['Unlimited Invoices', 'Custom Branding']],
                    ],
                ],
                'demo_url' => null,
                'has_free_trial' => true,
                'has_docs' => true,
            ],
        ];

        foreach ($products as $data) {
            Product::updateOrCreate(['slug' => $data['slug']], $data);
        }
    }
}
