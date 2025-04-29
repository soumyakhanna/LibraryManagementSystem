DROP DATABASE IF EXISTS `LibraryManagementSystem_Test`;

CREATE database LibraryManagementSystem_Test;
use LibraryManagementSystem_Test;
-- use LibraryManagementSystem;

-- Created by Soumya Khanna
CREATE TABLE authors (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
    bio VARCHAR(255)
);

INSERT INTO authors (author_id, name, bio)
VALUES 
(1, 'Paulo Coelho', 'Brazilian novelist best known for "The Alchemist".'), 
(2, 'Harper Lee', 'American novelist famous for "To Kill a Mockingbird".'),
(3, 'Alex Michaelides', 'British-Cypriot author and screenwriter known for "The Silent Patient".'),
(4, 'Gillian Flynn', 'American author and former television critic, known for "Gone Girl".'),
(5, 'J.K. Rowling', 'British author renowned for the Harry Potter series.'),
(6, 'Rick Riordan', 'American author best known for mythology-based fiction like "Percy Jackson".'),
(7, 'George Orwell', 'British novelist, essayist, and critic famous for "1984" and "Animal Farm".'),
(8, 'Jane Austen', 'English novelist known primarily for her six major novels like "Pride and Prejudice".'),
(9, 'Mark Twain', 'American writer, humorist, entrepreneur, and lecturer, known for "The Adventures of Tom Sawyer".'),
(10, 'Agatha Christie', 'British writer known for her 66 detective novels and 14 short story collections.'),
(11, 'F. Scott Fitzgerald', 'American novelist famous for "The Great Gatsby".'),
(12, 'Ernest Hemingway', 'American journalist, novelist, and short-story writer, Nobel Prize laureate.');

-- Created by Leena (add inline comments) 
CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    website VARCHAR(255)
);

INSERT INTO publishers (publisher_id, publisher_name, email, website) VALUES 
('1', 'HarperOne', 'contact@harperone.com', 'https://www.harperone.com'),
('2', 'Health Communications, Inc.', 'info@hci.com', 'https://www.hcibooks.com'),
('3', 'Celadon Books', 'info@celadonbooks.com', 'https://celadonbooks.com'),
('4', 'Crown Publishing Group', 'contact@crownpublishing.com', 'https://crownpublishing.com'),
('5', 'Bloomsbury', 'info@bloomsbury.com', 'https://www.bloomsbury.com'),
('6', 'Disney Hyperion', 'contact@disneybooks.com', 'https://www.disneybooks.com');

-- Created by Senan (add inline comment) 
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

INSERT INTO genres (genre_name) VALUES
('Crime'),
('Thriller'),
('Biography'),
('Fantasy');

-- Created by Soumya Khanna
-- Table to store book details including title, author, publisher, genre, and inventory counts.
CREATE TABLE books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publisher_id INT,
    edition INT,
    genre_id INT,
    isbn VARCHAR(20) UNIQUE,
    publication_year YEAR,
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id),
	FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);

ALTER TABLE books 
MODIFY Title VARCHAR(100) DEFAULT NULL;

INSERT INTO books (book_id, title, author_id, publisher_id, edition, genre_id, total_copies, available_copies)
VALUES 
(1, 'The Alchemist', 1, 1, 3, 2, 5, 3),
(2, 'Chicken Soup for the Teenage Soul', 2, 2, 2, 1, 4, 4),
(3, 'The Silent Patient', 3, 3, 1, 2, 5, 5),
(4, 'Gone Girl', 4, 4, 1, 2, 3, 3),
(5, 'Harry Potter and the Philosopher''s Stone', 5, 5, 2, 4, 6, 6),
(6, 'Harry Potter and the Chamber of Secrets', 5, 5, 2, 4, 6, 6),
(7, 'Harry Potter and the Prisoner of Azkaban', 5, 5, 2, 4, 6, 6),
(8, 'Harry Potter and the Goblet of Fire', 5, 5, 2, 4, 6, 6),
(9, 'Harry Potter and the Order of the Phoenix', 5, 5, 2, 4, 6, 6),
(10, 'Harry Potter and the Half-Blood Prince', 5, 5, 2, 4, 6, 6),
(11, 'Harry Potter and the Deathly Hallows', 5, 5, 2, 4, 6, 6),
(12, 'The Lightning Thief', 6, 6, 1, 4, 6, 6),
(13, 'The Sea of Monsters', 6, 6, 1, 4, 6, 6),
(14, 'The Titan''s Curse', 6, 6, 1, 4, 6, 6),
(15, 'The Battle of the Labyrinth', 6, 6, 1, 4, 6, 6),
(16, 'The Last Olympian', 6, 6, 1, 4, 6, 6);

