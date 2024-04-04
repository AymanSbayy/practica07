<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use Illuminate\Support\Facades\Session;
use GuzzleHttp\Client;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        // Verificar si se debe mostrar el captcha
        if (Session::get('show_captcha')) {
            $captchaResponse = $request->input('g-recaptcha-response');

            $client = new Client();
            $response = $client->post('https://www.google.com/recaptcha/api/siteverify', [
                'form_params' => [
                    'secret' => env('RECAPTCHA_SECRET_KEY'),
                    'response' => $captchaResponse,
                ],
            ]);

            $body = json_decode((string)$response->getBody());
            if (!$body->success) {
                return redirect()->back()
                    ->withErrors(['password' => 'El captcha es incorrecte'])
                    ->withInput($request->only('email'));
            }
        }

        $this->incrementLoginAttempts($request);

        $request->authenticate();

        $request->session()->regenerate();

        if (Auth::check()) {
            $this->clearLoginAttempts($request);
            return redirect()->intended(RouteServiceProvider::HOME);
        }

        return redirect()->back()
            ->withErrors(['email' => __('auth.failed')])
            ->withInput($request->only('email'));
    }


    /**
     * Increment the login attempts for the user.
     */
    protected function incrementLoginAttempts(Request $request): void
    {
        $maxLoginAttempts = 3;
        $loginAttempts = Session::get('login_attempts', 0);
        Session::put('login_attempts', ++$loginAttempts);

        if ($loginAttempts >= $maxLoginAttempts) {
            Session::put('show_captcha', true);
        }
    }

    /**
     * Clear the login attempts for the user.
     */

    protected function clearLoginAttempts(Request $request): void
    {
        Session::forget('login_attempts');
        Session::forget('show_captcha');
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
