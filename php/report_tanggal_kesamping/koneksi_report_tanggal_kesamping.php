<?php
$servername = "localhost";
$username = "root";
$password = "";

try {
  $koneksi = new PDO("mysql:host=$servername;dbname=mydb", $username, $password);
  // set the PDO error mode to exception
  $koneksi->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>