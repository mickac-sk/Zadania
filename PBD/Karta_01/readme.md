# BAZY DANYCH: KARTA 1
Symulacja środowiska egzaminacyjnego (XAMPP / phpMyAdmin)

### INSTRUKCJA ORGANIZACJI PRACY
Zanim zaczniesz pisać kod SQL, przygotuj środowisko pracy zgodnie z wymogami CKE:
1. Na pulpicie utwórz folder o nazwie w formacie nazwiski_imie (np. kowaslki_jan).
2. Wewnątrz tego folderu utwórz podfolder o nazwie baza.
3. Uruchom XAMPP (Apache + MySQL) i przejdź do phpMyAdmin (localhost/phpmyadmin).
4. Wszystkie zapytania SQL zapisuj w pliku tekstowym kwerendy.txt w podfolderze baza.
5. Po zakończeniu zadań musisz wykonać eksport bazy danych.

### Zadanie 1: Baza ”Sklep Komputerowy”
<small>Na podstawie arkusza E.14-02-16.01.</small>

1. **Przygotowanie:**
   * Zainportuj bazę skryptem: `baza_sklep.sql`.
2. **Rozbudowa Struktury (DDL):** 
W pliku `kwerendy.txt` zapisz zapytania tworzące poniższe tabele, a następnie wykonaj je w phpMyAdmin:
   * Tabela **klienci**:
     * `IDKlient` (Klucz Główny, liczbowy),
     * `Nazwa`, `Adres`, `NIP` (typu tekstowego).
   * Tabela **zamowienia**:
     * `IDZamowienia` (Klucz Główny),
     * `KlientID` (Klucz Obcy -> `klienci`),
     * `Status` (liczbowy), `Data` (data), `NrFaktury` (tekst).
   * Tabela **opisZamowienia**:
     * `IDOpisZamowienia` (Klucz Główny),
     * `ZamowieniaID` (Klucz Obcy -> `zamowienia`),
     * `ArtykulyID` (Klucz Obcy -> `artykuly`),
     * `Ilosc` (liczbowy).
3. **Tworzenie Relacji:**
W phpMyAdmin (zakładka ”Projektant”lub widok relacyjny) połącz tabele kluczami obcymi, jeśli nie zrobiłeś
tego w kodzie SQL.
4. **Zapytania (DQL) - dopisz do pliku `kwerendy.txt`:**
   * Zapytanie wybierające nazwy wszystkich modeli i ich typy z tabeli artykuly, posortowane rosnąco według cen.
   * Zapytanie wybierające nazwę modelu, dla którego w tabeli magazyn pole ilosc wynosi 0.
   * Zapytanie dodające do tabeli producenci rekord: `ID=3`, `Nazwa=”Samsung”`, `URL=”samsung.pl”`.

### Finał zadania 1:
Wykonaj eksport całej bazy `Sklep` do pliku **`sklep.sql`**. Plik umieść w folderze `baza`

### Zadanie 2: Baza ”Czytelnia”
<small>Na podstawie arkusza E.14-02-16.01.</small>

1. **Przygotowanie:**
   * Zainportuj bazę skryptem: `baza_czytelnia.sql`.
2. **Rozbudowa Struktury (DDL):** Dopisz do pliku `kwerendy.txt` zapytania tworzące tabele i wykonaj je:
   * Tabela **czytelnicy**:
     * `IDCzytelnik` (Klucz Główny),
     * `Nazwisko`, `Imie`, Ad`r`es, `Miasto`, `KodPocztowy` (tekst),
     * `DataZapisania` (data), `Blokada` (logiczny - TINYINT/BOOLEAN).
   * Tabela **wypozyczenia**:
     * `EgzemplarzID` (Klucz Główny - UWAGA: Relacja 1:1 z tabelą egzemplarze),
     * `CzytelnikID` (Klucz Obcy -> `czytelnicy`),
     * `DataWypoz` (data).
3. **Zapytania (DQL) - dopisz do pliku `kwerendy.txt`:**
   * Zapytanie zwracające tytuły książek wydanych po roku 1970.
   * Zapytanie zwracające tytuły książek wraz z nazwiskiem autora (wymaga JOIN tabel `ksiazki` i `autorzy`).
   * Zapytanie zwracające numer egzemplarza i tytuł książki dla tych egzemplarzy, które można jeszcze wypożyczyć (pole `DoWypozyczenia = 1`).

### Finał zadania 2:
Wykonaj eksport bazy `Czytelnia` do pliku **`eksport.sql`**. Plik umieść w folderze `baza`
