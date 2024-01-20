<?php
$username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
$password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);

if (empty($username)) {
    die("Username should not be empty");
}

if (empty($password)) {
    die("Password should not be empty");
}

$host = "localhost";
$dbusername = "DBname";
$dbpassword = "DBpassword";
$dbname = "youtube";

// Create connection
$conn = new mysqli($host, $dbusername, $dbpassword, $dbname);

// Check connection
if ($conn->connect_error) {
    die('Connect Error (' . $conn->connect_errno . ') ' . $conn->connect_error);
}

// Prepared statement to prevent SQL injection
$sql = $conn->prepare("INSERT INTO register (username, password) VALUES (?, ?)");
$sql->bind_param("ss", $username, $password);

if ($sql->execute()) {
    echo "New record is inserted successfully";
} else {
    echo "Error: " . $sql->error;
}

$sql->close();
$conn->close();
?>
