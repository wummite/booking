<?php
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
 header('Location: index.php');
 exit;
}
$name = trim($_POST['name'] ?? '');
$email = trim($_POST['email'] ?? '');
$phone = trim($_POST['phone'] ?? '');
$address = trim($_POST['address'] ?? '');
$service = trim($_POST['service_name'] ?? '');
$date = $_POST['booking_date'] ?? '';
$time = $_POST['booking_time'] ?? '';
$parsed = DateTimeImmutable::createFromFormat('!Y-m-d', $date);
if (!$name || strlen($name)>100 || !filter_var($email,FILTER_VALIDATE_EMAIL) || strlen($email)>100 || !$phone || strlen($phone)>20 || !$address || strlen($address)>350 || !$service || strlen($service)>150 || !$parsed || $parsed->format('Y-m-d')!==$date || !preg_match('/^(?:[01][0-9]|2[0-3]):[0-5][0-9]$/',$time)) {
 http_response_code(400);
 exit('Please provide valid details in every field.');
}
require __DIR__.'/db_connection.php';
try {
 $pdo->beginTransaction();
 $stmt=$pdo->prepare('INSERT INTO users (name,email,phone,address) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id)');
 $stmt->execute([$name,$email,$phone,$address]);
 $userId=$pdo->lastInsertId();
 $stmt=$pdo->prepare('INSERT INTO bookings (user_id,service_name,booking_date,booking_time) VALUES (?,?,?,?)');
 $stmt->execute([$userId,$service,$date,$time]);
 $pdo->commit();
 echo 'Booking successfully created! <a href="all_bookings.php">View bookings</a>';
} catch (Throwable $e) {
 if ($pdo->inTransaction()) $pdo->rollBack();
 http_response_code(500);
 echo 'Unable to save the booking. Please check your database setup.';
}
