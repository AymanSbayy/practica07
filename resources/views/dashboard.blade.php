<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            <a href="{{ route('dashboard') }}" style="margin-right: 10px;">Inici</a>
            <a href="{{ route('create') }}">Inserir</a>
        </h2>
    </x-slot>
    @if (session('edit_success'))
    <div id="success-message" class="alert alert-success" role="alert" style="display: none;">
        L'article s'ha actualitzat correctament.
    </div>
    <script>
        $(document).ready(function() {
            $('#success-message').slideDown();
            setTimeout(function() {
                $('#success-message').slideUp();
            }, 5000);
        });
    </script>
    @endif

    @if (session('insert_success'))
    <div id="insert-success-message" class="alert alert-success" role="alert" style="display: none;">
        L'article s'ha creat correctament.
    </div>
    <script>
        $(document).ready(function() {
            $('#insert-success-message').slideDown();
            setTimeout(function() {
                $('#insert-success-message').slideUp();
            }, 5000);
        });
    </script>
    @endif

    @if (session('delete_success'))
    <div id="delete-success-message" class="alert alert-danger" role="alert" style="display: none;">
        L'article s'ha eliminat correctament.
    </div>
    <script>
        $(document).ready(function() {
            $('#delete-success-message').slideDown();
            setTimeout(function() {
                $('#delete-success-message').slideUp();
            }, 5000);
        });
    </script>
    @endif

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <h3 class="text-lg font-semibold mb-4">Els meus articles</h3>
                    @if ($articles->count() > 0)
                    <ul>
                        @foreach ($articles as $article)
                        <li style="display: flex; align-items: center;">
                            <h2 style="font-size: 18px; font-weight: bold; color: #4308B3; margin-right: 10px;">
                                {{ $article->ID }} - {{ $article->Títol }}
                            </h2>
                            <a href="{{ route('articles.edit', ['ID' => $article->ID]) }}" class="edit-btn">
                                <x-edit-icon :article="$article" />
                            </a>


                            <form action="{{ route('articles.destroy', ['ID' => $article->ID]) }}" method="POST" class="delete-form" data-article-id="{{ $article->ID }}">
                                @csrf
                                @method('DELETE')
                                <button type="button" onclick="confirmDelete('{{ $article->ID }}')" class="delete-btn">
                                    <x-delete-icon :article="$article" />
                                </button>
                            </form>


                            <script>
                                function confirmDelete(articleId) {
                                    if (confirm("¿Estás seguro de que quieres eliminar este artículo?")) {
                                        document.querySelector('.delete-form[data-article-id="' + articleId + '"]').submit();
                                    }
                                }
                            </script>
                        </li>

                        <p>{{ $article->art }}</p>
                        <br>
                        @endforeach
                    </ul>
                    {{ $articles->links() }}
                    @else
                    <p>No tens ningun article.</p>
                    @endif
                </div>
            </div>
        </div>

    </div>
</x-app-layout>