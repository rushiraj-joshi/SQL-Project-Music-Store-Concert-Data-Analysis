create database music_database; 
use music_database; 
create table customer (
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    company VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(255),
    support_rep_id INT
);
-- data has been imported from customer csv file -- 

select * from customer; 

CREATE TABLE album (
    album_id INT PRIMARY KEY,
    title VARCHAR(255),
    artist_id INT
);

select * from album; 

-- data has been imported from album2 csv file -- 

CREATE TABLE artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(255)
);

select * from artist; 

-- data has been imported from artist csv file -- 

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    title VARCHAR(255),
    reports_to INT, 
    levels VARCHAR(50),
    birthdate DATETIME,
    hire_date DATE,
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    postal_code VARCHAR(20),
    phone VARCHAR(20), 
    fax VARCHAR(20),
    email VARCHAR(255)
);

select * from employee; 

INSERT INTO employee (employee_id, last_name, first_name, title, reports_to, levels, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES
(1, 'Adams', 'Andrew', 'General Manager', 9, 'L6', '1962-02-18 00:00:00', '2016-08-14 00:00:00', '11120 Jasper Ave NW', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'andrew@chinookcorp.com'),
(2, 'Edwards', 'Nancy', 'Sales Manager', 1, 'L4', '1958-12-08 00:00:00', '2016-05-01 00:00:00', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3322', 'nancy@chinookcorp.com'),
(3, 'Peacock', 'Jane', 'Sales Support Agent', 2, 'L1', '1973-08-29 00:00:00', '2017-04-01 00:00:00', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com'),
(4, 'Park', 'Margaret', 'Sales Support Agent', 2, 'L1', '1947-09-19 00:00:00', '2017-05-03 00:00:00', '683 10 Street SW', 'Calgary', 'AB', 'Canada', 'T2P 5G3', '+1 (403) 263-4423', '+1 (403) 263-4289', 'margaret@chinookcorp.com'),
(5, 'Johnson', 'Steve', 'Sales Support Agent', 2, 'L1', '1965-03-03 00:00:00', '2017-10-17 00:00:00', '7727B 41 Ave', 'Calgary', 'AB', 'Canada', 'T3B 1Y7', '+1 (780) 836-9987', '+1 (780) 836-9543', 'steve@chinookcorp.com'),
(6, 'Mitchell', 'Michael', 'IT Manager', 1, 'L3', '1973-07-01 00:00:00', '2016-10-17 00:00:00', '5827 Bowness Road NW', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (403) 246-9887', '+1 (403) 246-9899', 'michael@chinookcorp.com'),
(7, 'King', 'Robert', 'IT Staff', 6, 'L2', '1970-05-29 00:00:00', '2017-01-02 00:00:00', '590 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (403) 456-9986', '+1 (403) 456-8485', 'robert@chinookcorp.com'),
(8, 'Callahan', 'Laura', 'IT Staff', 6, 'L2', '1968-01-09 00:00:00', '2017-03-04 00:00:00', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3351', '+1 (403) 467-8772', 'laura@chinookcorp.com'),
(9, 'Madan', 'Mohan', 'Senior General Manager', NULL, 'L7', '1961-01-26 00:00:00', '2016-01-14 00:00:00', '1008 Vrinda Ave MT', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'madan.mohan@chinookcorp.com');

CREATE TABLE genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(255)
);

select * from genre; 

CREATE TABLE invoice (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_date DATETIME,
    billing_address VARCHAR(255),
    billing_city VARCHAR(255),
    billing_state VARCHAR(255),
    billing_country VARCHAR(255),
    billing_postal_code VARCHAR(20),
    total DECIMAL(10, 2)
);

select * from invoice; 

-- data has been imported from invoice csv file -- 

CREATE TABLE invoice_line (
    invoice_line_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    track_id INT,
    unit_price DECIMAL(10, 2),
    quantity INT
);

select * from invoice_line; 

-- data has been imported from invoice_line csv file -- 

CREATE TABLE media_type (
    media_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

select * from media_type; 

-- data has been imported from media_type csv file -- 

CREATE TABLE playlist (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

select * from playlist; 

-- data has been imported from playlist csv file -- 

CREATE TABLE playlist_track (
    playlist_id INT,
    track_id INT
);

select * from playlist_track ; 

-- data has been imported from playlist_track csv file -- 

CREATE TABLE track (
    track_id INT PRIMARY KEY,
    name VARCHAR(255),
    album_id INT,
    media_type_id INT,
    genre_id INT,
    composer VARCHAR(255),
    milliseconds INT,
    bytes INT,
    unit_price DECIMAL(10, 2)
);

select * from track ; 

-- data has been imported from track csv file -- 



-- Who is the senior most employee based on job title? --

select * from employee
order by levels desc 
limit 1 ; 

-- Which country has the most invoices? --

select count(*) as c, billing_country from invoice
group by billing_country
order by c desc
limit 1; 

-- What are top 3 values of total invoices? --

select * from invoice 
order by total desc
limit 3; 

-- Which city has the best customers? We would like to throw a promotional music festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoices 
-- totals. Return both the city name and sum of all invoices total?

SELECT SUM(total) AS invoice_total, billing_city 
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC
limit 1; 

-- Who is the best customer? The customer that has spent the most money will be declared as the best customer. Write a query that returns the person who has spent the most money? --

select customer.customer_id , customer.first_name , customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id= invoice.customer_id
group by customer.customer_id
order by total desc
limit 1; 

select * from customer; 