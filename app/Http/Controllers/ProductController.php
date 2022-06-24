<?php

namespace App\Http\Controllers;

use App\Models\Favorites;
use App\Models\Popular;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;


class ProductController extends Controller
{
    //
    public function getAll()
    {
        return Product::all();
    }
    public function getAllFavorite()
    {
        $prod = Favorites::where("user_id", auth()->user()->id)->get('product_id');
        $result = [];
        foreach ($prod as $pr) {
            array_push($result, Product::where('id', $pr->product_id)->get()[0]);
        };
        return $result;
    }
    public function getProd()
    {
        return Product::where('id', request('id'))->get()[0];
    }
    public function addToFavorite()
    {
        if (count(Favorites::where('user_id', auth()->user()->id)->where('product_id', request('product_id'))->get('id')) == 0) {
            $prod = new Favorites();
            $prod->user_id =  auth()->user()->id;
            $prod->product_id =  request('product_id');
            $prod->save();
        } else {
            Favorites::where('user_id', auth()->user()->id)->where('product_id', request('product_id'))->delete();
        }
    }
    public function checkFavorite()
    {
        if (count(Favorites::where('user_id', auth()->user()->id)->where('product_id', request('product_id'))->get()) != 0) {
            return true;
        }
        return false;
    }
    public function getAllPopulars()
    {
        $prod = Popular::get('id_product');
        $result = [];
        foreach ($prod as $pr) {
            array_push($result, Product::where('id', $pr->id_product)->get()[0]);
        };
        return $result;
    }
    public function editProduct()
    {
        $file_name = Str::random(10) . '.png';
        $disk = Storage::build([
            'driver' => 'local',
            'root' => 'media/products'
        ]);
        $disk->put('/' . $file_name, file_get_contents(request()->file('img')));
        $product = Product::where('id', request('id'))->get()[0];
        $product->label =  request('title');
        $product->price =  request('price')." ₽";
        $product->text =  request('text');
        $product->img =  "/products/" . $file_name;
        $product->save();
        return 'success';
    }
    public function createProduct()
    {
        $file_name = Str::random(10) . '.png';
        $disk = Storage::build([
            'driver' => 'local',
            'root' => 'media/products'
        ]);
        $disk->put('/' . $file_name, file_get_contents(request()->file('img')));
        $product = new Product();
        $product->label =  request('title');
        $product->price =  request('price')." ₽";
        $product->text =  request('text');
        $product->img =  "/products/" . $file_name;
        $product->save();
        return 'success';
    }
    public function test()
    {
        return request();
        // $file_name = Str::random(10) . '.png';
        // $disk = Storage::build([
        //     'driver' => 'local',
        //     'root' => 'media/products'
        // ]);
        // $disk->put('/' . $file_name, file_get_contents(request()->file('img')));
        // $product = new Product();
        // $product->label =  request('title');
        // $product->price =  request('price')." ₽";
        // $product->text =  request('text');
        // $product->img =  "/products/" . $file_name;
        // $product->save();
        // return 'success';
    }
    public function deleteProduct()
    {
        Favorites::where('product_id', request('id'))->delete();
        Popular::where('id_product', request('id'))->delete();
        Product::where('id', request('id'))->delete();
        return 'success';
    }
}
