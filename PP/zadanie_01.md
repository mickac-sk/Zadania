## Zadanie 1: Kalkulator Pól i Obwodów Figur (Podstawa)

Napisz program, który będzie prostym kalkulatorem geometrycznym. Program powinien najpierw zapytać użytkownika, jaką figurę chce obliczyć, a następnie poprosić o odpowiednie wymiary i wyświetlić zarówno pole, jak i obwód tej figury (z wyjątkiem trójkąta, dla którego obliczamy tylko pole).

**Wymagania:**

1.  Wyświetl menu z opcjami:
    * `1 - Kwadrat (pole i obwód)`
    * `2 - Prostokąt (pole i obwód)`
    * `3 - Trójkąt (tylko pole)`
    * `4 - Koło (pole i obwód)`
2.  Wczytaj wybór użytkownika (liczbę całkowitą).
3.  W zależności od wyboru, poproś użytkownika o odpowiednie wymiary (użyj typu `double`):
    * **Kwadrat:** długość boku (`a`).
    * **Prostokąt:** długości dwóch boków (`a`, `b`).
    * **Trójkąt:** długość podstawy (`p`) i wysokość (`h`).
    * **Koło:** długość promienia (`r`).
4.  Oblicz odpowiednie wartości, korzystając ze wzorów:
    * **Kwadrat:** Pole = `a * a`, Obwód = `4 * a`.
    * **Prostokąt:** Pole = `a * b`, Obwód = `2 * a + 2 * b`.
    * **Trójkąt:** Pole = `0.5 * p * h`.
    * **Koło:** Pole = `PI * r * r`, Obwód = `2 * PI * r`. Użyj stałej `Math.PI` dla wartości PI.
5.  Wyświetl obliczone pole i/lub obwód dla wybranej figury.
6.  Jeśli użytkownik wybierze nieprawidłową opcję (inną niż 1-4), wyświetl komunikat o błędzie.
7.  Użyj instrukcji `switch` lub `if-else if-else` do obsługi wyboru użytkownika.
