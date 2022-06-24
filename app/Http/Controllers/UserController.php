<?php

namespace App\Http\Controllers;


use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;


class UserController extends Controller
{
    //
    function register(Request $request)
    {

        $errors = Validator::make(
            $request->all(),
            [
                'password' => 'required|string|min:8|max:255|same:password_confirmation',
                'password_confirmation' => 'required|string|min:8|max:255',
                'email' => 'unique:users|email|required|max:255',
            ],
            [
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

        $users = User::make($request->all());
        $users->password = md5($users->password . 'salt');
        $users->role = 'none';
        $users->token = Str::random(15);
        $users->save();
        return $users->token;
    }
}
