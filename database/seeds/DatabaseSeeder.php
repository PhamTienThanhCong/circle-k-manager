<?php

use Database\Seeders\DepartmentSeeder;
use Database\Seeders\RoleSeeder;
use Database\Seeders\UserSeeder;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        try {
            
            // $this->call(DepartmentSeeder::class);
            // $this->call(RoleSeeder::class);
            $this->call(UserSeeder::class);
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
}
