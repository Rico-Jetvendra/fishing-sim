<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\{
    BaitController,
    CatchLogsController,
    CityController,
    FishController,
    FishBaitController,
    FishLocationController,
    FishTypeController,
    FishRodController,
    FishSeasonController,
    FishWeatherController,
    LocationController,
    LoginController,
    MutationController,
    RodController,
    WeatherController,
};

Route::middleware(['web'])->name('web.')->group(function () {
    // Auth
    Route::get('/signin', [LoginController::class, 'signin'])->name('signin');
    Route::post('/login', [LoginController::class, 'login'])->name('login');
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    // Checking Session
    Route::middleware(['check.session'])->group(function () {
        // Default
        Route::get('/', [LoginController::class, 'index'])->name('index');

        // Data
        Route::get('/fish/data', [FishController::class, 'data'])->name('fish.data');
        Route::get('/fishType/data', [FishTypeController::class, 'data'])->name('fishType.data');
        Route::get('/bait/data', [BaitController::class, 'data'])->name('bait.data');
        Route::get('/city/data', [CityController::class, 'data'])->name('city.data');
        Route::get('/rod/data', [RodController::class, 'data'])->name('rod.data');
        Route::get('/location/data', [LocationController::class, 'data'])->name('location.data');
        Route::get('/weather/data', [WeatherController::class, 'data'])->name('weather.data');
        Route::get('/mutation/data', [MutationController::class, 'data'])->name('mutation.data');
        Route::get('/fishBait/data', [FishBaitController::class, 'data'])->name('fishBait.data');
        Route::get('/fishLocation/data', [FishLocationController::class, 'data'])->name('fishLocation.data');
        Route::get('/fishRod/data', [FishRodController::class, 'data'])->name('fishRod.data');
        Route::get('/fishSeason/data', [FishSeasonController::class, 'data'])->name('fishSeason.data');
        Route::get('/fishWeather/data', [FishWeatherController::class, 'data'])->name('fishWeather.data');
        Route::get('/catchLogs/data', [CatchLogsController::class, 'data'])->name('catchLogs.data');

        // Resources
        Route::resource('fish', FishController::class);
        Route::resource('fishType', FishTypeController::class);
        Route::resource('bait', BaitController::class);
        Route::resource('city', CityController::class);
        Route::resource('rod', RodController::class);
        Route::resource('location', LocationController::class);
        Route::resource('weather', WeatherController::class);
        Route::resource('mutation', MutationController::class);
        Route::resource('fishBait', FishBaitController::class);
        Route::resource('fishLocation', FishLocationController::class);
        Route::resource('fishRod', FishRodController::class);
        Route::resource('fishSeason', FishSeasonController::class);
        Route::resource('fishWeather', FishWeatherController::class);
        Route::resource('catchLogs', CatchLogsController::class);
    });
});
