<x-app-layout>
    <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            <a href="{{ route('dashboard') }}" style="margin-right: 10px;">Inici</a>
            <a href="{{ route('create') }}">Inserir</a>
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <h3 class="text-lg font-semibold mb-4">Insereix un article</h3>
                    <form action="{{ route('articles.store') }}" method="POST">
                    @csrf
                        <div class="mb-4">
                            <label for="title" class="block text-sm font-medium text-gray-700">Títol:</label>
                            <input type="text" name="title" id="title" class="form-input rounded-md shadow-sm mt-1 block w-full" required>
                        </div>
                        <div class="mb-4">
                            <label for="description" class="block text-sm font-medium text-gray-700">Descripció:</label>
                            <textarea name="description" id="description" rows="3" class="form-textarea mt-1 block w-full rounded-md shadow-sm" required></textarea>
                        </div>
                        <br>
                        <div class="flex items-center justify-end">
                        <button type="submit" class="inline-flex items-center px-4 py-2 bg-blue-500 border rounded-md font-semibold text-xs uppercase tracking-widest hover:bg-blue-600 active:bg-blue-700 focus:outline-none focus:border-blue-700 focus:ring focus:ring-blue-200 disabled:opacity-25 transition">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-4 h-4 mr-2">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                </svg>
                                Guardar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
