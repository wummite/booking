CREATE DATABASE IF NOT EXISTS booking_system;
USE booking_system;
CREATE TABLE IF NOT EXISTS users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL,
 phone VARCHAR(20) NOT NULL,
 address VARCHAR(350) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS bookings (
 id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,
 service_name VARCHAR(150) NOT NULL,
 booking_date DATE NOT NULL,
 booking_time TIME NOT NULL,
 status VARCHAR(20) NOT NULL DEFAULT 'Pending',
 FOREIGN KEY (user_id) REFERENCES users(id)
);
INSERT INTO users (name,email,phone,address) VALUES
 ('Demo Customer','demo@example.com','08000000000','Demo address')
ON DUPLICATE KEY UPDATE name=VALUES(name);
SET @demo_user_id = (SELECT id FROM users WHERE email='demo@example.com');
-- Ten fictional bookings. Import once: repeating this adds ten more bookings.
INSERT INTO bookings (user_id,service_name,booking_date,booking_time,status) VALUES
 (@demo_user_id,'Demo service 1','2026-12-01','10:00:00','Pending'),
 (@demo_user_id,'Demo service 2','2026-12-02','10:00:00','Confirmed'),
 (@demo_user_id,'Demo service 3','2026-12-03','10:00:00','Cancelled'),
 (@demo_user_id,'Demo service 4','2026-12-04','10:00:00','Pending'),
 (@demo_user_id,'Demo service 5','2026-12-05','10:00:00','Confirmed'),
 (@demo_user_id,'Demo service 6','2026-12-06','10:00:00','Cancelled'),
 (@demo_user_id,'Demo service 7','2026-12-07','10:00:00','Pending'),
 (@demo_user_id,'Demo service 8','2026-12-08','10:00:00','Confirmed'),
 (@demo_user_id,'Demo service 9','2026-12-09','10:00:00','Cancelled'),
 (@demo_user_id,'Demo service 10','2026-12-10','10:00:00','Pending');
