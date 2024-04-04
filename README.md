## Practica07 - Ayman Sbay Zekkari

Informacio important que has de tenir en compte per a poder provar la practica:

```
- Per a poder provar la practica has de fer servir la comanda "composer install" per a poder instal·lar les dependencies. Aixo pot trigar una bona estona.
- Has de configurar el fitxer .env amb les claus de Google i GitHub per a poder fer servir l'autenticacio amb aquests serveis i el captcha. (Aquestes claus las deixare en el fitcher claus.txt en el zip del projecte que entregare per el moodle, las has de copiar i enganxar en el fitxer .env)
```

## Descripció

Aquesta pràctica consisteix en la creació d'una aplicació web que permeti a l'usuari registrar-se, iniciar sessió i tancar sessió. A més, l'usuari podrà modificar les seves dades personals, com ara el nom, cognoms, correu electrònic i contrasenya. A més, l'usuari podrà recuperar la seva contrasenya si l'ha oblidat. Per a això, l'aplicació enviarà un correu electrònic a l'usuari amb un enllaç per a restablir la contrasenya. A més, l'aplicació permetrà a l'usuari iniciar sessió amb el seu compte de Google o GitHub.

Aquesta pàgina té com a principal funció mostrar els articles emmagatzemats a la nostra base de dades. Si l'usuari ha iniciat sessió, només es mostraran els articles que pertanyen a aquest usuari i tindrà la capacitat de realitzar operacions CRUD (Crear, Llegir, Actualitzar i Esborrar) en aquests articles.

## Requeriments

-   [x] **R1**. Crear una aplicació web amb Laravel que permeti a l'usuari registrar-se, iniciar sessió i tancar sessió.
-   [x] **R2**. L'aplicació ha de tenir un sistema de recuperació de contrasenya.
-   [x] **R3**. L'aplicació ha de permetre a l'usuari modificar les seves dades personals.
-   [x] **R4**. L'aplicació ha de permetre a l'usuari iniciar sessió amb el seu compte de Google.
-   [x] **R5**. L'aplicació ha de permetre a l'usuari iniciar sessió amb el seu compte de GitHub.
-   [x] **R6**. L'aplicació ha de mostrar els articles emmagatzemats a la base de dades.
-   [x] **R7**. L'aplicació ha de permetre a l'usuari realitzar operacions CRUD en els articles.

## Tecnologies utilitzades

-   **Laravel**: Framework de desenvolupament d'aplicacions web amb PHP.
-   **Bootstrap**: Framework de CSS per a la creació de pàgines web.
-   **MySQL**: Sistema de gestió de bases de dades relacional.
-   **Mailtrap**: Servei de correu electrònic per a proves.
-   **Google Sign-In**: API de Google per a l'autenticació d'usuaris.
-   **GitHub OAuth**: API de GitHub per a l'autenticació d'usuaris.
-   **Recaptcha**: Servei de Google per a la protecció de formularis.

## Controladors que he creat/actualitzat

-   **ArticleController**: Controlador que gestiona les operacions CRUD dels articles emmagatzemats a la base de dades. Les funcions que implementa són:

    -   **index**: Mostra la llista d'articles.
    -   **create**: Mostra el formulari per a crear un nou article.
    -   **store**: Emmagatzema un nou article a la base de dades.
    -   **show**: Mostra un article específic.
    -   **edit**: Mostra el formulari per a editar un article.
    -   **update**: Actualitza un article específic a la base de dades.
    -   **destroy**: Esborra un article específic de la base de dades.

-   **AuthController**: Controlador que gestiona les operacions d'autenticació de l'usuari. Les funcions que implementa són:

    -   **register**: Mostra el formulari de registre.
    -   **store**: Emmagatzema un nou usuari a la base de dades.
    -   **login**: Mostra el formulari d'inici de sessió.
    -   **authenticate**: Autentica l'usuari.
    -   **logout**: Tanca la sessió de l'usuari.
    -   **forgotPassword**: Mostra el formulari per a restablir la contrasenya.
    -   **sendResetLink**: Envia un correu electrònic amb un enllaç per a restablir la contrasenya.
    -   **resetPassword**: Mostra el formulari per a restablir la contrasenya.
    -   **updatePassword**: Actualitza la contrasenya de l'usuari.

