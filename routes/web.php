<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ArticleController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', [ArticleController::class, 'showDashboard'])->name('dashboard');
    Route::delete('/articles/{ID}', [ArticleController::class, 'destroy'])->name('articles.destroy');
    Route::get('/articles/create', [ArticleController::class, 'create'])->name('create');
    Route::post('/articles/create', [ArticleController::class, 'store'])->name('articles.store');
    Route::get('/articles/{ID}/edit', [ArticleController::class, 'edit'])->name('articles.edit');
    Route::put('/articles/{ID}', [ArticleController::class, 'update'])->name('articles.update');
    Route::get('/my-articles', [ArticleController::class, 'myArticles'])->name('articles.my');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/', [ArticleController::class, 'welcome'])->name('articles.index');

Route::get('/login-google', function () {
    return Socialite::driver('google')->redirect();
})->name('/login-google');
 
Route::get('/google-callback', function () {
    $user = Socialite::driver('google')->user();
    $userExists = User::where('external_id', $user->id)->where('external_auth', 'google')->first();

    if ($userExists) {
        auth()->login($userExists);
    } else {
        $existingUser = User::where('email', $user->email)->first();
        if ($existingUser) {
            return redirect()->route('login')->with('error', 'Ja existeix un compte amb aquest correu electrònic. Si us plau, inicia sessió en lloc de registrar-te.');
        }
        
        $newUser = User::create([
            'name' => $user->name,
            'email' => $user->email,
            'external_id' => $user->id,
            'external_auth' => 'google',
        ]);
        auth()->login($newUser);
    }

    return redirect()->route('dashboard');
});


Route::get('/login-github', function () {
    return Socialite::driver('github')->redirect();
});
 
Route::get('/github-callback', function () {
    $user = Socialite::driver('github')->user();
    $userExists = User::where('external_id', $user->id)->where('external_auth', 'github')->first();
    
    $existingUser = User::where('email', $user->email)->first();
    if ($existingUser) {
        if ($userExists) {
            auth()->login($userExists);
        } else {
            return redirect()->route('login')->with('error', 'Ja existeix un compte amb aquest correu electrònic. Si us plau, inicia sessió en lloc de registrar-te.');
        }
    }
    
    if ($userExists) {
        auth()->login($userExists);
    } else {
        $newUser = User::create([
            'name' => $user->name,
            'email' => $user->email,
            'external_id' => $user->id,
            'external_auth' => 'github',
        ]);
        auth()->login($newUser);
    }

    return redirect()->route('dashboard');
});



require __DIR__.'/auth.php';
