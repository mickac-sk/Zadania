# Zadanie: Dziennik Kosztów Podróży

### Cel:
Stworzenie aplikacji do obliczania i zapisywania kosztów przejazdu samochodem.

### Treść Zadania
Twoim zadaniem jest wykonanie aplikacji internetowej, która pozwoli pracownikom firmy rejestrować służbowe wyjazdy. Aplikacja ma obliczać koszt paliwa dla danej trasy i zapisywać go w historii.

### Wymagania:
1. **Baza Danych:**
   * Utwórz bazę o nazwie `firma_transportowa`.
   * Zaprojektuj tabelę `trasy` zgodnie z poniższą specyfikacją (zwróć uwagę na typy danych!):

    |Nazwa kolumny|Typ danych    |Uwagi                          |
    |-------------|--------------|-------------------------------|
    |id           |INT           |Klucz główny, Autoinkrementacja|
    |data_wyjazdu |DATE          |Format RRRR-MM-DD              |
    |cel          |VARCHAR       |Maksymalnie 100 znaków         |
    |dystans      |INT           |W kilometrach                  |
    |koszt        |DECIMAL (10,2)|Np. 120.50 (zachowaj grosze!)  |

2. **Skrypt Połączenia (`db.php`):**
   * Połącz się z bazą danych używając `mysqli` (styl obiektowy lub proceduralny).
   * Obsłuż ewentualne błędy połączenia.
3. **Aplikacja (**index.php**):**
   * **Formularz:** Musi zawierać pola:
     * Cel podróży (tekst).
     * Dystans w km (liczba).
     * Średnie spalanie l/100km (liczba).
     * Cena paliwa za litr (liczba).
   * **Skrypt PHP (Obliczenia):**
     * Po przesłaniu formularza, skrypt ma obliczyć koszt przejazdu wg wzoru:
     $$Koszt = \frac{Dystans}{100} \cdot Spalanie \cdot Cena$$
   * **Zapis do bazy:**
     * Obliczony koszt wraz z datą dzisiejszą, celem i dystansem ma zostać zapisany do tabeli trasy przy użyciu Prepared Statements (wymóg bezpieczeństwa).
   * **Wyświetlanie:**
     * Pod formularzem wyświetl historię wszystkich przejazdów w tabeli HTML.
     * Tabela ma mieć nagłówki: *Data, Cel, Dystans, Koszt*.
4. **Zadanie dodatkowe:** Pod tabelą z historią wyświetl sumę kosztów wszystkich przejazdów na dwa sposoby:
   * **SUMA SQL:** Wykonaj osobne zapytanie SQL (`SELECT SUM...`), które policzy to po stronie bazy.
   * **SUMA PHP:** Policz sumę w pętli `while` podczas wyświetlania tabeli (dodawaj koszty do zmiennej w PHP).
