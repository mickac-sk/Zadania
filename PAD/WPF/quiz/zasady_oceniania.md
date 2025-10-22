# Arkusz Oceny Pracy Ucznia: Aplikacja Quizowa WPF

**Kwalifikacja:** INF.04. Projektowanie, programowanie i testowanie aplikacji
**Zadanie:** Implementacja aplikacji quizowej w technologii WPF (C# i XAML)

**Zasady oceniania:**
* Za każde poprawnie zrealizowane kryterium uczeń otrzymuje **1 punkt**.
* Brak realizacji kryterium lub realizacja z błędami uniemożliwiającymi działanie = **0 punktów**.
* Minimalna liczba punktów do uzyskania oceny **dopuszczającej (2)**: **18 punktów** (co stanowi 75% z 24 możliwych).

---

## 1. Model Danych (Klasa `Question`) - [Max. 2 pkt]

| Lp. | Kryterium oceniane (zgodność z INF.04.4.6) | Punkty (0/1) |
| :--- | :--- | :--- |
| 1.1 | Zdefiniowano publiczną klasę `Question`. | |
| 1.2 | Klasa `Question` zawiera publiczne właściwości (`get; set;`) do przechowywania: treści pytania (`string`), listy odpowiedzi (`List<string>`) oraz indeksu poprawnej odpowiedzi (`int`). | |

## 2. Interfejs Użytkownika (XAML) - [Max. 5 pkt]

| Lp. | Kryterium oceniane (zgodność z INF.04.5.3) | Punkty (0/1) |
| :--- | :--- | :--- |
| 2.1 | W pliku `MainWindow.xaml` umieszczono kontrolkę `TextBlock` do wyświetlania treści pytania i nadano jej nazwę (np. `QuestionText`). | |
| 2.2 | Umieszczono 4 kontrolki `RadioButton` do wyświetlania odpowiedzi i nadano im nazwy (np. `Answer1`, `Answer2`...). | |
| 2.3 | Ustawiono właściwość `GroupName` dla wszystkich kontrolek `RadioButton`, zapewniając możliwość wyboru tylko jednej opcji. | |
| 2.4 | Umieszczono kontrolkę `Button` (np. "Dalej") i nadano jej nazwę (np. `NextButton`). | |
| 2.5 | Umieszczono kontrolkę `TextBlock` do wyświetlania wyniku końcowego, nadano jej nazwę (np. `ResultText`) i ustawiono domyślną widoczność na `Collapsed`. | |

## 3. Logika Aplikacji (C# Code-Behind) - [Max. 12 pkt]

| Lp. | Kryterium oceniane (zgodność z INF.04.4.5, INF.04.5.3) | Punkty (0/1) |
| :--- | :--- | :--- |
| 3.1 | W klasie `MainWindow` zadeklarowano pola klasy (prywatne zmienne) do przechowywania: listy pytań (np. `_quizQuestions`), bieżącego indeksu pytania (np. `_currentQuestionIndex`) oraz wyniku (np. `_score`). | |
| 3.2 | Zaimplementowano logikę (np. w metodzie `LoadQuestions()` lub w konstruktorze), która tworzy listę obiektów `Question` i dodaje do niej co najmniej 3 pytania. | |
| 3.3 | Zaimplementowano metodę `ShowQuestion()`, która pobiera dane bieżącego pytania z listy (na podstawie `_currentQuestionIndex`). | |
| 3.4 | Metoda `ShowQuestion()` poprawnie wstawia treść pytania i odpowiedzi do kontrolek `TextBlock` i `RadioButton`. | |
| 3.5 | Metoda `ShowQuestion()` poprawnie resetuje zaznaczenie `RadioButton`ów (`IsChecked = false`) przy ładowaniu nowego pytania. | |
| 3.6 | Aplikacja wywołuje metodę `ShowQuestion()` w konstruktorze (po `InitializeComponent()`), aby wyświetlić pierwsze pytanie. | |
| 3.7 | Zaimplementowano i podpięto obsługę zdarzenia `Click` dla przycisku `NextButton`. | |
| 3.8 | W zdarzeniu `Click` poprawnie sprawdzana jest zaznaczona przez użytkownika odpowiedź (sprawdzenie `IsChecked == true` dla `RadioButton`ów). | |
| 3.9 | W zdarzeniu `Click` poprawnie zliczany jest wynik (`_score`) na podstawie porównania wyboru z `CorrectAnswerIndex`. | |
| 3.10 | W zdarzeniu `Click` poprawnie inkrementowany jest indeks bieżącego pytania (`_currentQuestionIndex++`). | |
| 3.11 | W zdarzeniu `Click` zaimplementowano warunek sprawdzający, czy quiz się zakończył (czy `_currentQuestionIndex` jest równy `_quizQuestions.Count`). | |
| 3.12 | Po zakończeniu quizu wywoływana jest logika `ShowResults()`, która ukrywa kontrolki quizu (pytanie, odpowiedzi, przycisk "Dalej") i pokazuje `ResultText` z poprawnie sformatowanym wynikiem końcowym. | |

## 4. Działanie Aplikacji (Rezultat) - [Max. 5 pkt]

| Lp. | Kryterium oceniane (Rezultat działania) | Punkty (0/1) |
| :--- | :--- | :--- |
| 4.1 | Aplikacja uruchamia się bez błędów kompilacji. | |
| 4.2 | Po uruchomieniu aplikacji widoczne jest pierwsze pytanie i 4 odpowiedzi. | |
| 4.3 | Kliknięcie przycisku "Dalej" poprawnie ładuje treść kolejnego pytania i odpowiedzi. | |
| 4.4 | Aplikacja poprawnie zlicza punkty (sprawdzono na co najmniej jednej dobrej i jednej złej odpowiedzi). | |
| 4.5 | Po ostatnim pytaniu aplikacja poprawnie wyświetla ekran wyników końcowych (np. "Twój wynik: 2 / 3"). | |

---

### Podsumowanie Oceny

| Sekcja | Maks. Pkt. | Uzyskane Pkt. |
| :--- | :--- | :--- |
| 1. Model Danych | 2 | |
| 2. Interfejs Użytkownika | 5 | |
| 3. Logika Aplikacji | 12 | |
| 4. Działanie Aplikacji | 5 | |
| **RAZEM** | **24** | |
| **Wynik procentowy** | **100%** | **... %** |

**Ocena:**
* **18 - 24 pkt ( >= 75% )** - Zaliczone
* **0 - 17 pkt ( < 75% )** - Niezaliczone
