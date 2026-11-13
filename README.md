# Booking system assignment

A PHP/MySQL demo for listing users, listing bookings and adding a booking for a user.

## Setup with XAMPP
1. Copy this project to `C:\xampp\htdocs\booking`.
2. Start Apache and MySQL in XAMPP.
3. Open phpMyAdmin and import `sql/bookings.sql` once. It creates the database, both tables, one fictional user and ten fictional bookings. Reimporting adds ten more bookings.
4. The default connection is localhost, database `booking_system`, user `root`, blank password. Configure DB_HOST, DB_NAME, DB_USER and DB_PASSWORD environment variables if needed; do not commit passwords.
5. Open `http://localhost/booking/index.php`.

## Assessment evidence
- Table creation and minimum ten bookings: `sql/bookings.sql`.
- List all users: `users.php`.
- List all bookings with customer details: `all_bookings.php`.
- Add booking: `index.php` posts to `process_booking.php` using a transaction and prepared statements.
- Git workflow: commit the SQL, PHP and documentation changes separately with descriptive messages. Existing history is preserved.

## Manual checks
- After importing, all bookings should display ten rows and all users should display the demo customer.
- Submit a valid booking with a new email: both a user and booking should appear.
- Submit another booking with that email: user count stays the same, booking count increases by one.
- Invalid input should not insert a booking.
- Names containing HTML characters must display as text in the list pages.

This is a local classroom demo. It has no login or access controls; do not publish real customer records. Old .txt files are retained as historical exercises; use sql/bookings.sql for the current database setup.

## Validation limits
The prepared correction was inspected statically. PHP and MySQL were not available in the preparation environment, so complete the manual checks in XAMPP before resubmitting.
