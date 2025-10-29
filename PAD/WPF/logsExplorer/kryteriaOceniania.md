### 2. Kryteria Oceniania (Checklista do Code Review)

# Arkusz Oceny Pracy Ucznia: Czytnik Logów WPF (Code Review)

**Kwalifikacja:** INF.04 (Projektowanie, programowanie i testowanie aplikacji)
**Zadanie:** Implementacja parsera logów w WPF z obsługą błędów.

**Zasady oceniania (do Code Review):**
* To jest lista kontrolna "Jakości Kodu".
* Recenzent (kolega z pary) sprawdza kod Autora, zaznaczając (Tak/Nie) dla każdego kryterium.
* Celem jest znalezienie miejsc do poprawy i upewnienie się, że aplikacja jest "odporna na błędy" (robusta).

---

## 1. Model Danych i UI (Max. 5 pkt)

| Lp. | Kryterium oceniane | Punkty (0/1) |
| :--- | :--- | :--- |
| 1.1 | Zdefiniowano klasę `LogEntry` zawierającą właściwości `Timestamp` (DateTime), `Poziom` (string) i `Wiadomosc` (string). | |
| 1.2 | W XAML zdefiniowano `Button` do wczytywania pliku. | |
| 1.3 | W XAML zdefiniowano `DataGrid` i poprawnie ustawiono `ItemsSource` na kolekcję z C#. | |
| 1.4 | W `DataGrid` zdefiniowano kolumny (`DataGrid.Columns`), które poprawnie wyświetlają dane (np. przez `Binding`). | |
| 1.5 | W XAML zdefiniowano `TextBlock` (pasek statusu) do wyświetlania komunikatów. | |

## 2. Logika Wczytywania Danych (Max. 8 pkt)

| Lp. | Kryterium oceniane | Punkty (0/1) |
| :--- | :--- | :--- |
| 2.1 | W kodzie C# zdefiniowano `ObservableCollection<LogEntry>` jako główne źródło danych dla `DataGrid`. | |
| 2.2 | Przycisk "Wczytaj..." poprawnie implementuje i otwiera `OpenFileDialog`. | |
| 2.3 | Aplikacja poprawnie pobiera ścieżkę do pliku od użytkownika. | |
| 2.4 | Przed próbą wczytania pliku sprawdzane jest jego istnienie (np. `File.Exists`). | |
| 2.5 | Użyto `File.ReadAllLines` (lub `StreamReader`) do wczytania zawartości pliku. | |
| 2.6 | Przed wczytaniem nowych danych, kolekcja `ObservableCollection` jest czyszczona (`.Clear()`). | |
| 2.7 | Zaimplementowano pętlę (`foreach` lub `while`) do iterowania po wczytanych liniach. | |
| 2.8 | Wewnątrz pętli poprawnie użyto metody `Split(';')` do podzielenia linii na części. | |

## 3. Programowanie Defensywne (Obsługa Błędów) (Max. 7 pkt)

| Lp. | Kryterium oceniane (KRYTYCZNE) | Punkty (0/1) |
| :--- | :--- | :--- |
| 3.1 | Aplikacja **NIE ZAWIESZA SIĘ** po wczytaniu dostarczonego, "brudnego" pliku `aplikacja.log`. | |
| 3.2 | Wewnątrz pętli zaimplementowano sprawdzanie, czy linia nie jest pusta (np. `!string.IsNullOrEmpty(linia)`). | |
| 3.3 | Wewnątrz pętli zaimplementowano sprawdzanie liczby części po `Split` (np. `if (parts.Length == 3)`). | |
| 3.4 | Zastosowano blok `try-catch` do obsłużenia parsowania daty (`DateTime.Parse` lub `DateTime.ParseExact`). | |
| 3.5 | Blok `try-catch` (lub `if` z `TryParse`) jest umieszczony **WEWNĄTRZ** pętli (dzięki czemu błąd jednej linii nie przerywa wczytywania reszty pliku). | |
| 3.6 | Aplikacja poprawnie parsuje i dodaje do kolekcji **tylko poprawne** linie z pliku. | |
| 3.7 | Po zakończeniu wczytywania, na pasku statusu wyświetlany jest czytelny komunikat (np. "Wczytano 5 z 9 linii."). | |

---

### Podsumowanie Oceny

| Sekcja | Maks. Pkt. | Uzyskane Pkt. |
| :--- | :--- | :--- |
| 1. Model Danych i UI | 5 | |
| 2. Logika Wczytywania | 8 | |
| 3. Programowanie Defensywne | 7 | |
| **RAZEM** | **20** | |
| **Wynik procentowy** | **100%** | **... %** |

**Ocena (wg skali egzaminacyjnej):**
* **15 - 20 pkt ( >= 75% )** - Zaliczone
* **0 - 14 pkt ( < 75% )** - Niezaliczone
