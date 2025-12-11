Za pomocą Windows Forms lub WPF wykonaj aplikację
desktopową będącą fragmentem aplikacji do obsługi poczty.

<img src="imgs/poczta.png" alt="obraz 1 - idea aplikacji">

Na obrazie przedstawiono ideę aplikacji. W zależności od zastosowanego środowiska programistycznego
wygląd może nieznacznie się różnić.

## Opis wyglądu aplikacji

- Okno dialogowe o nazwie **„Nadaj Przesyłkę”** i szerokości dopasowanej do kontrolek wewnątrz.  
  W nazwie okna należy wstawić także **numer zdającego**.

- Okno zawiera kontrolki rozmieszczone zgodnie z obrazem 1. Są to:
  - grupa pól radio: **Pocztówka**, **List**, **Paczka**; pola są zgrupowane w dowolny dostępny element
    grupujący (np. GroupBox). W stanie początkowym zaznaczone jest pole **Pocztówka**
  - trzy pola edycyjne poprzedzone etykietami: **„Ulica z numerem”**, **„Kod pocztowy”**,
    **„Miasto”**; zgrupowane w dowolny dostępny element grupujący
  - przycisk o treści **„Sprawdź Cenę”**
  - obraz w stanie początkowym wyświetlający obraz **pocztowka.png**
  - etykieta o treści **„Cena: ”**, o cechach: napis pogrubiony i czcionka widocznie większa
    względem pozostałych napisów
  - przycisk o treści: **„Zatwierdź”**

## Działanie aplikacji

- pola radio działają w grupie — jednocześnie może być wybrane tylko jedno pole
- po wybraniu przycisku **„Sprawdź cenę”** aplikacja sprawdza, które pole radio jest zaznaczone
  i zależnie od wyboru wyświetla odpowiedni obraz oraz cenę:

  - pole radio **Pocztówka**: obraz *pocztowka.png*, **„Cena: 1 zł”**
  - pole radio **List**: obraz *list.png*, **„Cena: 1,5 zł”**
  - pole radio **Paczka**: obraz *paczka.png*, **„Cena: 10 zł”**

- po wybraniu przycisku **„Zatwierdź”** jest walidowane pole kodu pocztowego oraz wyświetlany komunikat.  
  Dla uproszczenia przyjmujemy, że kod składa się **z 5 cyfr bez znaku '-'**.

  - komunikat dla poprawnego kodu pocztowego: **„Dane przesyłki zostały wprowadzone”**
  - komunikat, gdy jest mniej lub więcej niż 5 znaków: **„Nieprawidłowa liczba cyfr w kodzie pocztowym”**
  - komunikat, gdy przynajmniej jeden znak nie jest cyfrą: **„Kod pocztowy powinien się składać z samych cyfr”**

## Założenia aplikacji

- pliki obrazów zapisane w zasobach aplikacji
- aplikacja obsługuje dwa zdarzenia: kliknięcie każdego z przycisków
- po wybraniu przycisku **Zatwierdź** aplikacja jedynie wyświetla komunikat; dane nie muszą być nigdzie zapisywane
- kod aplikacji powinien być czytelny, zgodny z zasadami czystego formatowania oraz wykorzystujący znaczące nazwy zmiennych i funkcji


---

## Dokumentacja funkcji (do uzupełnienia przez ucznia)

W poniższą sekcję wpisz dokumentację funkcji zgodnie z wymaganiami:

```
*******************************************************
nazwa funkcji:
<tu wstaw nazwę funkcji>
parametry wejściowe: <nazwa parametru> - <co przechowuje>
wartość zwracana:<co zwraca funkcja – opis>
informacje:<opis>
****************************************************
```
