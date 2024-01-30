<?php
$hostname = '10.10.20.11';
$username = 'db';
$password = 'Password&1';
$database = 'Users';
$table = 'accesso';

// Crea connessione
$conn = new mysqli($hostname, $username, $password, $database);

// Controlla connessione
if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}

// Prepara e lega
$stmt = $conn->prepare("SELECT * FROM $table");
$stmt->execute();

// Lega i risultati
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Stampa dati di ogni riga
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["id"]. " - Nome: " . $row["nome"]. " " . $row["cognome"]. "<br>";
    }
} else {
    echo "0 risultati";
}
$stmt->close();
$conn->close();
?>