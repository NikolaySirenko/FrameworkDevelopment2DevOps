<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('posts')->insert([
            'title' => 'Madrid',
            'content' => "
            Madrid, Spain's dynamic capital, is a cultural hub filled with art, history, and bustling urban 
            life. The city is home to world-class museums like the Prado and historic plazas. The Royal 
            Palace and its cuisine, nightlife, festivals, and two renowned football clubs, Real Madrid and 
            Atlético, add to its charm.
            ",
        ]);

        DB::table('posts')->insert([
            'title' => 'Barcelona',
            'content' => "
            Barcelona, Spain's coastal gem, is a harmonious blend of history and modernity. The city 
            boasts iconic architecture by Antoni Gaudí, such as the Sagrada Família and Park Güell. Its 
            historic neighborhoods like the Gothic Quarter coexist with contemporary culture. Barcelona 
            offers exquisite cuisine, beautiful beaches, lively festivals, and the iconic FC Barcelona.
            ",
        ]);

        DB::table('posts')->insert([
            'title' => 'Valencia',
            'content' => "
            Valencia, Spain's coastal jewel, marries futuristic architecture with a historic Old Town. The 
            City of Arts and Sciences coexists seamlessly with the Cathedral and La Lonja de la Seda. 
            Valencia is celebrated for its iconic paella, beautiful beaches like Malvarrosa, and the vibrant 
            Las Fallas festival. It effortlessly blends modern attractions, rich history, and Mediterranean 
            allure.
            ",
        ]);
    }
}
