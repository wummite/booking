USE booking_system;

START TRANSACTION;

INSERT INTO users (name, email, phone, address) VALUES
('Amira Cole', 'amira@example.com', '08000000001', '1 Sample Street'),
('Ben Hart', 'ben@example.com', '08000000002', '2 Sample Street'),
('Chris Lee', 'chris@example.com', '08000000003', '3 Sample Street'),
('Dana Fox', 'dana@example.com', '08000000004', '4 Sample Street'),
('Bola Ade', 'bola@example.com', '08000000005', '5 Sample Street'),
('Tunde Bello', 'tunde@example.com', '08000000006', '6 Sample Street'),
('Grace James', 'grace@example.com', '08000000007', '7 Sample Street'),
('David Obi', 'david@example.com', '08000000008', '8 Sample Street'),
('Mary Okoro', 'mary@example.com', '08000000009', '9 Sample Street'),
('John Musa', 'john@example.com', '08000000010', '10 Sample Street')
ON DUPLICATE KEY UPDATE name = VALUES(name);

UPDATE bookings AS b
JOIN (
    SELECT 1 AS booking_id, 'amira@example.com' AS email,
           'Conference' AS service_name
    UNION ALL SELECT 2, 'ben@example.com', 'Personal Training'
    UNION ALL SELECT 3, 'chris@example.com', 'Business Meeting'
    UNION ALL SELECT 4, 'dana@example.com', 'Photography'
    UNION ALL SELECT 5, 'bola@example.com', 'Event Planning'
    UNION ALL SELECT 6, 'tunde@example.com', 'Consultation'
    UNION ALL SELECT 7, 'grace@example.com', 'Workshop'
    UNION ALL SELECT 8, 'david@example.com', 'Computer Training'
    UNION ALL SELECT 9, 'mary@example.com', 'Catering Consultation'
    UNION ALL SELECT 10, 'john@example.com', 'Venue Viewing'
) AS sample ON sample.booking_id = b.id
JOIN users AS u ON u.email = sample.email
SET b.user_id = u.id,
    b.service_name = sample.service_name
WHERE b.user_id = (
    SELECT id FROM users WHERE email = 'demo@example.com'
);

COMMIT;