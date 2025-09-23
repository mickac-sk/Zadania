# Zadanie Programistyczne: Gra w Kółko i Krzyżyk w WPF

## Cel zadania

Celem ćwiczenia jest stworzenie w pełni funkcjonalnej gry w kółko i krzyżyk dla dwóch graczy. Aplikacja powinna zostać zrealizowana w technologii **WPF (Windows Presentation Foundation)** z wykorzystaniem języka **C#**.

Projekt ten ma na celu utrwalenie fundamentalnych koncepcji programowania w WPF, takich jak projektowanie interfejsu użytkownika w XAML, obsługa zdarzeń, implementacja logiki gry oraz zarządzanie stanem aplikacji.

---

## Kluczowe koncepcje do przećwiczenia

* Projektowanie layoutu w XAML (`Grid`, `UniformGrid`, `Button`, `TextBlock`).
* Obsługa zdarzeń (np. kliknięcie przycisku).
* Programowanie logiki gry i zarządzanie jej stanem.
* Stylowanie kontrolek za pomocą zasobów (`Style`, `StaticResource`).
* Dynamiczna aktualizacja interfejsu użytkownika z poziomu kodu C#.

---

## Wymagania funkcjonalne

Aplikacja musi spełniać następujące wymagania:

1.  Po uruchomieniu, aplikacja wyświetla planszę do gry o wymiarach 3x3.
2.  Grę rozpoczyna gracz 'X'. Gracze wykonują ruchy naprzemiennie.
3.  Kliknięcie na puste pole na planszy powinno spowodować wstawienie znaku aktualnego gracza ('X' lub 'O').
4.  Kliknięcie na zajęte już pole nie powinno wywoływać żadnej akcji.
5.  Aplikacja musi automatycznie wykrywać zwycięstwo jednego z graczy. Warunki zwycięstwa to:
    * Trzy takie same znaki w jednej linii (poziomo).
    * Trzy takie same znaki w jednej kolumnie (pionowo).
    * Trzy takie same znaki po przekątnej.
6.  Aplikacja musi wykrywać sytuację remisu (wszystkie pola zajęte, brak zwycięzcy).
7.  Na ekranie powinien znajdować się czytelny komunikat informujący o stanie gry (np. "Tura gracza X", "Wygrywa O!", "Remis!").
8.  Po zakończeniu gry (wygrana lub remis), dalsze klikanie na planszę powinno być zablokowane.
9.  Aplikacja musi posiadać przycisk "Zagraj ponownie", który pojawia się po zakończeniu rozgrywki i pozwala na zresetowanie planszy i rozpoczęcie nowej gry.

---

## Wskazówki techniczne

### Struktura interfejsu (XAML)

Do stworzenia planszy 3x3 zaleca się użycie kontrolki `UniformGrid`. Przyciski na planszy powinny współdzielić jeden styl, zdefiniowany w zasobach okna (`Window.Resources`).

```xml
<UniformGrid x:Name="GameGrid" Rows="3" Columns="3">
    <Button Style="{StaticResource GameButtonStyle}" Tag="0" Click="Gameboard_Click"/>
    <Button Style="{StaticResource GameButtonStyle}" Tag="1" Click="Gameboard_Click"/>
</UniformGrid>
```

### Logika gry
Do przechowywania stanu planszy warto użyć jednowymiarowej tablicy. Dobrą praktyką jest zdefiniowanie typu wyliczeniowego (`enum`) do reprezentowania stanu każdego pola.

```c#
// Przykład typu wyliczeniowego dla stanu komórki.
public enum MarkType
{
    Free, // Pole jest wolne
    O,    // Pole zajete przez O
    X     // Pole zajete przez X
}
```
