-- Library Management System
-- Import kwenye phpMyAdmin au: mysql -u root -p < library.sql

CREATE DATABASE IF NOT EXISTS library_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE library_db;

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'member') NOT NULL DEFAULT 'member',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS books (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(150) NOT NULL,
    isbn VARCHAR(30) DEFAULT NULL,
    category VARCHAR(80) DEFAULT 'General',
    total_copies INT UNSIGNED NOT NULL DEFAULT 1,
    available_copies INT UNSIGNED NOT NULL DEFAULT 1,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS borrowings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    book_id INT UNSIGNED NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    status ENUM('borrowed', 'returned', 'overdue') NOT NULL DEFAULT 'borrowed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Admin: password = admin123
INSERT INTO users (fullname, email, password, role) VALUES
('Msimamizi Maktaba', 'admin@library.local', '$2y$10$VxnGqX0LigFTV8MTVR309..DWel06m2Zpa0QOSWWTHEKdtS48vFz.', 'admin');

INSERT INTO books (title, author, isbn, category, total_copies, available_copies, description) VALUES
('Things Fall Apart', 'Chinua Achebe', '978-0385474542', 'Fiction', 3, 3, 'Hadithi ya Okonkwo na jamii yake.'),
('Kilio cha Haki', 'Shaaban Robert', '978-9987080000', 'Poetry', 2, 2, 'Mashairi ya Kiswahili.'),
('Introduction to PHP', 'Jane Developer', '978-1234567890', 'Technology', 5, 5, 'Misingi ya PHP na MySQL.'),
('Siku za Ukame', 'Gabriel Okara', '978-9987080123', 'Fiction', 2, 2, 'Riwaya ya kisasa.');
