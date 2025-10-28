# Zadanie 2.1: Bezpieczna Księga Gości

## Opis Zadania

Celem jest stworzenie prostej, ale **bezpiecznej** "Księgi Gości". To klasyczne zadanie, które perfekcyjnie uczy nas dwóch najważniejszych filarów bezpieczeństwa aplikacji webowych.

**Analogia:** Wyobraź sobie, że tworzysz publiczną ścianę w muzeum, na której goście mogą zostawiać swoje opinie.
1.  Musisz dać im taki "długopis", który nie pozwoli im wydrapać w ścianie dziury i zniszczyć budynku (**Ochrona przed SQL Injection**).
2.  Musisz upewnić się, że tusz, którego używają, nie jest żrący i nie wypali oczu kolejnym gościom, którzy będą to czytać (**Ochrona przed XSS**).

## Wymagania Funkcjonalne

1.  **Architektura (Dobre Praktyki):**
    * Kod połączenia z bazą danych (`mysqli_connect`) musi znaleźć się w osobnym pliku (np. `config.php` lub `db_connect.php`).
    * Każdy plik, który potrzebuje dostępu do bazy, ma go dołączać za pomocą `require_once 'config.php';`. **Koniec z powtarzaniem tego samego kodu!**

2.  **Strona Główna (`index.php`):**
    * Strona musi łączyć się z bazą (używając `require_once`) i wyświetlać listę **wszystkich** wpisów.
    * Wpisy muszą być posortowane od najnowszego do najstarszego (`ORDER BY data_dodania DESC`).
    * Na tej samej stronie musi znajdować się formularz HTML (`<form>`) z polami: **Nick** (input text) i **Treść** (textarea).
    * Formularz ma wysyłać dane metodą `POST` do skryptu `dodaj.php`.

3.  **Skrypt Dodający (`dodaj.php`):**
    * Skrypt ma odebrać dane z formularza (`$_POST`).
    * Po pomyślnym dodaniu wpisu, skrypt ma **przekierować** użytkownika z powrotem na stronę główną (`header("Location: index.php");`).

## Wymagania Krytyczne (BEZPIECZEŃSTWO)

To jest najważniejsza część zadania. Niespełnienie tych wymogów skutkuje oceną niedostateczną.

1.  **Ochrona przed SQL Injection (SQLi):**
    * Podczas zapisywania danych do bazy w `dodaj.php`, **bezwzględnie** należy użyć **zapytań przygotowanych (prepared statements)**.
    * *Użycie:* `prepare()`, `bind_param()`, `execute()`.
    * *Niedopuszczalne:* `INSERT INTO ... VALUES ('$nick', '$tresc')`.

2.  **Ochrona przed XSS (Cross-Site Scripting):**
    * Podczas wyświetlania danych (Nicku, Treści) na stronie `index.php`, **bezwzględnie** należy użyć funkcji `htmlspecialchars()`.
    * *Poprawnie:* `echo htmlspecialchars($row['nick']);`
    * *Niedopuszczalne (i niebezpieczne):* `echo $row['nick'];`
