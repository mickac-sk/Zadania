# Wprowadzenie do Metod (Funkcji) w C#

W miarę jak programy stają się bardziej skomplikowane, pisanie całego kodu w jednym miejscu (w metodzie `Main`) staje się niepraktyczne. Wyobraź sobie próbę zbudowania domu bez podziału pracy - chaos! Dlatego w programowaniu używamy **metod** (nazywanych też **funkcjami**).

## Czym są Metody?

### Analogia: Specjalista od Jednego Zadania 🧑‍🔧

Pomyśl o budowie domu. Zamiast robić wszystko sam, zatrudniasz specjalistów: murarza, elektryka, hydraulika. Każdy z nich:
1.  Ma **swoją nazwę** (np. "Elektryk Nowak").
2.  Wykonuje **jedno, konkretne zadanie** (np. kładzie instalację elektryczną).
3.  Potrzebuje **informacji wejściowych** (argumentów), np. planu instalacji, materiałów.
4.  Może **zwrócić jakiś wynik** (wartość zwracaną), np. gotową instalację lub raport z wykonanej pracy.

**Metoda w C# jest jak taki specjalista.** To wydzielony fragment kodu, który:
* Ma swoją **nazwę**.
* Robi **jedną konkretną rzecz**.
* Można go "zawołać" (**wywołać**) po nazwie.
* Można mu przekazać dane (**argumenty**).
* Może **zwrócić wynik**.

### Prosta Definicja

**Metoda** (lub funkcja) to nazwany blok kodu, który wykonuje określone zadanie. Można go wywoływać (uruchamiać) wielokrotnie z różnych miejsc w programie, podając mu dane wejściowe (argumenty) i ewentualnie otrzymując od niego wynik (wartość zwracaną).

### Dlaczego Używamy Metod?

