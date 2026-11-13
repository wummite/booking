<?php
require __DIR__.'/db_connection.php';
$rows=$pdo->query('SELECT id,name,email,phone,address,created_at FROM users ORDER BY id')->fetchAll();
function escape($value) { return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); }
?>
<!doctype html><html lang="en"><head><meta charset="utf-8"><title>All users</title>
<style>body{font-family:Arial;margin:32px}table{border-collapse:collapse}th,td{border:1px solid #ccc;padding:10px;text-align:left}</style></head><body>
<nav><a href="index.php">Add a booking</a> | <a href="users.php">All users</a> | <a href="all_bookings.php">All bookings</a></nav>
<h1>All users</h1>
<?php if (!$rows): ?><p>No records found.</p><?php else: ?>
<table><thead><tr><?php foreach (array_keys($rows[0]) as $column): ?><th><?= escape($column) ?></th><?php endforeach; ?></tr></thead>
<tbody><?php foreach ($rows as $row): ?><tr><?php foreach ($row as $value): ?><td><?= escape($value) ?></td><?php endforeach; ?></tr><?php endforeach; ?></tbody></table>
<?php endif; ?></body></html>
