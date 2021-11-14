CREATE DATABASE liberary;
USE liberary;
CREATE TABLE Books_Details(
Book_Id TINYINT,
Book_Name VARCHAR(20)UNIQUE,
Author_Name VARCHAR(30)NOT NULL,
Book_Price FLOAT DEFAULT 500,
Publish_year YEAR CHECK(Publish_Year>'2000'),
Publish_Volume CHAR(10),
PRIMARY KEY(Book_Id)
);
SHOW TABLES;
DESCRIBE Books_Details;
SELECT*FROM Books_Details;

-- first way of insert

INSERT INTO Books_Details VALUE(1,'DBMS','Ballguru Swamy',495.00,'2005','V3');
INSERT INTO Books_Details VALUE(2,'Data Structure','Padma Reddy',595.00,'2017','V6'),
(3,'Algorithem','jeff',600.00,'2010','V4'),(4,'400 Days','Chethan Bhagath',500.00,'2003','V3'),
(5,'The junjle Book','Rudyard Alpling',800.00,'2011','V5');
INSERT INTO Books_Details  VALUE(1,'Ballguru Swamy','DBMS',495.00,'2005',47.00);
INSERT INTO Books_Details VALUE(7,'Data SCIENCE','Padma Reddy',595.00,'2017','V6'),
(8,'Art','jeff',600.00,'2010','V4'),(9,'500 Days','Chethan Bhagath',500.00,'2003','V3'),
(10,'The junjle Books','Rudyard Alpling',800.00,'2011','V5');

-- second way of insert

INSERT INTO Books_Details(Book_Id,Book_Name,Author_Name,Book_Price)VALUE
(4,'400 Days','Chethan Bhagath',400.00);
INSERT INTO Books_Details(Book_Id,Book_Name,Author_Name,Publish_Year)VALUE (6,'hirerchy','Bhagath','2003');
INSERT INTO Books_Details(Book_Id,Book_Name,Book_Price,Publish_Year)VALUE
(5,'The junjle Book',800.00,'2011');
INSERT INTO Books_Details(Book_Id,Book_Name,Author_Name,Publish_Year)VALUE (11,'hirerchy1','Bhagath','2003');
INSERT INTO Books_Details(Book_Id,Book_Name,Author_Name,Publish_Year)VALUE (12,'hirerchy2','Bhagath','2003');

SELECT Book_Id,Book_Name,Author_Name FROM Books_Details;
SELECT*FROM Books_Details WHERE Publish_Year='2005';
SELECT*FROM Books_Details WHERE Publish_Year>='2005';
SELECT*FROM Books_Details WHERE Publish_Year<='2005';
SELECT*FROM  Books_Details WHERE publish_volume='V5';
SELECT*FROM  Books_Details WHERE publish_volume='V6' and publish_year>='2000';

ALTER TABLE Books_Details ADD COLUMN no_of_pages int;
ALTER TABLE Books_Details DROP COLUMN no_of_pages;
ALTER TABLE Books_Details RENAME COLUMN book_price to book_amount;
ALTER TABLE Books_Details RENAME TO  books;
SELECT*FROM books;
TRUNCATE books;
DROP TABLE books;

SELECT*FROM  Books_Details WHERE publish_volume IS NULL;
SELECT*FROM  Books_Details WHERE publish_volume IS NOT NULL;

UPDATE Books_Details SET Publish_volume='V1' WHERE BOOK_id=1;
UPDATE Books_Details SET Publish_volume='V1' WHERE BOOK_id=5;
UPDATE Books_Details SET book_price=500 WHERE BOOK_id=10;
UPDATE Books_Details SET book_price=500,publish_volume='V2' WHERE BOOK_id=11;
UPDATE Books_Details SET author_name='' WHERE Book_id=10;


DELETE FROM Books_Details WHERE Book_id=1;
DELETE FROM Books_Details WHERE Book_id=2 OR book_name='data science';

SELECT*FROM books_details ORDER BY Book_price;
SELECT*FROM books_details ORDER BY Book_price DESC;
SELECT*FROM books_details ORDER BY Book_name;
SELECT*FROM books_details ORDER BY Book_name DESC;

SELECT*FROM books_details LIMIT 10;
SELECT*FROM books_details LIMIT 5;
SELECT*FROM books_details ORDER BY book_id DESC LIMIT 5; 