-- Created by Leena (add inline comments) 
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    address TEXT,
    membership_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_type VARCHAR(20) NOT NULL -- student, faculty, staff, etc.
);

INSERT INTO users 
(user_id, first_name, last_name, email, phone_number, address, user_type) 
VALUES 
('1', 'Liya', 'Alemu', 'liya.alemu@example.com', '0911223344', '123 Addis Ababa, Ethiopia', 'Student'),
('2', 'Daniel', 'Tesfaye', 'daniel.tesfaye@example.com', '0922334455', '456 Bahir Dar, Ethiopia', 'Faculty'),
('3', 'Melissa', 'Tandon', 'm.tandon@example.com', '0922334355', '12 St, Blacksburg, Virginia', 'Student');

-- Created by Aayan Khan 
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL -- librarian, admin, etc.
);

ALTER TABLE staff ADD phone_number VARCHAR(20);

INSERT INTO staff (first_name, last_name, email, role, phone_number) 
VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com', 'Librarian', '123-456-7890'),
('Bob', 'Smith', 'bob.smith@example.com', 'Assistant', '234-567-8901'),
('Charlie', 'Davis', 'charlie.davis@example.com', 'Manager', '345-678-9012'),
('David', 'White', 'david.white@example.com', 'Librarian', '456-789-0123');

-- Created by Leena (add inline comments) 
CREATE TABLE borrowing_history (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    staff_id INT,
    borrow_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    due_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    book_status VARCHAR(20) DEFAULT 'Borrowed',  -- Borrowed / Returned / Overdue
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

INSERT INTO borrowing_history (borrow_id, user_id, book_id, staff_id, borrow_date, due_date, return_date, book_status)
VALUES 
(1, 1, 1, 1, '2025-03-01', '2025-03-15', NULL, 'Borrowed'),
(2, 2, 2, 1, '2025-02-20', '2025-02-27', '2025-02-27', 'Returned'),
(3, 3, 3, 1, '2025-03-02', '2025-03-12', NULL, 'Borrowed'),
(4, 1, 4, 1, '2025-03-05', '2025-03-19', NULL, 'Borrowed'),
(5, 2, 5, 1, '2025-02-25', '2025-03-11', '2025-03-11', 'Returned'),
(6, 1, 6, 1, '2025-02-28', '2025-03-07', NULL, 'Overdue'),
(7, 2, 7, 1, '2025-03-01', '2025-03-11', NULL, 'Borrowed'),
(8, 3, 8, 1, '2025-03-03', '2025-03-17', NULL, 'Borrowed'),
(9, 1, 9, 1, '2025-02-15', '2025-03-01', '2025-03-01', 'Returned'),
(10, 2, 10, 1, '2025-02-10', '2025-02-17', NULL, 'Overdue'),
(11, 1, 11, 1, '2025-03-04', '2025-03-14', NULL, 'Borrowed'),
(12, 2, 12, 1, '2025-02-18', '2025-03-04', '2025-03-04', 'Returned'),
(13, 3, 13, 1, '2025-03-02', '2025-03-09', NULL, 'Borrowed'),
(14, 1, 14, 1, '2025-03-01', '2025-03-15', NULL, 'Borrowed'),
(15, 2, 15, 1, '2025-02-22', '2025-03-01', NULL, 'Overdue'),
(16, 3, 16, 1, '2025-03-03', '2025-03-13', NULL, 'Borrowed');

SELECT * FROM borrowing_history;

-- Created by Rishika (add inline comments) 
CREATE TABLE fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    borrow_id INT NOT NULL,
    fine_amount DECIMAL(8,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Unpaid', -- Paid / Unpaid
    payment_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (borrow_id) REFERENCES borrowing_history(borrow_id)
);

INSERT INTO fines (user_id, borrow_id, fine_amount, status, payment_date)
VALUES
(1, 1, 5.00, 'Unpaid', NULL),
(2, 2, 4.00, 'Unpaid', NULL);

-- SELECT * FROM genres;

-- Created by Aayan Khan 
  CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    reservation_date DATE DEFAULT NULL,
    status VARCHAR(20) DEFAULT 'Pending', -- Pending, Cancelled, Completed
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
 
INSERT INTO reservations (user_id, book_id, reservation_date, status)
VALUES 
(1, 1, '2024-03-01', 'Pending'),
(2, 2, '2024-03-02', 'Completed');

-- Created by Soumya (add inline comment) 
CREATE TABLE digital_resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    resource_type VARCHAR(50), -- E-Book, Journal, Article, etc.
    link TEXT NOT NULL
);

