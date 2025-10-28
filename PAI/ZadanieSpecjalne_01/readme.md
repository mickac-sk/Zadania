# Zadanie specjalne 1: Dziennik Treningowy Piłkarza

## Misja

Dość notowania statystyk na kartkach, które gubią się po treningu! Naszym celem jest zbudowanie profesjonalnej aplikacji webowej w PHP, która pozwoli każdemu z nas logować swoje strzały i analizować postępy.

Tworzymy system, w którym każdy "piłkarz" (użytkownik) ma swoje konto, loguje się i zapisuje dane o swoich strzałach w bazie danych.

## Wymagania Architektoniczne (Fundament)

1.  **Baza Danych:** Aplikacja musi działać na bazie `mysqli`.
2.  **Dobre Praktyki (DRY):** Tworzymy plik `config.php` (lub `db_connect.php`), który przechowuje dane logowania do bazy. Inne pliki dołączają go przez `require_once`. **Zero powtarzania kodu połączenia!**
3.  **Sesje Użytkownika:** Aplikacja musi używać `$_SESSION`, aby śledzić, który piłkarz jest aktualnie zalogowany.

---

## Etapy Realizacji

### Etap 1: Baza Danych i Szkielet

Zaprojektuj dwie tabele w bazie danych:

1.  `uzytkownicy`
    * `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
    * `login` (VARCHAR, UNIQUE)
    * `haslo` (VARCHAR) - *Pamiętaj, tu będzie trzymany **hash**, nie czyste hasło!*
2.  `strzaly`
    * `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
    * `id_uzytkownika` (INT) - *Klucz obcy wskazujący, który piłkarz oddał strzał*
    * `dystans` (INT) - *Odległość w metrach*
    * `sektor_bramki` (VARCHAR) - *Np. "Lewy górny róg", "Prawy dolny", "Środek", "Pudło"*
    * `opis` (TEXT, opcjonalny) - *Np. "Mocny strzał po ziemi"*
    * `data_dodania` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Etap 2: Rejestracja i Logowanie

Musimy bezpiecznie wpuszczać naszych piłkarzy do szatni.

1.  **`rejestracja.php`**
    * Formularz (`POST`) z polami `login` i `haslo`.
    * Po wysłaniu, dane trafiają do skryptu `zapisz_uzytkownika.php`.
2.  **`zapisz_uzytkownika.php`**
    * **WYMÓG KRYTYCZNY (Hash):** Musi haszować hasło używając `password_hash()` przed zapisem.
    * **WYMÓG KRYTYCZNY (SQLi):** Musi używać **zapytań przygotowanych (prepared statements)** do zapisu `login` i `haslo_hash` do bazy.
    * Po sukcesie, przekierowuje do `logowanie.php`.
3.  **`logowanie.php`**
    * Formularz (`POST`) z polami `login` i `haslo`.
    * Po wysłaniu, dane trafiają do skryptu `weryfikuj.php`.
4.  **`weryfikuj.php`**
    * **WYMÓG KRYTYCZNY (SQLi):** Musi używać **zapytań przygotowanych** do pobrania użytkownika o podanym loginie.
    * **WYMÓG KRYTYCZNY (Weryfikacja):** Musi używać `password_verify()` do sprawdzenia hasła z hashem z bazy.
    * Jeśli logowanie się powiodło, skrypt musi zapisać ID i login użytkownika w **sesji (`$_SESSION`)** i przekierować na stronę główną (`index.php`).
    * Jeśli nie, wraca do `logowanie.php` z błędem.

### Etap 3: Logowanie Strzałów

1.  **`index.php` (Strona Główna)**
    * Na samej górze sprawdza, czy użytkownik jest zalogowany (czy istnieje `$_SESSION['id_uzytkownika']`). Jeśli nie, przekierowuje go do `logowanie.php`.
    * Wyświetla formularz (`POST`) do dodawania nowego strzału. Pola:
        * `dystans` (input number)
        * `sektor_bramki` (najlepiej `<select>` z opcjami: "Lewy Górny", "Prawy Górny", "Lewy Dolny", "Prawy Dolny", "Środek", "Pudło obok", "Pudło nad")
        * `opis` (textarea)
    * Formularz wysyła dane do `dodaj_strzal.php`.
2.  **`dodaj_strzal.php`**
    * Odbiera dane z `$_POST`.
    * Pobiera `id_uzytkownika` z **sesji (`$_SESSION`)**.
    * **WYMÓG KRYTYCZNY (SQLi):** Musi używać **zapytań przygotowanych** do zapisu strzału do bazy.
    * Po sukcesie, przekierowuje z powrotem do `index.php`.

### Etap 4: Analiza Danych

1.  **`index.php` (Ciąg dalszy)**
    * Pod formularzem dodawania, strona wyświetla listę **tylko Twoich** dotychczasowych strzałów.
    * **WYMÓG KRYTYCZNY (SQLi):** Musi pobrać dane używając `prepared statements` (`SELECT * FROM strzaly WHERE id_uzytkownika = ? ...`).
    * **WYMÓG KRYTYCZNY (XSS):** Podczas wyświetlania danych (szczególnie `opis` i `sektor`), musi **bezwzględnie** użyć `htmlspecialchars()`.

---

**Powodzenia! Niech wygrają najlepsi (i najbezpieczniejsi) programiści!**
