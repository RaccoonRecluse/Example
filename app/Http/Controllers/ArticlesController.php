<?php

namespace App\Http\Controllers;

use App\Models\Articles;
use App\Models\FavoriteArticles;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ArticlesController extends Controller
{
    //
    public function getAllArticles(){
        return Articles::all();
    }
    public function getArticl(){
        return Articles::where('id', request('id'))->get()[0];
    }
    public function getAllFavorite()
    {
        $prod = FavoriteArticles::where("user_id", auth()->user()->id)->get('articles_id');
        $result = [];
        foreach ($prod as $pr) {
            array_push($result, Articles::where('id', $pr->articles_id)->get()[0]);
        };
        return $result;
    }
    public function addToFavorite()
    {
        
        if (count(FavoriteArticles::where('user_id', auth()->user()->id)->where('articles_id', request('articles_id'))->get('id')) == 0) {
            $prod = new FavoriteArticles();
            $prod->user_id =  auth()->user()->id;
            $prod->articles_id =  request('articles_id');
            $prod->save();
        } else {
            FavoriteArticles::where('user_id', auth()->user()->id)->where('articles_id', request('articles_id'))->delete();
        }
    }
    public function checkFavorite()
    {
        if (count(FavoriteArticles::where('user_id', auth()->user()->id)->where('articles_id', request('articles_id'))->get()) != 0) {
            return true;
        }
        return false;
    }

    public function editArticle()
    {
        $file_name = Str::random(10) . '.png';
        $disk = Storage::build([
            'driver' => 'local',
            'root' => 'articles/products'
        ]);
        $disk->put('/' . $file_name, file_get_contents(request()->file('img')));
        $article = Articles::where('id', request('id'))->get()[0];
        $article->title =  request('title');
        $article->text =  request('text');
        $article->img =  "/products/" . $file_name;
        $article->save();
        return 'success';
    }
    public function createArticle()
    {
        $file_name = Str::random(10) . '.png';
        $disk = Storage::build([
            'driver' => 'local',
            'root' => 'media/products'
        ]);
        $disk->put('/' . $file_name, file_get_contents(request()->file('img')));
        $article = new Articles();
        $article->title =  request('title');
        $article->text =  request('text');
        $article->img =  "/products/" . $file_name;
        $article->save();
        return 'success';
    }
    public function deleteArticle()
    {
        FavoriteArticles::where('articles_id', request('id'))->delete();
        Articles::where('id', request('id'))->delete();
        return 'success';
    }
}
