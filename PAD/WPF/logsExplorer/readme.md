# Zadanie: Czytnik Logów Serwera (WPF)

**Przedmiot:** Programowanie aplikacji desktopowych (INF.04.5)
**Czas na realizację:** 90 minut

---

## Scenariusz

Jesteś administratorem systemu. Jedna z Twoich aplikacji serwerowych generuje plik logu w formacie tekstowym (`.log`). Przeglądanie go w Notatniku jest niewygodne, zwłaszcza gdy plik ma tysiące linii.

Twoim zadaniem jest stworzenie prostej aplikacji-narzędzia w technologii WPF, która wczyta ten plik, przetworzy (sparsuje) go i wyświetli w czytelnej siatce danych (`DataGrid`).

## Wymagania Techniczne

### 1. Model Danych (Klasa `LogEntry`)

W pierwszej kolejności stwórz klasę-model, która będzie reprezentować pojedynczy wpis w logu. Nazwij ją `LogEntry`. Powinna ona zawierać następujące właściwości:

* `public DateTime Timestamp { get; set; }` (Czas zdarzenia)
* `public string Poziom { get; set; }` (np. "INFO", "WARNING", "ERROR")
* `public string Wiadomosc { get; set; }` (Treść komunikatu)

### 2. Format Pliku Wejściowego

Otrzymasz od nauczyciela plik `aplikacja.log`. Dane w tym pliku są zapisane w formacie "CSV", gdzie separatorem jest **średnik (`;`)**.

Każda linia ma następującą strukturę:
`RRRR-MM-DD GG:MM:SS;POZIOM;Wiadomosc`

**Przykład:**
`2025-10-28 10:00:01;INFO;Aplikacja uruchomiona.`

### 3. Interfejs Użytkownika (XAML)

Stwórz prosty interfejs składający się z:

1.  **`Button`** (np. "Wczytaj plik logu..."):
    * Po kliknięciu, przycisk ma otworzyć okno dialogowe `OpenFileDialog` (z `Microsoft.Win32`), aby użytkownik mógł wskazać plik `.log`.
2.  **`DataGrid`** (Siatka danych):
    * Ma być związana (`ItemsSource`) z kolekcją obiektów `LogEntry`.
    * Skonfiguruj kolumny (`DataGrid.Columns`), aby czytelnie wyświetlały `Timestamp`, `Poziom` i `Wiadomosc`.
3.  **`TextBlock`** (Pasek statusu):
    * Umieszczony na dole okna, do wyświetlania informacji, np. "Wczytano X wpisów." lub "Wystąpił błąd podczas wczytywania pliku.".

### 4. Logika Aplikacji (C# Code-Behind)

To jest sedno zadania. Musisz zaimplementować logikę wczytywania i parsowania.

1.  Użyj `ObservableCollection<LogEntry>` jako źródła danych dla Twojego `DataGrid`.
2.  Po wybraniu pliku przez `OpenFileDialog`:
    * Sprawdź, czy plik istnieje (`File.Exists`).
    * Wyczyść starą listę logów (`.Clear()`).
    * Wczytaj *wszystkie linie* z pliku (np. używając `File.ReadAllLines`).
    * Przejdź przez każdą linię w pętli (`foreach`).

### 5. KRYTYCZNE WYMAGANIE: Programowanie Defensywne

Plik `aplikacja.log`, który otrzymasz, jest "brudny" – zawiera błędy! Mogą w nim wystąpić:
* Puste linie.
* Linie mające za mało "części" (np. brakuje wiadomości).
* Linie z uszkodzoną datą (np. "NIE-DATA;ERROR;...").

Twoja aplikacja **NIE MA PRAWA SIĘ ZAWIESIĆ** podczas wczytywania tego pliku.

Musisz zaimplementować obsługę błędów **wewnątrz pętli** `foreach`:
* Użyj bloku `try-catch`, aby łapać błędy parsowania (np. `FormatException` przy dacie, `IndexOutOfRangeException` przy dostępie do `parts[2]`).
* Sprawdzaj, czy linia nie jest pusta (`string.IsNullOrEmpty`).
* Sprawdzaj, czy tablica `parts` (po użyciu `Split(';')`) ma odpowiednią długość (np. `parts.Length == 3`).

"Zepsute" linie mają być po prostu ignorowane (pomijane). Na pasku statusu możesz (opcjonalnie) wyświetlić, ile linii zostało pominiętych.

---

### Zadanie Bonusowe (Dla Chętnych)

Dodaj nad `DataGrid` kontrolkę `ComboBox` z opcjami: "Wszystkie", "INFO", "WARNING", "ERROR". Po wybraniu opcji, przefiltruj dane wyświetlane w `DataGrid`, aby pokazywały tylko logi o wybranym poziomie.
(Wskazówka: Najprościej jest użyć `CollectionViewSource.GetDefaultView(mojaKolekcja).Filter`).
```eof
