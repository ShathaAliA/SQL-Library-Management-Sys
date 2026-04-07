-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- 2. Book Table
CREATE TABLE IF NOT EXISTS Book (
  BookID INT,
  Title VARCHAR(255),
  Category VARCHAR(100),
  PublicationYear INT,
  IsAvailable BOOLEAN,
  CONSTRAINT Book_PK PRIMARY KEY(BookID)
);

-- 3. BookAuthor Table
CREATE TABLE IF NOT EXISTS BookAuthor (
  BookID INT,
  AuthorName VARCHAR(255),
  CONSTRAINT BookAuthor_PK PRIMARY KEY (BookID, AuthorName),
  CONSTRAINT BookAuthor_FK FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

-- 4. Member Table
CREATE TABLE IF NOT EXISTS Members (
  MemberID INT,
  FirstName VARCHAR(50),
  MiddleName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100) UNIQUE,
  CONSTRAINT Members_PK PRIMARY KEY (MemberID)
);
-- 5. MemberPhone Table
CREATE TABLE IF NOT EXISTS MemberPhone (
  MemberID INT,
  PhoneNumber VARCHAR(15),
  CONSTRAINT MemberPhone_PK PRIMARY KEY (MemberID, PhoneNumber),
  CONSTRAINT MemberPhone_FK FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- 6. Employee Table
CREATE TABLE IF NOT EXISTS Employee (
  EmployeeID INT ,
  FirstName VARCHAR(50),
  MiddleName VARCHAR(50),
  LastName VARCHAR(50),
  Position VARCHAR(50),
  Phone VARCHAR(15),
  CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID)
);

