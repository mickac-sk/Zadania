## Zadanie 1: Kalkulator BMI z Interpretacją

Napisz program, który oblicza wskaźnik BMI (Body Mass Index) i interpretuje wynik.

**Wymagania:**

1.  Program powinien poprosić użytkownika o podanie:
    * Wagi w kilogramach (użyj typu `double`).
    * Wzrostu w metrach (użyj typu `double`, np. 1.75 dla 175 cm).
2.  Program powinien obliczyć BMI, korzystając ze wzoru: `BMI = waga / (wzrost * wzrost)`.
3.  Wyświetl obliczoną wartość BMI.
4.  Używając instrukcji `if-else if-else`, dodaj interpretację wyniku BMI zgodnie z poniższymi zakresami:
    * BMI < 18.5: "Niedowaga"
    * BMI >= 18.5 i BMI < 25: "Waga prawidłowa"
    * BMI >= 25 i BMI < 30: "Nadwagę"
    * BMI >= 30: "Otyłość"
    Wyświetl odpowiedni komunikat interpretujący wynik.
