# Zadanie: Aplikacja Quizowa w WPF

## Cel Zadania

Twoim zadaniem jest stworzenie prostej, ale w pełni funkcjonalnej aplikacji quizowej przy użyciu C# i WPF. Aplikacja będzie wczytywać pytania z predefiniowanej listy, prezentować je użytkownikowi i obliczać końcowy wynik.

Celem jest przećwiczenie:
* Projektowania interfejsu użytkownika w XAML.
* Implementacji logiki aplikacji (obsługa zdarzeń).
* Wykorzystania klas do modelowania danych (zasady OOP).
* Zarządzania stanem aplikacji (śledzenie postępów quizu).

---

## Kroki do Wykonania

### 1. Przygotowanie Projektu

1.  Uruchom Visual Studio i stwórz nowy projekt typu **Aplikacja WPF** (.NET Core).
2.  Nadaj projektowi nazwę, np. `QuizApp`.

### 2. Model Danych (Klasa `Question`)

W pliku `.cs` (możesz dodać nowy plik klasy lub dopisać ją w `MainWindow.xaml.cs` *poza* klasą `MainWindow`), zdefiniuj klasę, która będzie przechowywać dane pojedynczego pytania:

```csharp
public class Question
{
    // Treść pytania (np. "Ile to 2+2?")
    public string Text { get; set; } 
    
    // Lista 4 możliwych odpowiedzi
    public List<string> Answers { get; set; } 
    
    // Indeks (numer) poprawnej odpowiedzi (0, 1, 2 lub 3)
    public int CorrectAnswerIndex { get; set; } 
}
```

### 3. Interfejs Użytkownika (Widok - `MainWindow.xaml`)

Zaprojektuj prosty interfejs w XAML. Powinien on zawierać:
- `TextBlock` na treść pytania (nadaj mu nazwę, np. `QuestionText`).
Cztery kontrolki `RadioButton` na odpowiedzi (nadaj im nazwy, np. `Answer1`, `Answer2`, `Answer3`, `Answer4`).
    - Wskazówka: Aby `RadioButton` działały razem (można było wybrać tylko jeden), nadaj im tę samą właściwość `GroupName="Answers"`.
- `Button` do zatwierdzenia odpowiedzi i przejścia dalej (nadaj mu nazwę `NextButton` i treść "Dalej").
- `TextBlock` do wyświetlenia końcowego wyniku (nadaj mu nazwę `ResultText`, a domyślnie ustaw `Visibility="Collapsed"`).

### 4. Logika Aplikacji (Logika - `MainWindow.xaml.cs`)
To jest główna część zadania. Musisz "ożywić" swoją aplikację.

1. Pola Klasy (Stan Aplikacji): W klasie `MainWindow` (na samej górze, przed konstruktorem) dodaj pola, które będą "pamięcią" Twojego quizu:

```csharp
private List<Question> _quizQuestions; // Lista wszystkich pytań
private int _currentQuestionIndex = 0; // Indeks pytania, które teraz wyświetlamy
private int _score = 0; // Licznik poprawnych odpowiedzi
```

2. Metoda `LoadQuestions()`: Stwórz prywatną metodę `LoadQuestions()`. W niej zainicjuj listę `_quizQuestions` i dodaj do niej 3-5 przykładowych pytań.
    - **Przykład:**
```csharp
_quizQuestions = new List<Question>
{
    new Question 
    { 
        Text = "Stolicą Polski jest:", 
        Answers = new List<string> { "Gdańsk", "Kraków", "Warszawa", "Poznań" }, 
        CorrectAnswerIndex = 2 
    },
    new Question 
    { 
        Text = "W którym roku była Bitwa pod Grunwaldem?", 
        Answers = new List<string> { "1410", "1025", "966", "1989" }, 
        CorrectAnswerIndex = 0 
    },
    // ... dodaj więcej pytań ...
};
```

3. Metoda `ShowQuestion()`: Stwórz prywatną metodę `ShowQuestion()`. Jej zadaniem jest wzięcie pytania z listy (używając `_currentQuestionIndex`) i wstawienie jego danych do kontrolek XAML.
```csharp
private void ShowQuestion()
{
    // Pobierz aktualne pytanie
    Question q = _quizQuestions[_currentQuestionIndex];

    // Wstaw dane do kontrolek
    QuestionText.Text = q.Text;
    Answer1.Content = q.Answers[0];
    Answer2.Content = q.Answers[1];
    Answer3.Content = q.Answers[2];
    Answer4.Content = q.Answers[3];

    // Zresetuj zaznaczenie RadioButtonów
    Answer1.IsChecked = false;
    Answer2.IsChecked = false;
    Answer3.IsChecked = false;
    Answer4.IsChecked = false;
}
```

4. Konstruktor (`MainWindow()`): W konstruktorze okna (zaraz po `InitializeComponent();`):
- Wywołaj `LoadQuestions();`
- Wywołaj `ShowQuestion();` (aby wyświetlić pierwsze pytanie zaraz po starcie).

5. Obsługa Zdarzenia `NextButton_Click`:
- Wygeneruj metodę obsługi zdarzenia `Click` dla swojego przycisku `NextButton`.
- **Sprawdź odpowiedź**: Sprawdź, który `RadioButton` jest zaznaczony (`IsChecked == true`).
- **Policz punkty**: Porównaj wybór użytkownika z `_quizQuestions[_currentQuestionIndex].CorrectAnswerIndex`. Jeśli odpowiedź jest poprawna, zwiększ licznik `_score`.
- **Przejdź dalej**: Zwiększ `_currentQuestionIndex` o 1.
- **Sprawdź koniec quizu:**
    - Jeśli `_currentQuestionIndex` jest mniejszy niż liczba pytań (`_quizQuestions.Count`), wywołaj `ShowQuestion()` aby pokazać następne pytanie.
    - **Jeśli** pytania się skończyły (`_currentQuestionIndex == _quizQuestions.Count`), zakończ quiz (patrz pkt. 6).

6. Metoda `ShowResults()`: Stwórz metodę, która:
- Ukryje `TextBlock` z pytaniem i `RadioButton` z odpowiedziami (ustaw `Visibility="Collapsed"`).
- Ukryje przycisk "Dalej".
- Pokaże `ResultText` (ustaw `Visibility="Visible"`).
- Wstawi do `ResultText` końcowy wynik, np. `ResultText.Text = $"Twój wynik: {_score} / {_quizQuestions.Count}";`
- Wywołaj tę metodę w `NextButton_Click` po ostatnim pytaniu.

### Zadanie dla Chętnych (jeśli skończysz wcześniej)
1. **Walidacja:** Nie pozwalaj na kliknięcie "Dalej", jeśli żadna odpowiedź nie jest zaznaczona. (Wskazówka: `NextButton.IsEnabled = false;` i włączaj go dopiero, gdy któryś `RadioButton` zostanie kliknięty).
2. **Przycisk Restart:** Dodaj przycisk "Zagraj ponownie", który zeruje `_score` i `_currentQuestionIndex`, pokazuje z powrotem kontrolki quizu i wywołuje `ShowQuestion()`.
3. **Informacja zwrotna:** Po każdej odpowiedzi, zanim przejdziesz dalej, poinformuj użytkownika (np. zmieniając kolor tła), czy odpowiedział dobrze, czy źle.
