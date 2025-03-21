# Name: MUKUNDENTE Gloria
# ID: 26687
 
# WED_26687_MUKUNDENTE_Gloria_AssI

## Problem Statement

The current hotel reservation system faces challenges such as double bookings, inefficient data retrieval, and difficulty managing guest information. 
A centralized hotel database reservation system is needed to streamline room availability, track guest details, manage bookings, and handle payments efficiently. 
This system will ensure accurate reservations, improve operational efficiency, and enhance the guest experience.
## Entity Relational Diagram/ Conceptual Diagram

![Screenshot 2025-02-27 102021](https://github.com/user-attachments/assets/93eef354-ba45-4a57-bed7-85cfee74ff41)


## The SQL Commands that has been used
### 1. DDL (Data Definition Language):

We used DDL commands to create the database tables, such as:
CREATE TABLE: To create the necessary tables for guests, rooms, reservation, Employee, Payments and Services.

```SQL
--Create the Guests table to store guest details
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,               -- Unique identifier for each guest
    first_name VARCHAR(50),                 -- First name of the guest
    last_name VARCHAR(50),                  -- Last name of the guest
    email VARCHAR(100),                     -- Email address of the guest
    phone_number VARCHAR(15)                -- Phone number of the guest
);
```
```SQL
-- Create the Rooms table to store room details
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,                -- Unique identifier for each room
    room_number VARCHAR(10),                -- Room number (e.g., 101, 102)
    room_type VARCHAR(50),                  -- Type of the room (e.g., Single, Double)
    status VARCHAR(20)                      -- Room status (e.g., available, booked, under maintenance)
);
```
```SQL
-- Create the Reservations table to store reservation details
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,         -- Unique identifier for each reservation
    guest_id INT,                           -- Foreign key linking to the Guests table
    room_id INT,                            -- Foreign key linking to the Rooms table
    check_in_date DATE,                     -- Check-in date for the reservation
    check_out_date DATE,                    -- Check-out date for the reservation
    reservation_date DATE,                  -- The date when the reservation was made
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id), -- Foreign key constraint on guest_id
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)    -- Foreign key constraint on room_id
);
```
```SQL
SELECT constraint_name, table_name
FROM user_constraints
WHERE constraint_type='R' AND table_name='PAYMENTS';
ALTER TABLE PAYMENTS
DROP CONSTRAINT SYS_C008228;
DELETE FROM SERVICES;
```
```SQL
-- Create the Employees table to store hotel employee details
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,            -- Unique identifier for each employee
    first_name VARCHAR(50),                 -- First name of the employee
    last_name VARCHAR(50),                  -- Last name of the employee
    position VARCHAR(50),                   -- Position of the employee (e.g., Manager, Housekeeping)
    salary DECIMAL(10, 2)                   -- Salary of the employee
);
```
```SQL
-- Create the Services table to store details about services offered at the hotel
CREATE TABLE Services (
    service_id INT PRIMARY KEY,             -- Unique identifier for each service
    service_name VARCHAR(50),               -- Name of the service (e.g., Spa, Dinner)
    description VARCHAR(255),               -- Description of the service
    price DECIMAL(10, 2)                    -- Price of the service
);
```
```SQL
-- Create the Payments table to store payment details for reservations
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,             -- Unique identifier for each payment
    reservation_id INT,                     -- Foreign key linking to the Reservations table
    payment_date DATE,                      -- Date when the payment was made
    amount DECIMAL(10, 2),                  -- Amount paid for the reservation
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id) -- Foreign key constraint on reservation_id
);
```




### 2. DML (Data Manipulation Language):
We used DML commands to manipulate the data in the tables:

```SQL
INSERT: To add records to the Books, Members, and BorrowedBooks tables.
UPDATE: To modify existing data.
DELETE: To remove data from tables.

-- Insert guest data into the Guests table
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (1, 'Borah', 'Bajiji', 'borah.bajiji@email.com', '123-456-7890');   -- First guest

INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (1, 'Borah', 'Bajiji', 'borah.bajiji@email.com', '123-456-7890');

INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (2, 'Praise', 'Mutijima', 'praise.mutijima@email.com', '123-456-7890');
-- Insert room data into the Rooms table
INSERT INTO Rooms (room_id, room_number, room_type, status) 
VALUES  (1, '101', 'Single', 'available');           -- Room 101, Single, available
INSERT INTO Rooms (room_id, room_number, room_type, status) 
VALUES (2, '102', 'Double', 'booked');              -- Room 102, Double, booked

-- Insert reservation data into the Reservations table
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES (1, 1, 1, TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-02-20', 'YYYY-MM-DD'));--Reservation for guest 1
    
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES (2, 2, 2, TO_DATE('2025-03-03', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD'), TO_DATE('2025-02-21', 'YYYY-MM-DD')); 

INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (1, 'Jesse', 'Kayigire', 'Manager', 3000000);    -- Housekeeping employee

INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (2, 'Jesse', 'Kayigire', 'Manager', 3000000);    -- Manager employee

-- Insert service data into the Services table
INSERT INTO Services (service_id, service_name, description, price) 
VALUES (1, 'Spa', 'Relaxing spa treatment', 100);       -- Spa service

INSERT INTO Services (service_id, service_name, description, price) 
VALUES (2, 'Dinner', 'Five-course dinner for two', 150); -- Dinner service

-- Insert payment data into the Payments table
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (1, 1, TO_DATE('2025-02-25', 'YYYY-MM-DD'), 500);
```

![Insert](https://github.com/user-attachments/assets/f2a31459-fbae-47f7-95a4-8f7145916715)



### 3. TCL (Transaction Control Language):
We used TCL (Transaction Control Language) commands to manage database transactions, ensuring data consistency:

COMMIT: To save the changes made by the transactions.
ROLLBACK: To undo uncommitted changes.

#### COMMIT the queries
```SQL
COMMIT;
```

![commit](https://github.com/user-attachments/assets/423ca2d7-6451-449e-b654-be621c8d1a3b)



#### ROLLBACK

```SQL
ROLLBACK;
```

![rollback](https://github.com/user-attachments/assets/5e8beecb-e21d-48b0-86bf-8c7b5aa454cc)


### 5. Joins:
We used JOIN operations to retrieve related data across multiple tables.

```SQL
SELECT r.reservation_id, g.first_name, g.last_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;
```
```SQL
-- Retrieve payments with reservation and guest details
SELECT p.payment_id, p.payment_date, p.amount, g.first_name, g.last_name
FROM Payments p
JOIN Reservations r ON p.reservation_id = r.reservation_id
JOIN Guests g ON r.guest_id = g.guest_id;
```
```SQL
-- Retrieve employees and their services
SELECT e.employee_id, e.first_name, e.last_name, e.position, s.service_name, s.price
FROM Employees e
LEFT JOIN Services s ON e.position = 'Manager';
-- Find reservations created in the past 7 days
SELECT * FROM Reservations
WHERE reservation_date >= SYSDATE - 7;
```
```SQL
-- Find payments made in the last 7 days
SELECT * FROM Payments
WHERE payment_date >= SYSDATE - 7;
-- Get the top 5 highest-paid employees
SELECT * FROM (
    SELECT e.*, RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employees e
) WHERE rank <= 5;
```
```SQL
-- Get the top 5 most expensive services
SELECT * FROM (
    SELECT s.*, RANK() OVER (ORDER BY price DESC) AS rank
    FROM Services s
) WHERE rank <= 5;
-- Find guests who have made more than 3 reservations
SELECT guest_id, COUNT(*) AS total_reservations
FROM Reservations
GROUP BY guest_id
HAVING COUNT(*) > 3;
```
```SQL
-- Find rooms that have been reserved more than 3 times
SELECT room_id, COUNT(*) AS total_bookings
FROM Reservations
GROUP BY room_id
HAVING COUNT(*) > 3;
-- Find reservations created in the past 7 days
SELECT * FROM Reservations
WHERE reservation_date >= SYSDATE - 7;
```
```SQL
-- Retrieve reservations with guest and room details
SELECT r.reservation_id, g.first_name, g.last_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;
-- Find reservations created in the past 7 days
SELECT * FROM Reservations
WHERE reservation_date >= SYSDATE - 7;
```
```SQL
-- Find payments made in the last 7 days
SELECT * FROM Payments
WHERE payment_date >= SYSDATE - 7;
-- Get the top 5 highest-paid employees
SELECT * FROM (
    SELECT e.*, RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employees e
) WHERE rank <= 5;
```

![join](https://github.com/user-attachments/assets/9ba0149c-c167-4722-9c84-e50f92054428)


### 6. Subqueries:
We used subqueries to retrieve data based on nested queries:
Get all members who have made reservations in the year.

```SQL
select * from Guests;
```

![Gues](https://github.com/user-attachments/assets/e4b286bd-02d0-4fcc-9b6d-fa8d63dcf3d1)

```SQL
select * from Rooms;
```

![ROOMS](https://github.com/user-attachments/assets/5e8d9d3c-1a0a-41d5-b32b-91cf3103d8c5)

```SQL
select * from Reservations;
```

![RESERVATION](https://github.com/user-attachments/assets/387ee184-5085-4fc1-97c6-1024dc0957f5)

```SQL
select * from Employees;
```

![employee](https://github.com/user-attachments/assets/c420d177-56ca-4177-a09b-a6eedc5aaccc)

```SQL
select * from Payment;
```

![payments](https://github.com/user-attachments/assets/da065871-8e7b-41f6-86fd-60adfd51a188)

```SQL
select * from Services;
```

![Services](https://github.com/user-attachments/assets/c81b6b92-eeda-479c-bbfc-2b1895a2763d)

# END!!