INSERT INTO digital_resources (resource_id, title, author, resource_type, link)
VALUES 
(1, 'The Alchemist (eBook)', 'Paulo Coelho', 'eBook', 'https://library.com/resources/the-alchemist-ebook'),
(2, 'Chicken Soup for the Teenage Soul (PDF)', 'Harper Lee', 'PDF', 'https://library.com/resources/chicken-soup-pdf'),
(3, 'The Silent Patient (Audiobook)', 'Alex Michaelides', 'Audiobook', 'https://library.com/resources/silent-patient-audio'),
(4, 'Gone Girl (eBook)', 'Gillian Flynn', 'eBook', 'https://library.com/resources/gone-girl-ebook'),
(5, 'Harry Potter and the Philosopher''s Stone (ePub)', 'J.K. Rowling', 'ePub', 'https://library.com/resources/hp1-epub'),
(6, 'Harry Potter and the Chamber of Secrets (ePub)', 'J.K. Rowling', 'ePub', 'https://library.com/resources/hp2-epub'),
(7, 'Harry Potter and the Prisoner of Azkaban (ePub)', 'J.K. Rowling', 'ePub', 'https://library.com/resources/hp3-epub'),
(8, 'Harry Potter and the Goblet of Fire (ePub)', 'J.K. Rowling', 'ePub', 'https://library.com/resources/hp4-epub'),
(9, 'Harry Potter and the Order of the Phoenix (ePub)', 'J.K. Rowling', 'ePub', 'https://library.com/resources/hp5-epub'),
(10, 'Harry Potter and the Half-Blood Prince (ePub)', 'J.K. Rowling', 'ePub', 'https://library.com/resources/hp6-epub'),
(11, 'Harry Potter and the Deathly Hallows (ePub)', 'J.K. Rowling', 'ePub', 'https://library.com/resources/hp7-epub'),
(12, 'The Lightning Thief (PDF)', 'Rick Riordan', 'PDF', 'https://library.com/resources/percy1-pdf'),
(13, 'The Sea of Monsters (PDF)', 'Rick Riordan', 'PDF', 'https://library.com/resources/percy2-pdf'),
(14, 'The Titan''s Curse (PDF)', 'Rick Riordan', 'PDF', 'https://library.com/resources/percy3-pdf'),
(15, 'The Battle of the Labyrinth (PDF)', 'Rick Riordan', 'PDF', 'https://library.com/resources/percy4-pdf'),
(16, 'The Last Olympian (PDF)', 'Rick Riordan', 'PDF', 'https://library.com/resources/percy5-pdf');

-- Created by Senan 
CREATE TABLE transactions (
  transaction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  transaction_date DATE NOT NULL,
  user_id INT NOT NULL,
  staff_id INT NOT NULL,
  borrow_id INT NOT NULL,
  max_loan_period INT DEFAULT 14, -- typically 14 days
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
  FOREIGN KEY (borrow_id) REFERENCES borrowing_history(borrow_id)
);

