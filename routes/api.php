<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\{
    EventController,
    FishingController,
    RedeemController,
};

Route::middleware('bot.auth')->group(function () {
    // Command
    Route::get('/list', [FishingController::class, 'list']);
    Route::get('/desc', [FishingController::class, 'desc']);
    Route::get('/state', [FishingController::class, 'state']);
    Route::get('/inv', [FishingController::class, 'inv']);
    Route::get('/record', [FishingController::class, 'record']);
    Route::get('/redeem', [RedeemController::class, 'index']);

    Route::post('/change', [FishingController::class, 'change']);
    Route::post('/equip', [FishingController::class, 'equip']);
    Route::post('/phase1', [FishingController::class, 'phase1']);
    Route::post('/phase2', [FishingController::class, 'phase2']);
    Route::post('/phase3', [FishingController::class, 'phase3']);
    Route::post('/finish', [FishingController::class, 'finish']);

    Route::put('/bait/{id}', [FishingController::class, 'reduceBaitAmount']);

    // Event
    Route::post('/location', [EventController::class, 'location']);
    Route::post('/season', [EventController::class, 'season']);
    Route::post('/weather', [EventController::class, 'weather']);
    Route::post('/subscriber', [EventController::class, 'subscriber']);
    Route::get('/currentState', [EventController::class, 'currentState']);
});

?>
