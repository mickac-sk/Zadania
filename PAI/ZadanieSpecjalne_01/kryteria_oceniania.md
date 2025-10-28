## Kryteria Oceniania (Suma: 100%)

| Obszar | Kryterium | Waga (%) |
| :--- | :--- | :--- |
| **A. Architektura i Flow (30%)** | Poprawne użycie `config.php` (DRY). | 10% |
| | Poprawne użycie `$_SESSION` do zarządzania stanem zalogowania. | 10% |
| | Poprawny "przepływ" danych (formularze, POST, `header("Location: ...")`). | 10% |
| **B. Bezpieczeństwo Logowania (35%)** | **(Hash)** Poprawne użycie `password_hash()` przy rejestracji. | 10% |
| | **(Weryfikacja)** Poprawne użycie `password_verify()` przy logowaniu. | 10% |
| | **(SQLi)** Użycie `prepared statements` przy rejestracji i logowaniu. | 15% |
| **C. Bezpieczeństwo Aplikacji (35%)** | **(SQLi)** Użycie `prepared statements` przy dodawaniu strzału (`INSERT`). | 10% |
| | **(SQLi)** Użycie `prepared statements` przy wyświetlaniu strzałów (`SELECT`). | 10% |
| | **(XSS)** Użycie `htmlspecialchars()` przy wyświetlaniu danych z bazy. | 15% |