SELECT*FROM Books_Details WHERE Book_Name='art' OR Book_Name='500 days' OR Book_name='400 days';
SELECT*FROM Books_Details WHERE Book_Name IN('art','500 days','400 days');
SELECT*FROM Books_Details WHERE Book_price IN(495,500,800);
SELECT*FROM Books_Details WHERE Book_price BETWEEN 400 AND 800;
SELECT*FROM Books_Details WHERE Publish_year BETWEEN 2005 AND 2020;
SELECT*FROM Books_Details WHERE Publish_year BETWEEN 2005 AND 2020 ORDER BY publish_year;

-- AS
SELECT book_price AS book_amount FROM Books_Details WHERE book_price>500;
SELECT book_price AS books_with_amount_price_greater_than_800 FROM  Books_Details WHERE book_price>500;
SELECT B.Book_price AS books_amount FROM Books_details B;
SELECT Book_amount FROM books_details;

SELECT author_name FROM books_details;
SELECT DISTINCT author_name FROM books_details;
SELECT DISTINCT author_name,publish_year FROM  books_details;

ALTER TABLE Books_Details MODIFY book_name VARCHAR(35); -- UNIQUE,NOT NULL
ALTER TABLE Books_Details ADD CONSTRAINT PRIMARY KEY(book_name);

SELECT*FROM Books_Details;
SELECT*FROM Books_Details WHERE book_name='400 days';
SELECT*FROM Books_Details WHERE book_name LIKE '%days';
SELECT*FROM Books_Details WHERE book_name LIKE 'data%';
SELECT*FROM Books_Details WHERE book_name LIKE '%junjle%';
SELECT*FROM Books_Details WHERE book_name LIKE '%r%';
SELECT*FROM Books_Details WHERE book_name LIKE '_a%';
SELECT*FROM Books_Details WHERE book_name LIKE '_a_a%';
SELECT*FROM Books_Details WHERE book_name LIKE '__a%';

-- date and time
SELECT CURDATE() AS present_date;
SELECT CURTIME() AS present_time;
SELECT NOW() AS present_date_time;

SELECT DATE('2021-11-13 13:55:22')AS extracted_date;
SELECT DATE(NOW())AS extracted_date;

SELECT TIME('2021-11-13 13:55:22')AS extracted_time;
SELECT TIME(NOW())AS extracted_time;

SELECT DAYOFMONTH('2021-11-13 13:55:22')AS extracted_day;
SELECT MONTH('2021-11-13 13:55:22')AS extracted_Month;
SELECT YEAR('2021-11-13 13:55:22')AS extracted_year;
SELECT WEEK('2021-11-13 13:55:22')AS extracted_Week;
SELECT DAYNAME('2021-11-13 13:55:22')AS extracted_Dayname;

-- get the highest cost of the book from books_details table
SELECT MAX(Book_price)FROM books_details;

-- get the LOWEST cost of the book from books_details table
SELECT MIN(Book_price)AS lowest_cost_of_book FROM books_details;

-- get the average cost of the book from books_details table
SELECT AVG(Book_price)AS Average_cost_of_books FROM books_details;

-- get the total cost of all the books from books_details table
SELECT SUM(Book_price)AS total_cost_of_books FROM books_details;

-- get the total number of the books from books_details table
SELECT COUNT(Book_name)AS no_of_books FROM books_details;
SELECT COUNT(Book_id)AS no_of_books FROM books_details;
SELECT COUNT(*)AS no_of_books FROM books_details;

-- get the no of books written by each author
SELECT author_name,COUNT(Book_name)AS no_of_books_written_by_author FROM books_details GROUP BY author_name;

-- get the no of books grouped by price
SELECT book_price,COUNT(Book_price)AS no_of_books_by_price FROM books_details GROUP BY Book_price;


-- get the books grouped by publish year
SELECT publish_year,COUNT(book_name)AS no_of_books_in_year FROM books_details GROUP BY publish_year;

-- get the books published in the year after 2005
SELECT publish_year,COUNT(book_name)AS no_of_books_in_year FROM books_details WHERE publish_year>2005 GROUP BY publish_year;

-- no of copies of each book
SELECT book_name,COUNT(book_name)AS no_of_copies FROM books_details  GROUP BY book_name;





