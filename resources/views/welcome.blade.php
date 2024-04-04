<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Practica07</title>   

    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="estils.css" rel="stylesheet" />

</head>

<body>
    <ul class="ull">
        @if (Route::has('login'))
        @auth
        <li class="liii"><a class="lia" href="{{ url('/dashboard') }}">Dashboard</a></li>
        @else
        <li class="liii"><a class="lia">Anònim</a></li>
        <li class="lii"><a class="lia" href="{{ route('register') }}">Registra't</a></li>
        <li class="lii"><a class="lia" href="{{ route('login') }}">Inicia sessió</a></li>
        @endauth
        @endif
    </ul>

    <div class="contenidor">
        <h1>Articles</h1>
        <form action="{{ route('articles.index') }}" method="get">
            <select name="numart" id="numart" onchange="this.form.submit()">
                <option value="5" {{ $numArt == 5 ? 'selected' : '' }}>5</option>
                <option value="10" {{ $numArt == 10 ? 'selected' : '' }}>10</option>
                <option value="15" {{ $numArt == 15 ? 'selected' : '' }}>15</option>
                <option value="20" {{ $numArt == 20 ? 'selected' : '' }}>20</option>
            </select>
        </form>

        <section class="articles">
            <ul>
                @foreach ($articles as $article)
                <li>
                    <h3>{{ $article->ID }} - {{ $article->Títol }}</h3> <br>
                    {{ $article->art }} <br>
                </li>
                @endforeach
            </ul>
        </section>
<br>
        <section class="paginacio">
            <div class="pagination-links">
                {{ $articles->appends(['numart' => $numArt])->links() }}
            </div>
        </section>
        <br>
    </div>

</body>

</html>