-- 7. Loan Table
CREATE TABLE IF NOT EXISTS Loan (
  LoanID INT,
  MemberID INT,
  BookID INT,
  EmployeeID INT,
  LoanDate DATE,
  DueDate DATE,
  ReturnDate DATE,
  CONSTRAINT Loan_PK PRIMARY KEY (LoanID),
  CONSTRAINT Loan_Member_FK FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
  CONSTRAINT Loan_Book_FK FOREIGN KEY (BookID) REFERENCES Book(BookID) ON UPDATE CASCADE,
  CONSTRAINT Loan_Employee_FK FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- 8. Fine Table
CREATE TABLE IF NOT EXISTS Fine (
  FineID INT,
  Amount DECIMAL(8,2),
  PaidStatus VARCHAR(20),
  LoanID INT UNIQUE,
  CONSTRAINT Fine_PK PRIMARY KEY (FineID),
  CONSTRAINT Fine_FK FOREIGN KEY (LoanID) REFERENCES Loan(LoanID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 9. INSERT Book
INSERT INTO Book (BookID, Title, Category, PublicationYear, IsAvailable)
VALUES
  (101, 'Artificial Intelligence: A Modern Approach', 'Technology', 2020, TRUE),
  (102, 'To Kill a Mockingbird', 'Literature', 1960, TRUE),
  (103, 'Data Structures and Algorithms in Python', 'Education', 2019, FALSE),
  (104, 'The Great Gatsby', 'Literature', 1925, TRUE),
  (105, 'Clean Code', 'Programming', 2008, TRUE),
  (106, 'Design Patterns', 'Software Engineering', 2004, TRUE),
  (107, 'The Pragmatic Programmer', 'Programming', 1999, FALSE),
  (108, '1984', 'Literature', 1949, TRUE),
  (109, 'Python Crash Course', 'Education', 2021, TRUE),
  (110, 'Cracking the Coding Interview', 'Career', 2015, TRUE),
  (111, 'The Clean Coder', 'Programming', 2011, FALSE),
  (112, 'Sapiens', 'History', 2011, TRUE),
  (113, 'The Alchemist', 'Literature', 1988, TRUE),
  (114, 'Algorithms Unlocked', 'Technology', 2013, TRUE),
  (115, 'Refactoring', 'Software Engineering', 2018, TRUE),
  (116, 'Deep Work', 'Productivity', 2016, TRUE),
  (117, 'Atomic Habits', 'Self-help', 2018, TRUE),
  (118, 'Thinking, Fast and Slow', 'Psychology', 2011, TRUE),
  (119, 'Dune', 'Science Fiction', 1965, FALSE),
  (120, 'Brave New World', 'Literature', 1932, TRUE),
  (121, 'Head First Java', 'Education', 2003, TRUE),
  (122, 'You Don’t Know JS', 'Programming', 2015, TRUE),
  (123, 'HTML and CSS', 'Web Development', 2011, FALSE),
  (124, 'Eloquent JavaScript', 'Programming', 2018, TRUE),
  (125, 'The Mythical Man-Month', 'Software Engineering', 1975, TRUE),
  (126, 'Harry Potter And The Sorcerer''s Stone', 'Fantasy', 1997, FALSE);
  
-- 10. INSERT BookAuthor
INSERT INTO BookAuthor (BookID, AuthorName) VALUES
(101, 'Stuart Russell'),
(101, 'Peter Norvig'),
(102, 'Harper Lee'),
(103, 'Michael T. Goodrich'),
(103, 'Roberto Tamassia'),
(103, 'Michael H. Goldwasser'),
(104, 'F. Scott Fitzgerald'),
(105, 'Robert C. Martin'),
(106, 'Erich Gamma'),
(106, 'Richard Helm'),
(106, 'Ralph Johnson'),
(106, 'John Vlissides'),
(107, 'Andrew Hunt'),
(107, 'David Thomas'),
(108, 'George Orwell'),
(109, 'Eric Matthes'),
(110, 'Gayle Laakmann McDowell'),
(111, 'Robert C. Martin'),
(112, 'Yuval Noah Harari'),
(113, 'Paulo Coelho'),
(114, 'Thomas H. Cormen'),  
(115, 'Martin Fowler'),
(116, 'Cal Newport'),
(117, 'James Clear'),
(118, 'Daniel Kahneman'),
(119, 'Frank Herbert'),
(120, 'Aldous Huxley'),
(121, 'Kathy Sierra'),
(121, 'Bert Bates'),
(122, 'Kyle Simpson'),
(123, 'Jon Duckett'),
(124, 'Marijn Haverbeke'),
(125, 'Frederick P. Brooks Jr.'),
(126, 'J.K. Rowling');


-- 11. INSERT Members
  INSERT INTO Members (MemberID, FirstName, MiddleName, LastName, Email) VALUES
  (1, 'Ahlam', 'Omar', 'Alharbi', 'ahlamOmar@example.com'),
  (2, 'Sara', 'Mohammed', 'Alqahtani', 'sara.qahtani@example.com'),
  (3, 'Abdullah', 'Nasser', 'Alotaibi', 'abdullah.alotaibi@example.com'),
  (4, 'Lama', 'Abdulaziz', 'Alsaif', 'lama@example.com'),
  (5, 'Rami', 'Salem', 'Alharbi', 'rami.harbi@example.com'),
  (6, 'Dana', 'Mohammed', 'Alghamdi', 'dana.g@example.com'),
  (7, 'Faisal', 'Ali', 'Aljohani', 'faisal.j@example.com'),
  (8, 'Noura', 'Abdullah', 'Alotaibi', 'noura.o@example.com'),
  (9, 'Yousef', 'Ibrahim', 'Alshehri', 'yousef.s@example.com'),
  (10, 'Reem', 'Saad', 'Almutairi', 'reem.m@example.com'),
  (11, 'Majed', 'Fahad', 'Alqahtani', 'majed.q@example.com'),
  (12, 'Hana', 'Turki', 'Alzahrani', 'hana.z@example.com');
  
  -- 12. INSERT MemberPhones
  INSERT INTO MemberPhone (MemberID, PhoneNumber) VALUES
  (1,  '0551234567'),
  (2,  '0509876543'), 
  (2,  '0543211234'),
  (3,  '0567894321'),
  (4,  '0552223333'),
  (5,  '0563334444'),
  (5,  '0545556666'),
  (6,  '0556667777'),
  (7,  '0548889999'),
  (8,  '0534445555'),
  (9,  '0501234567'),
  (10, '0512345678'),
  (11, '0523456789'),
  (12, '0534567890');
  
-- 13. INSERT Employee
  INSERT INTO Employee (EmployeeID, FirstName, MiddleName, LastName, Position, Phone) VALUES
  (101, 'Ahmed', 'Omar', 'Alrashid', 'Librarian', '0531112233'),
  (102, 'Mona', 'Fahad', 'Alzahrani', 'Assistant', '0569988776'),
  (103, 'Fahad', 'Saleh', 'Alsubaie', 'Librarian', '0540001111'),
  (104, 'Layla', 'Hassan', 'Alghamdi', 'Assistant', '0541112222'),
  (105, 'Khalid', 'Majed', 'Alotaibi', 'Librarian', '0551239876'),
  (106, 'Amani', 'Nasser', 'Alenzi', 'Clerk', '0564567890');
  
-- 14. INSERT Loan
  INSERT INTO Loan (LoanID, MemberID, BookID, EmployeeID, LoanDate, DueDate, ReturnDate) VALUES
  (1001, 1, 101, 101, '2025-07-01', '2025-07-14', '2025-07-13'),
  (1002, 2, 102, 102, '2025-07-05', '2025-07-19', '2025-07-25'),
  (1003, 3, 103, 101, '2025-07-10', '2025-07-24', NULL),
  (1004, 4, 106, 103, '2025-07-12', '2025-07-26', NULL),
  (1005, 5, 107, 103, '2025-07-13', '2025-07-27', '2025-07-26'),
  (1006, 6, 108, 104, '2025-07-14', '2025-07-28', NULL),
  (1007, 7, 109, 104, '2025-07-15', '2025-07-29', '2025-07-30'),
  (1008, 8, 110, 105, '2025-07-16', '2025-07-30', NULL),
  (1009, 9, 111, 105, '2025-07-17', '2025-07-31', NULL),
  (1010, 10, 112, 106, '2025-07-18', '2025-08-01', NULL),
  (1011, 11, 113, 106, '2025-07-19', '2025-08-02', NULL),
  (1012, 12, 114, 103, '2025-07-20', '2025-08-03', NULL),
  (1013, 4, 115, 103, '2025-07-21', '2025-08-04', NULL),
  (1014, 5, 116, 104, '2025-07-22', '2025-08-05', NULL),
  (1015, 6, 117, 105, '2025-07-23', '2025-08-06', NULL);
  
-- 15. INSERT Fine
  INSERT INTO Fine (FineID, Amount, PaidStatus, LoanID) VALUES
  (5001, 10.00, 'Unpaid', 1002),
  (5002, 5.00, 'Paid', 1001),
  (5003, 15.00, 'Unpaid', 1005),
  (5004, 20.00, 'Paid', 1007),
  (5005, 10.00, 'Unpaid', 1008),
  (5006, 5.00, 'Paid', 1009),
  (5007, 8.50, 'Unpaid', 1011),
  (5008, 12.00, 'Paid', 1012),
  (5009, 9.00, 'Unpaid', 1013),
  (5010, 7.75, 'Paid', 1015);
  
  
SELECT * FROM book;
SELECT * FROM bookauthor;
SELECT * FROM employee;
SELECT * FROM fine;
SELECT * FROM loan;
SELECT * FROM Members;
SELECT * FROM MemberPhone;

-- 16 SELECT Command

  -- (WHERE) 
SELECT Title, Category, PublicationYear
FROM Book
WHERE IsAvailable = 1;

  -- (JOIN )
SELECT 
  M.FirstName AS MemberFirst,
  M.LastName AS MemberLast,
  B.Title AS BookTitle
FROM Loan L
INNER JOIN Members M ON L.MemberID = M.MemberID
INNER JOIN Book B ON L.BookID = B.BookID;

  -- (GROUP BY) 
SELECT MemberID, COUNT(*) AS TotalLoans
FROM Loan
GROUP BY MemberID;

  -- (HAVING)
SELECT MemberID, COUNT(*) AS TotalLoans
FROM Loan
GROUP BY MemberID
HAVING COUNT(*) >= 2;

  -- (ORDER BY)
SELECT Title, PublicationYear
FROM Book
ORDER BY PublicationYear DESC;

  -- (SUBQUERY)
SELECT Title
FROM Book
WHERE BookID IN (
  SELECT BookID
  FROM Loan
  WHERE LoanID IN (
    SELECT LoanID
    FROM Fine
  )
);
  
 
-- 17. UPDATE Command
 
 UPDATE Book
SET Category = 'Updated Technology', IsAvailable = FALSE
WHERE BookID = 101;

UPDATE BookAuthor
SET AuthorName = 'Dr. Stuart Russell'
WHERE BookID = 101 AND AuthorName = 'Stuart Russell';

UPDATE Members
SET FirstName = 'Sahm', Email = 'sahm.qahtani@example.com'
WHERE MemberID = 2;

UPDATE MemberPhone
SET PhoneNumber = '0545558866'
WHERE MemberID = 5 AND PhoneNumber = '0545556666';

UPDATE Employee
SET Position = 'Senior Librarian', Phone = '0530008431'
WHERE EmployeeID = 105;

UPDATE Loan
SET ReturnDate = '2025-07-20'
WHERE LoanID = 1003;

UPDATE Fine
SET PaidStatus = 'Paid', Amount = Amount - 2.00
WHERE FineID = 5001;


-- 18. DELETE Command

DELETE FROM Fine
WHERE Amount < 10;

DELETE FROM Loan
WHERE ReturnDate IS NOT NULL;

