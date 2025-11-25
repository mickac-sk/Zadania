# Zadanie Egzaminacyjne INF.03: System Rejestracji z Audytem Bezpieczeństwa

**Czas na wykonanie:** 120 minut

## Kontekst Zadania
Twoim zadaniem jest stworzenie bezpiecznego modułu rejestracji dla serwisu internetowego. Dane użytkowników muszą być trwale zapisywane w bazie danych MySQL. Dodatkowo, ze względów bezpieczeństwa, administrator wymaga, aby **każda** próba rejestracji (zarówno udana, jak i błędna) była monitorowana i odnotowywana w pliku tekstowym `security.log` wraz z dokładną datą i adresem IP użytkownika.

## Wymagania Techniczne
* **Język programowania:** PHP.
* **Baza danych:** MySQL / MariaDB.
* **Bezpieczeństwo:**
    * Hasła muszą być hashowane algorytmem `bcrypt` (funkcja `password_hash`).
    * Zapytania SQL muszą być zabezpieczone przed atakami typu SQL Injection (użycie `Prepared Statements`).
* **Logowanie zdarzeń:** Zapis do pliku tekstowego w trybie dopisywania.

---

## Instrukcja Krok po Kroku

### Etap 1: Baza Danych
1.  Uruchom phpMyAdmin.
2.  Utwórz nową bazę danych o nazwie `serwis_spolecznosciowy`.
3.  W tej bazie wykonaj poniższy skrypt SQL, aby utworzyć tabelę `uzytkownicy`:

```sql
CREATE TABLE `uzytkownicy` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `login` VARCHAR(50) NOT NULL UNIQUE,
  `haslo` VARCHAR(255) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `data_rejestracji` DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

### Etap 2: Formularz Rejestracji (`index.php`)
Stwórz plik `index.php`. Powinien on zawierać:
* Nagłówek HTML i strukturę strony.
* Formularz przesyłający dane metodą **POST** do pliku `rejestracja.php`.
* Pola formularza:
  * `login` (tekstowe)
  * `haslo` (typu password)
  * `email` (typu email)
* Przycisk "Zarejestruj się".

### Etap 3: Skrypt Logiki (`rejestracja.php`)
To jest główna część zadania. Skrypt ten musi realizować następujący algorytm:
1. **Połączenie:** Nawiąż bezpieczne połączenie z bazą danych `serwis_spolecznosciowy` (MySQLi).
2. **Pobranie danych:** Odbierz login, hasło i email z tablicy `$_POST`.
3. **Weryfikacja dostępności loginu:** Wykonaj zapytanie `SELECT`, aby sprawdzić, czy podany login już istnieje w bazie.
   * **Sytuacja A: Login jest zajęty**
     1. Nie dodawaj użytkownika do bazy.
     2. Otwórz plik `security.log` w trybie dopisywania.
     3. Zapisz linię w formacie: `[DATA GODZINA] [IP UŻYTKOWNIKA] NIEUDANA REJESTRACJA: Login '{login}' zajęty`.
     4. Wyświetl użytkownikowi komunikat błędu: "Podany login jest już zajęty."
   * **Sytuacja B: Login jest wolny (Sukces)**
     1. Zahashuj hasło użytkownika używając funkcji `password_hash()`.
     2. Przygotuj zapytanie `INSERT` używając **Zapytań Przygotowanych (Prepared Statements)**.
     3. Dodaj nowego użytkownika do tabeli `uzytkownicy`.
     4. Otwórz plik `security.log` w trybie dopisywania.
     5. Zapisz linię w formacie: `[DATA GODZINA] [IP UŻYTKOWNIKA] SUKCES: Utworzono nowe konto dla: '{login}'`.
     6. Wyświetl użytkownikowi komunikat: "Konto zostało utworzone pomyślnie."
4. **Zamykanie:** Zamknij połączenie z bazą danych.

### Etap 4: Panel Administratora / Podgląd Logów (`admin.php`)
Stwórz prosty plik `admin.php`, który służy do podglądu audytu bezpieczeństwa.
* Skrypt ma wczytać całą zawartość pliku `security.log` (np. używając funkcji `file_get_contents()` lub `readfile()`).
* Wyświetl treść logów w czytelnej formie (np. wewnątrz znacznika `<pre>`).
