## Zadanie 1: Prosty Przelicznik Jednostek

Napisz nowy program, który będzie działał jak prosty przelicznik długości między metrami, centymetrami i calami.

**Wymagania:**

1.  Program powinien najpierw zapytać użytkownika o wartość liczbową do przeliczenia (użyj typu `double`).
2.  Następnie wyświetl menu i zapytaj, z jakiej jednostki użytkownik chce przeliczyć:
    * `1 - Metry (m)`
    * `2 - Centymetry (cm)`
    * `3 - Cale (in)`
    Wczytaj wybór (1, 2 lub 3).
3.  Wyświetl ponownie menu i zapytaj, na jaką jednostkę użytkownik chce przeliczyć (te same opcje: 1, 2 lub 3). Wczytaj drugi wybór.
4.  Używając instrukcji `if-else if-else` lub zagnieżdżonych `switch`, wykonaj odpowiednie przeliczenie. Pamiętaj o przelicznikach:
    * 1 metr = 100 centymetrów
    * 1 cal = 2.54 centymetra
    * (Z tego wynikają pozostałe, np. 1 cm = 0.01 m, 1 cm = 1 / 2.54 cala, 1 m = 100 / 2.54 cala, 1 cal = 0.0254 m)
5.  Wyświetl wynik przeliczenia wraz z jednostką docelową.
    * *Przykład:* `1.5 metra to 150 centymetrów.`
    * *Przykład:* `10 cali to 25.4 centymetrów.`
6.  Obsłuż sytuację, gdy użytkownik wybierze tę samą jednostkę źródłową i docelową (wynik powinien być tą samą wartością).
