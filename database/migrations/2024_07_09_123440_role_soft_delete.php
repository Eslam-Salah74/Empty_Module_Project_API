<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        //
        $tableNames = config('permission.table_names');
        Schema::table($tableNames['roles'], function (Blueprint $table) {
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
        $tableNames = config('permission.table_names');
        Schema::table($tableNames['roles'], function (Blueprint $table) {
            $table->dropSoftDeletes(); 
        });
    }
};