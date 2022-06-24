<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'registration']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {
        $credentials = request(['email', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        return $this->respondWithToken($token);
    }


    /**
     * User registration
     */
    public function registration()
    {
        $errors = Validator::make(
            request()->all(),
            [
                'password' => 'required|string|min:8|max:255|same:password_confirmation',
                'password_confirmation' => 'required|string|min:8|max:255',
                'email' => 'unique:users|email|required|max:255',
                'name' => 'string|required|min:3|max:255',
            ],
            [
                'name.string' => 'Имя пользователя должно быть строкой',
                'name.min' => 'Имя пользователя не может быть короче 4 символов',
                'name.max' => 'Имя пользователя не может превышать 255 символов',
                'password.required' => 'Пароль обязателен',
                'password.string' => 'Пароль должен быть строкой',
                'password.min' => 'Пароль не может быть короче 8 символов',
                'password.max' => 'Пароль не может превышать 255 символов',
                'password.same:password_confirmation' => 'Пароль должен соответствовать подтверждению пароля',
                'password_confirmation.required' => 'Подтверждение пароля обязательно',
                'password_confirmation.string' => 'Подтверждение пароля должно быть строкой',
                'password_confirmation.min' => 'Подтверждение пароля не может быть короче 8 символов',
                'password_confirmation.max' => 'Подтверждение пароля не может превышать 255 символов',
                'email.unique' => 'Адрес электронной почты уже зарегестрирован',
                'email.email' => 'Адрес электронной почты некорректен',
                'email.required' => 'Адрес электронной почты обязателен',
                'email.max' => 'Адрес электронной почты не может превышать 255 символов',
            ]
        );
        if ($errors->fails()) {
            return response()->json([
                'errors' => $errors->errors(),
            ], 422);
        }
        $name = request('name');
        $email = request('email');
        $password = request('password');

        $user = new User();
        $user->name = $name;
        $user->email = $email;
        $user->role = 0;
        $user->password = Hash::make($password);
        $user->save();

        return response()->json(['message' => 'Successfully registration!']);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }
    public function role()
    {
        return auth()->user()->role;
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
        ]);
    }
}