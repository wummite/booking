<?php
$host = getenv('DB_HOST') ?: 'localhost';
$name = getenv('DB_NAME') ?: 'booking_system';
$user = getenv('DB_USER') ?: 'root';
$password = getenv('DB_PASSWORD') ?: '';
$pdo = new PDO("mysql:host=$host;dbname=$name;charset=utf8mb4", $user, $password, [
 PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
 PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
 PDO::ATTR_EMULATE_PREPARES => false
]);
