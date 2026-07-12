<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\{
    FishingController,
};

Route::middleware('bot.auth')->group(function () {
    Route::get('/list', [FishingController::class, 'list']);
    Route::get('/desc', [FishingController::class, 'desc']);
    Route::get('/state', [FishingController::class, 'state']);
    Route::get('/inv', [FishingController::class, 'inv']);
    Route::get('/record', [FishingController::class, 'record']);

    Route::post('/change', [FishingController::class, 'change']);
    Route::post('/equip', [FishingController::class, 'equip']);
    Route::post('/phase1', [FishingController::class, 'phase1']);
    Route::post('/phase2', [FishingController::class, 'phase2']);
    Route::post('/phase3', [FishingController::class, 'phase3']);
    Route::post('/finish', [FishingController::class, 'finish']);
});

?>
