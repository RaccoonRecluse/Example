<?php

use App\Http\Controllers\ArticlesController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/register', function (Request $request) {
    return $request;
});

Route::group([
    'prefix' => 'auth'
], function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('registration', [AuthController::class, 'registration']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    Route::post('me', [AuthController::class, 'me']);
    Route::post('role', [AuthController::class, 'role']);
});

Route::get('products', [ProductController::class, 'getAll']);
Route::get('product', [ProductController::class, 'getProd']);
Route::post('addToFavorite', [ProductController::class, 'addToFavorite']);
Route::post('checkFavorite', [ProductController::class, 'checkFavorite']);
Route::get('getAllFavorite', [ProductController::class, 'getAllFavorite']);
Route::get('getAllPopulars', [ProductController::class, 'getAllPopulars']);

Route::post('editProduct', [ProductController::class, 'editProduct']);
Route::post('createProduct', [ProductController::class, 'createProduct']);
Route::post('test', [ProductController::class, 'test']);
Route::post('deleteProduct', [ProductController::class, 'deleteProduct']);

Route::post('editArticle', [ArticlesController::class, 'editArticle']);
Route::post('createArticle', [ArticlesController::class, 'createArticle']);
Route::post('deleteArticle', [ArticlesController::class, 'deleteArticle']);


Route::get('getAllArticles', [ArticlesController::class, 'getAllArticles']);
Route::post('getArticl', [ArticlesController::class, 'getArticl']);

Route::post('addToFavoriteArticle', [ArticlesController::class, 'addToFavorite']);
Route::post('checkFavoriteArticle', [ArticlesController::class, 'checkFavorite']);
Route::get('getAllFavoriteArticle', [ArticlesController::class, 'getAllFavorite']);

