# Zadanie 3: Słoik z "sucharami"

## Cel

Twoim zadaniem jest stworzenie "Słoika z Żartami". To prosta aplikacja, która pozwala każdemu zobaczyć żarty wrzucone przez innych oraz dodać własny "suchar" do bazy.

Pamiętaja aby je wykonać, stosując **wszystkie 3 zasady bezpieczeństwa**, których się uczyliśmy (DRY, SQLi, XSS).

## Etap 1: Przygotowanie Bazy Danych

1.  W `phpMyAdmin` stwórz nową, pustą bazę danych, np. `joke_db` (z kodowaniem `utf8_polish_ci`).
2.  W tej bazie wykonaj poniższe zapytanie SQL, aby stworzyć wymaganą tabelę:

```sql
CREATE TABLE `zarty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autor` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `tresc_zartu` text COLLATE utf8_polish_ci NOT NULL,
  `data_dodania` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
```

## Etap 2: Stworzenie Aplikacji

Potrzebujemy tylko **dwóch** plików PHP.

### Plik 1: `config.php`
* Zawiera **tylko** kod połączenia z Twoją nową bazą `joke_db` (`mysqli_connect`).
* Ustawia kodowanie na UTF-8 (`$conn->set_charset("utf8");`).

### Plik 2: `index.php` (Główna aplikacja)
Ten plik będzie robił **dwie rzeczy**:
1.  Obsługiwał logikę dodawania (jeśli dane przyszły z formularza).
2.  Wyświetlał formularz i listę żartów (zawsze).

```php
<?php
// ----- POCZĄTEK PLIKU index.php -----

// 1. Architektura (DRY)
// TODO: Dołącz swój plik 'config.php'

// 2. Logika Dodawania (Obsługa formularza)
// TODO: Sprawdź, czy strona została wywołana metodą "POST"

    // 3. Odbierz dane z formularza POST
    // TODO: Odbierz 'autora' i 'tresc_zartu'

    // 4. Bezpieczeństwo (SQL INJECTION)
    // TODO: Napisz zapytanie INSERT używając ZAPYTAŃ PRZYGOTOWANYCH
    //       (prepare, bind_param, execute)
    // TODO: Wstaw żart do tabeli 'zarty'

    // 5. Przekierowanie
    // TODO: Po pomyślnym dodaniu, przekieruj użytkownika z powrotem
    //       do 'index.php' (aby uniknąć ponownego wysłania formularza przy odświeżaniu)
    //       Użyj header("Location: index.php"); i exit();

?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Słoik z Żartami</title>
    <style>
        body { font-family: Arial; background: #EEE; color: #333; max-width: 700px; margin: 20px auto; padding: 20px; border: 1px solid #CCC; }
        .zart { background: #FFF; border: 1px solid #DDD; padding: 10px; margin-bottom: 10px; }
        .zart span { font-weight: bold; color: #007bff; }
        form { background: #FAFAFA; border: 1px solid #DDD; padding: 15px; }
        input[type="text"], textarea { width: 95%; padding: 8px; margin-bottom: 10px; }
        button { background: #007bff; color: white; padding: 10px 15px; border: none; }
    </style>
</head>
<body>
    <h1>Słoik z Najlepszymi "Sucharami"</h1>
    
    <form action="index.php" method="POST">
        <label for="autor">Twój Nick:</label>
        <input type="text" id="autor" name="autor" required><br><br>
        <label for="tresc">Treść żartu:</label>
        <textarea id="tresc" name="tresc_zartu" required></textarea><br><br>
        <button type="submit">DORZUĆ DO SŁOIKA</button>
    </form>

    <h2>Co już mamy w słoiku:</h2>
    <?php
        // 6. Logika Wyświetlania
        // TODO: Napisz zapytanie SELECT, które pobierze wszystkie żarty
        //       posortowane od najnowszego
        
        $result = $conn->query( /* TU WPISZ SQL */ );

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                
                // 7. Bezpieczeństwo (XSS - Cross-Site Scripting)
                // TODO: "Rozbrój" dane przed wyświetleniem, używając htmlspecialchars()
                $bezpieczny_autor = /* ... funkcja ... */ $row['autor'];
                $bezpieczny_zart = /* ... funkcja ... */ $row['tresc_zartu'];

                // Wyświetl bezpieczne dane
                echo "<div class='zart'>";
                echo "<p><span>$bezpieczny_autor</span> opowiada:</p>";
                echo "<p>" . nl2br($bezpieczny_zart) . "</p>"; // nl2br() ładnie zamienia entery na <br>
                echo "</div>";
            }
        } else {
            echo "Słoik jest pusty! Bądź pierwszy!";
        }
        $conn->close();
    ?>
</body>
</html>
```
