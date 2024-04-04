<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Pagination\Paginator;
use App\Models\User;


class ArticleController extends Controller
{    
    public function welcome(Request $request)
    {
        Paginator::useBootstrapFour();

        $numArt = $request->input('numart', 5);
        $articles = Article::paginate($numArt);

        return view('welcome', ['articles' => $articles, 'numArt' => $numArt]);
    }

    public function showDashboard()
    {
        $userID = auth()->user()->id;

        $articles = Article::whereHas('user', function ($query) use ($userID) {
            $query->where('user_id', $userID);
        })->paginate(5);
        return view('dashboard', ['articles' => $articles]);
    }

    public function destroy($ID)
    {
        try {
            $article = Article::where('id', $ID)->where('user_id', auth()->id());
            if (!$article) {
                return redirect()->back()->with('error', 'You do not have permission to delete this article.');
            }

            $article->delete();

            return redirect()->route('dashboard')->with('delete_success', true);
        } catch (\Exception $e) {
            return redirect()->back()->with('delete_error', true);
        }
    }

    public function create()
    {
        return view('create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
        ]);

        $article = new Article();
        $article->Títol = $request->title;
        $article->art = $request->description;
        $article->user_id = auth()->id();
        $article->save();

        return redirect()->route('dashboard')->with('insert_success', true);
    }

    public function edit($ID)
    {
        $article = Article::findOrFail($ID);
        return view('articles.edit', ['article' => $article]);
    }    

    public function update(Request $request, $ID)
    {
        $article = Article::findOrFail($ID);
        $article->Títol = $request->input('title');
        $article->art = $request->input('description');
        $article->save();

        return redirect()->route('dashboard')->with('edit_success', true);
    }
}