* **Porządek (Organizacja):** Dzielimy duży program na mniejsze, logiczne części.
* **Unikanie Powtórzeń (Reużywalność):** Jeśli ten sam kod jest potrzebny w wielu miejscach, piszemy go raz w metodzie i tylko ją wywołujemy (zasada DRY - Don't Repeat Yourself).
* **Łatwiejsze Poprawki:** Błąd w danej operacji poprawiamy tylko w jednym miejscu - w metodzie.
* **Czytelność:** Kod jest łatwiejszy do zrozumienia, gdy jest podzielony na nazwane bloki.

---

## Przykład z Metodą: Obliczanie NWD (Największego Wspólnego Dzielnika)

Zadanie: Napisz program, który wczytuje dwie dodatnie liczby całkowite i oblicza ich Największy Wspólny Dzielnik (NWD) za pomocą algorytmu Euklidesa. Wykorzystaj osobną metodę do obliczenia NWD.

### Analogia (dla NWD): Dzielenie Wstążek 🎀

Masz dwie wstążki, np. 18 cm i 12 cm. Chcesz je pociąć na jak największe, równe kawałki bez odpadów. Algorytm Euklidesa (w wersji z resztą z dzielenia) pomaga to znaleźć:
1.  Podziel dłuższą przez krótszą i weź resztę: 18 % 12 = 6
2.  Teraz weź krótszą (12) i resztę (6). Podziel: 12 % 6 = 0
3.  Gdy reszta wynosi 0, ostatnia niezerowa reszta (czyli 6) jest NWD.

### Kod Przykładu (C# z Metodą)

```csharp
using System;

public class Program
{
    // --- Metoda Główna (Punkt startowy programu) ---
    public static void Main(string[] args)
    {
        Console.WriteLine("Podaj pierwszą dodatnią liczbę całkowitą:");
        int liczbaA = int.Parse(Console.ReadLine());

        Console.WriteLine("Podaj drugą dodatnią liczbę całkowitą:");
        int liczbaB = int.Parse(Console.ReadLine());

        // Sprawdzenie, czy liczby są dodatnie (prosta walidacja)
        if (liczbaA <= 0 || liczbaB <= 0)
        {
            Console.WriteLine("Podane liczby muszą być dodatnie!");
        }
        else
        {
            // Wywołanie metody (naszego "specjalisty") do obliczenia NWD
            // Przekazujemy jej 'liczbaA' i 'liczbaB' jako argumenty.
            // Wynik zwracany przez metodę zapisujemy w 'wynikNWD'.
            int wynikNWD = ObliczNWD(liczbaA, liczbaB);

            Console.WriteLine("Największy Wspólny Dzielnik (" + liczbaA + ", " + liczbaB + ") to: " + wynikNWD);
        }
    }

    // --- Metoda do Obliczania NWD (Nasz "Specjalista") ---
    // Definicja metody:
    // - public static: Modyfikatory dostępu i kontekstu (na razie standard)
    // - int: Typ wartości, którą ta metoda ZWRÓCI po zakończeniu pracy.
    // - ObliczNWD: Nazwa metody.
    // - (int a, int b): Parametry - lokalne zmienne metody, które przyjmą
    //                   wartości przekazane podczas wywołania (argumenty).
    public static int ObliczNWD(int a, int b)
    {
        // Implementacja algorytmu Euklidesa z użyciem reszty z dzielenia
        while (b != 0) // Dopóki drugi parametr jest różny od zera
        {
            int temp = b;   // Przechowaj tymczasowo wartość 'b'
            b = a % b;      // Nowe 'b' to reszta z dzielenia 'a' przez stare 'b'
            a = temp;       // Nowe 'a' to stare 'b'
        }
        // Kiedy pętla się zakończy (bo b == 0), wynikiem jest 'a'
        return a; // Zwróć obliczoną wartość NWD
    }
}
```

**Rozbicie Kodu**

* Metoda `Main`:
  * Odpowiedzialna za interakcję z użytkownikiem (wczytanie danych).
  * Wywołuje metodę `ObliczNWD`, przekazując jej wczytane liczby.
  * Odbiera wynik zwrócony przez `ObliczNWD` i go wyświetla.

* Metoda ObliczNWD:
  * Ma jasno zdefiniowane zadanie: obliczyć NWD dwóch liczb.
  * Otrzymuje potrzebne dane jako parametry (`a`, `b`).
  * Wykonuje obliczenia (algorytm **Euklidesa**).
  * Używa instrukcji `return`, aby zwrócić obliczony wynik (typu `int`) do miejsca, skąd została wywołana.
  * Zmienne `a`, `b`, `temp` są lokalne tylko dla tej metody.

**Korzyści z Użycia Metody Tutaj**
* **Czytelność:** Kod w `Main` jest prosty, od razu widać, co robi. Logika NWD jest "ukryta" w dedykowanej metodzie.
* **Reużywalność:** Gdybyśmy potrzebowali obliczyć NWD w innym miejscu, po prostu ponownie wywołalibyśmy `ObliczNWD(...)`.
* **Łatwość Testowania/Poprawiania:** Algorytm NWD jest w jednym miejscu, łatwo go przetestować lub poprawić bez ruszania reszty programu.

# Zadania:
**Zadanie 1: Metoda dla Silni**

Napisz program obliczający silnię. Stwórz metodę `static long ObliczSilnie(int n)`, która:
* Przyjmuje jako parametr nieujemną liczbę całkowitą `n`.
* Oblicza silnię `n` (pamiętaj o `long` dla wyniku i obsłudze 0! = 1, 1! = 1).
* Zwraca obliczoną silnię.
* Jeśli `n` jest ujemne, metoda może zwrócić np. `-1` jako sygnalizację błędu (lub rzucić wyjątek - ale to później).

W metodzie `Main`:
* Wczytaj liczbę `n`.
* Wywołaj metodę `ObliczSilnie`.
* Sprawdź, czy zwrócony wynik nie jest błędem (jeśli użyłeś -1).
* Wyświetl wynik lub komunikat o błędzie.