-- SELECT * FROM transactions;

INSERT INTO transactions (transaction_date, user_id, staff_id, borrow_id, max_loan_period)
VALUES
('2025-03-01', 1, 1, 1, 14),
('2025-02-20', 2, 2, 2, 14),
('2025-03-02', 3, 1, 3, 14),
('2025-03-05', 1, 2, 4, 14),
('2025-02-25', 2, 1, 5, 14),
('2025-02-28', 1, 2, 6, 14),
('2025-03-01', 2, 1, 7, 14),
('2025-03-03', 3, 2, 8, 14),
('2025-02-15', 1, 1, 9, 14),
('2025-02-10', 2, 2, 10, 14),
('2025-03-04', 1, 1, 11, 14),
('2025-02-18', 2, 2, 12, 14),
('2025-03-02', 3, 1, 13, 14),
('2025-03-01', 1, 2, 14, 14),
('2025-02-22', 2, 1, 15, 14),
('2025-03-03', 3, 2, 16, 14);

-- Created by Senan (add inline comments)
CREATE TABLE book_copies (
    copy_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    shelf_location VARCHAR(50),
    barcode VARCHAR(50) UNIQUE,
    status VARCHAR(20) DEFAULT 'Available', -- Available, Borrowed, Damaged
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
  
INSERT INTO book_copies (book_id, shelf_location, barcode, status)
VALUES 
(1, 'Shelf A1', 'BC0001', 'Available'),
(2, 'Shelf A2', 'BC0002', 'Available'),
(3, 'Shelf A1', 'BC0003', 'Available'),
(4, 'Shelf A2', 'BC0004', 'Available'),
(5, 'Shelf B1', 'BC0005', 'Available'),
(6, 'Shelf B1', 'BC0006', 'Available'),
(7, 'Shelf B2', 'BC0007', 'Available'),
(8, 'Shelf B2', 'BC0008', 'Available'),
(9, 'Shelf C1', 'BC0009', 'Available'),
(10, 'Shelf C1', 'BC0010', 'Available'),
(11, 'Shelf C2', 'BC0011', 'Available'),
(12, 'Shelf D1', 'BC0012', 'Available'),
(13, 'Shelf D1', 'BC0013', 'Available'),
(14, 'Shelf D2', 'BC0014', 'Available'),
(15, 'Shelf D2', 'BC0015', 'Available'),
(16, 'Shelf D3', 'BC0016', 'Available');

-- Created by Aayan Khan  
CREATE TABLE book_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    request_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending', -- Pending, Approved, Rejected
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO book_requests (user_id, title, author, request_date, status)
VALUES
(1, 'The Catcher in the Rye', 'J.D. Salinger', '2024-03-01', 'Pending'),
(2, 'To Kill a Mockingbird', 'Harper Lee', '2024-03-02', 'Approved');

-- Created by Rishika (add inline comments) 
CREATE TABLE book_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO book_reviews (book_id, user_id, review_text, rating)
VALUES
    (1, 1, 'Great book! Highly recommend it to anyone interested in history.', 5),
    (2, 2, 'The plot was a bit slow, but the characters were well-developed.', 4);
  
-- Created by Rishika (add inline comments) 
CREATE TABLE library_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    feedback_text TEXT NOT NULL,
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO library_feedback (user_id, feedback_text)
VALUES
(1, 'A captivating library experience. The resources were easy to access, and the staff was very helpful.'),
(2, 'The library had a good collection, but finding specific resources could be made easier.');

-- Created by  
CREATE TABLE review_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    review_id INT,
    log_action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Complex Query 1 Created by Leena Hussein: Borrowing Summary Per User
-- This query lists all users, including those who haven’t borrowed any books (because of LEFT JOIN).
-- It calculates the total number of books each user has borrowed and the most recent borrow date.
-- Users are sorted so that those with the most recent borrow activity appear first.
SELECT 
    u.User_Id,
    u.First_Name,
    u.Last_Name,
    u.Email,
    u.Membership_Date,
    COUNT(bh.Borrow_Id) AS Total_Books_Borrowed,
    MAX(bh.Borrow_Date) AS Last_Borrowed_Date
FROM users u
LEFT JOIN borrowing_history bh ON u.User_Id = bh.User_Id
GROUP BY 
    u.User_Id, u.First_Name, u.Last_Name, u.Email, u.Membership_Date
ORDER BY Last_Borrowed_Date DESC;

-- Complex Query 2 Created by Leena: Active Users with Pending Reservations and Total Fines
-- Shows only users with at least one pending reservation.
-- Also calculates total fines and flags if any fine is unpaid.
-- Users are sorted by their total fines in descending order.
SELECT 
    u.User_Id,
    u.First_Name,
    u.Last_Name,
    u.Email,
    COUNT(DISTINCT r.Reservation_Id) AS Pending_Reservations,
    SUM(f.Fine_Amount) AS Total_Fines,
    MAX(CASE WHEN f.status = 'Unpaid' THEN 'Yes' ELSE 'No' END) AS Has_Unpaid_Fines
FROM users u
LEFT JOIN reservations r 
    ON u.User_Id = r.User_Id AND r.status = 'Pending'
LEFT JOIN fines f 
    ON u.User_Id = f.User_Id
GROUP BY u.User_Id, u.First_Name, u.Last_Name, u.Email
HAVING Pending_Reservations > 0
ORDER BY Total_Fines DESC;

-- Complex Query 3 Created by Senan: Retrieve all transactions with user and staff details
SELECT 
    t.transaction_id, 
    t.transaction_date, 
    u.user_id, 
    s.staff_id, 
    bc.copy_id
FROM 
    transactions t
JOIN users u ON t.user_id = u.user_id
JOIN staff s ON t.staff_id = s.staff_id
LEFT JOIN borrowing_history bh ON t.borrow_id = bh.borrow_id
LEFT JOIN book_copies bc ON bh.book_id = bc.book_id
LEFT JOIN books b ON bc.book_id = b.book_id;

-- Complex Query 4 Created by Senan: List all book copies along with their genres and publishers
SELECT 
    bc.copy_id,
    b.title AS book_title,
    b.author_id,
    g.genre_name,
    p.publisher_name
FROM 
    book_copies bc
JOIN books b ON bc.book_id = b.book_id
JOIN genres g ON b.genre_id = g.genre_id
JOIN publishers p ON b.publisher_id = p.publisher_id;

-- Complex Query 5
-- Created by Aayan Khan/This SQL query retrieves reservation details, including user information, book title, reservation date, status,
-- and the total number of reservations per user. 
-- It uses joins, a subquery, filtering, and sorting to efficiently fetch and structure the data.
 
SELECT 
    r.reservation_id, 
    u.first_name, 
    u.last_name, 
    u.email, 
    b.title AS book_title, 
    r.reservation_date, 
    r.status AS reservation_status, 
    ur.total_user_reservations
FROM 
    reservations r
JOIN users u ON r.user_id = u.user_id
JOIN books b ON r.book_id = b.book_id
JOIN (
    SELECT user_id, COUNT(*) AS total_user_reservations 
    FROM reservations 
    GROUP BY user_id
) ur ON r.user_id = ur.user_id
WHERE 
    r.status IN ('Pending', 'Completed')
ORDER BY 
    r.reservation_date DESC;

-- Complex Query 6
-- Created by Aayan Khan/ This query retrieves each user's book request history, including the total requests, pending requests, approved requests, rejected requests, 
-- and the latest request date.

SELECT 
    u.User_Id,
    u.First_Name,
    u.Last_Name,
    COUNT(br.Request_Id) AS Total_Requests,
    SUM(CASE WHEN br.status = 'Pending' THEN 1 ELSE 0 END) AS Pending_Requests,
    SUM(CASE WHEN br.status = 'Approved' THEN 1 ELSE 0 END) AS Approved_Requests,
    SUM(CASE WHEN br.status = 'Rejected' THEN 1 ELSE 0 END) AS Rejected_Requests,
    MAX(br.Request_Date) AS Request_Date
FROM book_requests br
JOIN users u ON br.User_Id = u.User_Id
GROUP BY u.User_Id, u.First_Name, u.Last_Name
HAVING COUNT(br.Request_Id) > 0;

-- Complex Query 7 Created by Soumya: Find overdue books 

SELECT 
	b.book_id, 
    b.title, 
    u.user_id, 
    u.first_name, 
    br.due_date
FROM borrowing_history br
JOIN books b ON br.book_id = b.book_id
JOIN users u ON br.user_id = u.user_id
WHERE br.return_date IS NULL AND br.due_date < CURRENT_DATE;

-- Complex Query 8 Created by Soumya: Find the most borrowed books

SELECT 
	b.book_id, 
    b.title, 
    b.author_id, 
    COUNT(*) AS borrow_count
FROM borrowing_history br
JOIN books b ON br.book_id = b.book_id
GROUP BY b.book_id, b.title, b.author_id
ORDER BY borrow_count DESC
LIMIT 10;

-- Complex Query 9 Created by Rishika: Find Books That Have Only Received 4-Star or Higher Reviews

SELECT b.title, MIN(r.rating) AS lowest_rating
FROM books b
JOIN book_reviews r ON b.book_id = r.book_id
GROUP BY b.book_id
HAVING lowest_rating >= 4;

-- Complex Query 10 Created by Rishika: Find the Books with the Highest Average Feedback Rating

SELECT b.title, AVG(lf.rating) AS avg_feedback_rating
FROM books b
JOIN book_reviews lf ON b.book_id = lf.book_id
GROUP BY b.book_id
ORDER BY avg_feedback_rating DESC
LIMIT 1;

-- Created by Leena
DELIMITER //

CREATE PROCEDURE IssueBook(
    IN p_user_id INT,
    IN p_book_id INT,
    IN p_staff_id INT,
    IN p_due_date DATE
)
BEGIN
    INSERT INTO borrowing_history (user_id, book_id, staff_id, borrow_date, due_date, book_status)
    VALUES (p_user_id, p_book_id, p_staff_id, CURRENT_DATE(), p_due_date, 'Borrowed');

    UPDATE books
    SET available_copies = available_copies - 1
    WHERE book_id = p_book_id AND available_copies > 0;
END //

DELIMITER;

SELECT * FROM books;
CALL IssueBook(1, 3, 1, "2025-03-15");
SELECT * FROM borrowing_history;
SELECT * FROM books;

-- Created by
-- DROP PROCEDURE ReturnBook;

DELIMITER //

CREATE PROCEDURE ReturnBook(
    IN p_borrow_id INT
)
BEGIN
    UPDATE borrowing_history
    SET return_date = CURRENT_DATE(),
        book_status = 'Returned'
    WHERE borrow_id = p_borrow_id;
END //

DELIMITER;

CALL ReturnBook(1);

-- 
DELIMITER //

CREATE PROCEDURE PayFine(
    IN p_fine_id INT
)
BEGIN
    UPDATE fines
    SET status = 'Paid',
        payment_date = CURRENT_DATE()
    WHERE fine_id = p_fine_id;
END //

DELIMITER;

SELECT * FROM fines;
CALL PayFine(1);
SELECT * FROM fines;

DROP PROCEDURE UpdateTransactionStatus;
-- Stored Procedure to update transacted item as closed where book status is returned
-- in borrowed books table
-- DELIMITER //
-- CREATE PROCEDURE UpdateTransactionStatus()
-- BEGIN
--     UPDATE transactions t
--     JOIN borrowing_history bh ON t.Borrow_Id = bh.Borrow_Id
--     SET t.Transaction_Status = 'Closed'
--     WHERE bh.Book_Status = 'Returned';
-- END //
-- DELIMITER ;

-- CALL UpdateTransactionStatus();

-- Created by Aayan Khan
-- retrieve all books borrowed by a specific user with basic info.
DELIMITER $$

CREATE PROCEDURE GetUserBorrowedBooks(
    IN in_user_id INT
)
BEGIN
    SELECT 
        bh.Borrow_Id,
        b.Title,
        bh.Borrow_Date,
        bh.Due_Date,
        bh.Return_Date,
        bh.Book_Status
    FROM borrowing_history bh
    JOIN books b ON bh.Book_Id = b.Book_Id
    WHERE bh.User_Id = in_user_id;
END$$

DELIMITER;

CALL GetUserBorrowedBooks(1);

-- Created by
DELIMITER //

CREATE PROCEDURE AddBookReview (
    IN p_book_id INT,
    IN p_user_id INT,
    IN p_review_text TEXT,
    IN p_rating INT
)
BEGIN
    DECLARE book_exists INT;
    DECLARE user_exists INT;

    -- Check if the book exists
    SELECT COUNT(*) INTO book_exists FROM books WHERE book_id = p_book_id;
    -- Check if the user exists
    SELECT COUNT(*) INTO user_exists FROM users WHERE user_id = p_user_id;

    IF book_exists = 1 AND user_exists = 1 THEN
        INSERT INTO book_reviews (book_id, user_id, review_text, rating)
        VALUES (p_book_id, p_user_id, p_review_text, p_rating);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid book_id or user_id';
    END IF;
END //

DELIMITER;

-- Created by Leena
DELIMITER //

CREATE FUNCTION GetTotalFines(userId INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT IFNULL(SUM(Fine_Amount), 0) 
    INTO total
    FROM fines
    WHERE User_Id = userId;
    
    RETURN total;
END //

DELIMITER;

-- Stored Function to find most transacted item (Created by Senan)
DELIMITER $$

CREATE FUNCTION GetMostTransactedBook()
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE v_Book_Title VARCHAR(255);

    -- Find the most transacted book title
    SELECT b.title INTO v_Book_Title
    FROM books b
    JOIN (
        SELECT bh.book_id
        FROM transactions t
        JOIN borrowing_history bh ON t.borrow_id = bh.borrow_id
        GROUP BY bh.book_id
        ORDER BY COUNT(*) DESC
        LIMIT 1
    ) AS top_book
    ON b.book_id = top_book.book_id;

    RETURN v_Book_Title;
END$$

DELIMITER ;
SELECT GetMostTransactedBook() AS Most_Popular_Book;

-- Created by Aayan Khan
-- This stored function returns a combined string that includes both the user's full name and their total unpaid fine
-- Take a User_Id as input.
-- Look up the user’s full name from the users table.
-- Calculate the total unpaid fine from the fines table. 

DELIMITER $$

CREATE FUNCTION GetUserFineDetails(in_user_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE total_fine DECIMAL(10,2) DEFAULT 0.00;
    DECLARE full_name VARCHAR(100);

    -- Get total unpaid fine for the user
    SELECT SUM(fine_amount)
    INTO total_fine
    FROM fines
    WHERE user_id = in_user_id AND status = 'Unpaid';

    -- If no fines exist, default to 0
    IF total_fine IS NULL THEN
        SET total_fine = 0.00;
    END IF;

    -- Get full name of the user
    SELECT CONCAT(first_name, ' ', last_name)
    INTO full_name
    FROM users
    WHERE user_id = in_user_id;

    -- Return combined result: user's full name and total fine
    RETURN CONCAT(full_name, ' - Total Fine: $', FORMAT(total_fine, 2));
END$$

DELIMITER ;

SELECT GetUserFineDetails(2);
SELECT 
    User_Id,
    GetUserFineDetails(User_Id) AS UserFineInfo
FROM users;

-- Created by
-- DROP FUNCTION IsBookReservable;
DELIMITER $$

CREATE FUNCTION IsBookReservable(p_book_id INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE book_status VARCHAR(20);

    -- Check if book has available copies
    SELECT CASE
        WHEN available_copies > 0 THEN 'Reservable'
        ELSE 'Not Reservable'
    END
    INTO book_status
    FROM books
    WHERE book_id = p_book_id;

    RETURN book_status;
END;$$

DELIMITER ; 

SELECT * FROM books;
SELECT IsBookReservable(1);

-- Created by 
-- DROP FUNCTION GetAverageRating;
DELIMITER //

CREATE FUNCTION GetAverageRating(p_book_id INT)
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    SELECT AVG(rating) INTO avg_rating
    FROM book_reviews
    WHERE book_id = p_book_id;

    RETURN IFNULL(avg_rating, 0.0);
END //

DELIMITER ;

SELECT GetAverageRating(1);

-- Created by
DELIMITER //

CREATE FUNCTION GetUserOverdueCount(p_user_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE overdue_count INT;

    SELECT COUNT(*) INTO overdue_count
    FROM borrowing_history
    WHERE User_Id = p_user_id
      AND Book_Status = 'Borrowed'
      AND Due_Date < CURDATE();

    RETURN overdue_count;
END //

DELIMITER ;

SELECT 
    u.User_Id,
    u.First_Name,
    u.Last_Name,
    GetUserOverdueCount(u.User_Id) AS OverdueBooks
FROM users u;

SELECT GetUserOverdueCount(1) AS OverdueBooks;

-- Created by Leena
-- This trigger automatically updates the status of a fine to 'Paid' if its amount is reduced to 0 or less after an update. 
-- It ensures consistency between the fine_amount and status fields.
DELIMITER //

CREATE TRIGGER update_fine_status
BEFORE UPDATE ON fines
FOR EACH ROW
BEGIN
    IF NEW.fine_amount <= 0 AND NEW.status != 'Paid' THEN
        SET NEW.status = 'Paid';
    END IF;
END //

DELIMITER ;

-- Created by Aayan Khan
-- This trigger automatically inserts a fine when a book is returned late in the borrowing_history table.
-- Table: borrowing_history
-- Event: AFTER UPDATE
-- Condition: When Return_Date is set, and it's later than Due_Date
-- Action: Insert a record into fines with calculated fine amount.
DELIMITER $$

CREATE TRIGGER add_fine_on_late_return
AFTER UPDATE ON borrowing_history
FOR EACH ROW
BEGIN
    DECLARE fine_days INT;
    DECLARE fine_amount DECIMAL(10,2);

    -- Check if Return_Date is updated and is after Due_Date
    IF NEW.Return_Date IS NOT NULL AND NEW.Return_Date > NEW.Due_Date THEN
        SET fine_days = DATEDIFF(NEW.Return_Date, NEW.Due_Date);
        SET fine_amount = fine_days * 1.00;

        -- Insert the fine record
        INSERT INTO fines(User_Id, Book_Id, Due_Date, Return_Date, Fine_Amount, Fine_Status)
        VALUES(NEW.User_Id, NEW.Book_Id, NEW.Due_Date, NEW.Return_Date, fine_amount, 'Unpaid');
    END IF;
END$$

DELIMITER ;

-- Created by
-- DROP TRIGGER after_return_book_restore_stock;

DELIMITER //

CREATE TRIGGER after_return_book_restore_stock
AFTER UPDATE ON borrowing_history
FOR EACH ROW
BEGIN
    IF NEW.book_status = 'Returned' AND OLD.book_status <> 'Returned' THEN
        UPDATE books
        SET available_copies = available_copies + 1
        WHERE book_id = NEW.book_id;
    END IF;
END //

DELIMITER ;

-- Created by 
DELIMITER //

CREATE TRIGGER after_review_insert
AFTER INSERT ON book_reviews
FOR EACH ROW
BEGIN
    INSERT INTO review_logs (review_id, log_action)
    VALUES (NEW.review_id, 'Review Added');
END //

DELIMITER ;

-- 
DELIMITER //

CREATE TRIGGER after_issue_book_reduce_stock
AFTER INSERT ON borrowing_history
FOR EACH ROW
BEGIN
    UPDATE books
    SET available_copies = available_copies - 1
    WHERE book_id = NEW.book_id;
END //

DELIMITER ;