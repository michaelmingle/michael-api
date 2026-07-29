<?php

namespace Database\Seeders;

use App\Models\Testimonial;
use Illuminate\Database\Seeder;

class TestimonialSeeder extends Seeder
{
    public function run(): void
    {
        $testimonials = [
            ['name' => 'Kwame Ofori-Antwi', 'role' => 'Headteacher', 'company' => 'Amanfo International School', 'rating' => 5, 'quote' => "The School Management System transformed how we run admissions, fees, and grading. What used to take our staff days now takes minutes, and parents finally have real visibility into their children's progress."],
            ['name' => 'Pastor Emmanuel Boateng', 'role' => 'Operations Lead', 'company' => 'Ecclesia Church', 'rating' => 5, 'quote' => 'Ecclesia gave our leadership real visibility into attendance and giving for the first time. Biometric check-in alone saved us hours every Sunday.'],
            ['name' => 'Ama Serwaa', 'role' => 'Operations Manager', 'company' => 'Aspen Restaurant Group', 'rating' => 5, 'quote' => 'Our kitchen and front-of-house finally work off the same real-time picture. Service is faster and far less chaotic, especially during peak hours.'],
            ['name' => 'Yaw Darko', 'role' => 'Founder', 'company' => 'Darko Retail Group', 'rating' => 5, 'quote' => 'Vendex keeps ringing up sales even when our internet goes down — that alone paid for itself in the first month across our five branches.'],
            ['name' => 'Efua Mensah', 'role' => 'Creative Director', 'company' => 'Studio Nine Agency', 'rating' => 5, 'quote' => 'Lixxie replaced our Trello, Toggl, and invoicing app with one clean tool our whole team actually uses every day.'],
            ['name' => 'Nana Kwaku Duah', 'role' => 'Founder', 'company' => 'BuildWithGKB', 'rating' => 4, 'quote' => 'Michael understood our marketplace vision immediately and shipped a product our users trust with real transactions.'],
        ];

        foreach ($testimonials as $i => $data) {
            $data['sort_order'] = $i;
            Testimonial::updateOrCreate(['name' => $data['name'], 'company' => $data['company']], $data);
        }
    }
}