-   **ProfileController**: Controlador que gestiona les operacions de modificació de les dades personals de l'usuari. Només he tocat la funció **destroy** per a que l'usuari pugui esborrar el seu compte en cas de que estiguis loguejat amb oauth sense posar contrasenya. Les funcions que implementa són:
    -   **edit**: Mostra el formulari per a modificar les dades personals de l'usuari.
    -   **update**: Actualitza les dades personals de l'usuari.
    -   **destroy**: Esborra el compte de l'usuari.

## Models que he creat

-   **Article**: Model que representa un article emmagatzemat a la base de dades. Aquest model té els següents camps:
    -   **title**: Títol de l'article.
    -   **content**: Contingut de l'article.
    -   **user_id**: Identificador de l'usuari que ha creat l'article.

## Vistes que he creat/actualitzat

-   **login.blade.php**: Vista que mostra el formulari d'inici de sessió. A més, aquesta vista permet a l'usuari iniciar sessió amb el seu compte de Google o GitHub.
-   **dashboard.blade.php**: Vista que mostra la llista d'articles. Si l'usuari ha iniciat sessió, només es mostraran els articles que pertanyen a aquest usuari. A més, l'usuari tindrà la capacitat de realitzar operacions CRUD en aquests articles.
-   **create.blade.php**: Vista que mostra el formulari per a crear un nou article.
-   **edit.blade.php**: Vista que mostra el formulari per a editar un article.
-   **welcome.blade.php**: Vista que mostra la pàgina d'inici de l'aplicació amb els articles. Aquesta vista permet a l'usuari registrar-se o iniciar sessió.

## Rutes que he creat/actualitzat

-   **web.php**: Fitxer de rutes de l'aplicació. Les rutes que he creat/actualitzat són:

    -   **/dashboard**: Ruta que crida la funció **showDashboard** del controlador **ArticleController**. Requereix autenticació i verificació de l'usuari.
    -   **/articles/{ID}**: Ruta que crida la funció **destroy** del controlador **ArticleController**. Requereix autenticació i verificació de l'usuari.
    -   **/articles/create**: Ruta que crida la funció **create** del controlador **ArticleController**. Requereix autenticació i verificació de l'usuari.
    -   **/articles/create**: Ruta que crida la funció **store** del controlador **ArticleController**. Requereix autenticació i verificació de l'usuari.
    -   **/articles/{ID}/edit**: Ruta que crida la funció **edit** del controlador **ArticleController**. Requereix autenticació i verificació de l'usuari.
    -   **/articles/{ID}**: Ruta que crida la funció **update** del controlador **ArticleController**. Requereix autenticació i verificació de l'usuari.
    -   **/my-articles**: Ruta que crida la funció **myArticles** del controlador **ArticleController**. Requereix autenticació i verificació de l'usuari.

    -   **/profile**: Ruta que crida la funció **edit** del controlador **ProfileController**. Requereix autenticació i verificació de l'usuari.
    -   **/profile**: Ruta que crida la funció **update** del controlador **ProfileController**. Requereix autenticació i verificació de l'usuari.
    -   **/profile**: Ruta que crida la funció **destroy** del controlador **ProfileController**. Requereix autenticació i verificació de l'usuari.

-   **/**: Ruta que crida la funció **welcome** del controlador **ArticleController**.

-   **/login-google**: Ruta que redirigeix a l'autenticació de Google.

-   **/google-callback**: Ruta que gestiona el callback de l'autenticació de Google.

-   **/login-github**: Ruta que redirigeix a l'autenticació de GitHub.

-   **/github-callback**: Ruta que gestiona el callback de l'autenticació de GitHub.


## Conclusions

En aquesta pràctica he après a implementar un sistema d'autenticació d'usuaris amb Laravel. A més, he après a implementar un sistema de recuperació de contrasenya i a integrar l'autenticació amb Google i GitHub. A més, he après a implementar un sistema de protecció de formularis amb Recaptcha. Finalment, he après a implementar un sistema de gestió d'articles amb operacions CRUD."# practica07" 
