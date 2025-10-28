# Zadanie 2.2: Bezpieczna Rejestracja Użytkownika

## Opis Zadania

Rozwijamy nasze umiejętności w zakresie bezpieczeństwa. Tym razem tworzymy system rejestracji użytkownika. Wprowadza to nowy, absolutnie krytyczny wymóg: **nigdy, przenigdy nie wolno nam przechowywać haseł w bazie jako zwykły tekst**.

**Analogia:** Pomyśl o tym jak o systemie szafek w szatni. Gdy użytkownik ustawia swój kod, nie zapisujesz tego kodu na karteczce i nie przyklejasz jej do drzwi szafki! Zamiast tego, używasz specjalnej kłódki (funkcji haszującej), która "zapamiętuje" kod w bezpieczny sposób. Tylko ktoś, kto zna poprawną kombinację, jest w stanie otworzyć kłódkę.

## Wymagania Funkcjonalne

1.  **Architektura (Dobre Praktyki):**
    * Nadal obowiązuje wymóg posiadania pliku `config.php` (lub podobnego) i dołączania go przez `require_once`.

2.  **Formularz Rejestracji (`rejestracja.php`):**
    * Strona ma zawierać prosty formularz HTML (`<form>`).
    * Formularz musi mieć pola: **Login** (input text) oraz **Hasło** (`<input type="password">`).
    * Formularz ma wysyłać dane metodą `POST` do skryptu `zapisz_uzytkownika.php`.

3.  **Skrypt Zapisujący (`zapisz_uzytkownika.php`):**
    * Skrypt ma odebrać dane z formularza (`$_POST`).
    * Po pomyślnym zapisaniu użytkownika, skrypt ma przekierować go na inną stronę (np. `index.php` lub `login.php`).

## Wymagania Krytyczne (BEZPIECZEŃSTWO)

Niespełnienie tych wymogów skutkuje oceną niedostateczną.

1.  **Haszowanie Haseł (Kluczowy Wymóg):**
    * Zanim zapiszesz hasło do bazy, musisz je **bezwzględnie** zaszyfrować (zahaszować) za pomocą funkcji `password_hash()`.
    * *Przykład:* `$hashed_password = password_hash($_POST['haslo'], PASSWORD_DEFAULT);`
    * *Niedopuszczalne:* Zapisanie `$_POST['haslo']` bezpośrednio do bazy.

2.  **Ochrona przed SQL Injection (SQLi):**
    * Podczas zapisywania danych (`login` i `$hashed_password`) do bazy, **bezwzględnie** należy użyć **zapytań przygotowanych (prepared statements)**.
    * *Użycie:* `prepare()`, `bind_param()`, `execute()`.
    * *Niedopuszczalne:* `INSERT INTO ... VALUES ('$login', '$hashed_password')`.
