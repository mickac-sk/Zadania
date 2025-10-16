# Zadanie 1.2: Rejestrator Użytkowników

## Opis Zadania
Zaprojektowanie formularza zbierającego podstawowe dane użytkownika z obsługą dynamicznej aktywacji przycisku.

### Wymagania:
1.  **Interfejs:** Formularz powinien zawierać:
    * **TextBox** dla Imienia, Nazwiska i Email.
    * Grupę kontrolek (`GroupBox` lub `Panel`) z dwoma **RadioButton** dla Płci (Mężczyzna/Kobieta).
    * **CheckBox** dla "Akceptacja Regulaminu".
    * **Button** z tekstem "Zarejestruj".
2.  **Logika:**
    * Przycisk "Zarejestruj" musi być **nieaktywny** (`Enabled = false`) domyślnie.
    * Przycisk staje się **aktywny** (`Enabled = true`) tylko w momencie zaznaczenia CheckBox "Akceptacja Regulaminu".
    * Po kliknięciu "Zarejestruj", wszystkie zebrane dane (Imię, Nazwisko, Email, Płeć, Status Akceptacji) muszą zostać wyświetlone w **MessageBox**.
