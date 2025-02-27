
-- Create the Guests table to store guest details
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,               -- Unique identifier for each guest
    first_name VARCHAR(50),                 -- First name of the guest
    last_name VARCHAR(50),                  -- Last name of the guest
    email VARCHAR(100),                     -- Email address of the guest
    phone_number VARCHAR(15)                -- Phone number of the guest
);
-- Create the Rooms table to store room details
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,                -- Unique identifier for each room
    room_number VARCHAR(10),                -- Room number (e.g., 101, 102)
    room_type VARCHAR(50),                  -- Type of the room (e.g., Single, Double)
    status VARCHAR(20)                      -- Room status (e.g., available, booked, under maintenance)
);
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

SELECT constraint_name, table_name
FROM user_constraints
WHERE constraint_type='R' AND table_name='PAYMENTS';
ALTER TABLE PAYMENTS
DROP CONSTRAINT SYS_C008228;
DELETE FROM SERVICES;

-- Create the Employees table to store hotel employee details
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,            -- Unique identifier for each employee
    first_name VARCHAR(50),                 -- First name of the employee
    last_name VARCHAR(50),                  -- Last name of the employee
    position VARCHAR(50),                   -- Position of the employee (e.g., Manager, Housekeeping)
    salary DECIMAL(10, 2)                   -- Salary of the employee
);
-- Create the Services table to store details about services offered at the hotel
CREATE TABLE Services (
    service_id INT PRIMARY KEY,             -- Unique identifier for each service
    service_name VARCHAR(50),               -- Name of the service (e.g., Spa, Dinner)
    description VARCHAR(255),               -- Description of the service
    price DECIMAL(10, 2)                    -- Price of the service
);
-- Create the Payments table to store payment details for reservations
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,             -- Unique identifier for each payment
    reservation_id INT,                     -- Foreign key linking to the Reservations table
    payment_date DATE,                      -- Date when the payment was made
    amount DECIMAL(10, 2),                  -- Amount paid for the reservation
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id) -- Foreign key constraint on reservation_id
);
DELETE FROM Guetsts;


COMMIT;

ROLLBACK;


-- Insert guest data into the Guests table
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES 
(1, 'Anitha', 'Uwase', 'anitha.uwase@email.com', '123-456-7890');   -- First guest
MERGE INTO Guests g
USING (SELECT 1 AS guest_id, 'Anitha' AS first_name, 'Uwase' AS last_name, 
              'anitha.uwase@email.com' AS email, '123-456-7890' AS phone_number FROM dual) new_data
ON (g.guest_id = new_data.guest_id)
WHEN MATCHED THEN
    UPDATE SET g.first_name = new_data.first_name, 
               g.last_name = new_data.last_name, 
               g.email = new_data.email, 
               g.phone_number = new_data.phone_number
WHEN NOT MATCHED THEN
    INSERT (guest_id, first_name, last_name, email, phone_number)
    VALUES (new_data.guest_id, new_data.first_name, new_data.last_name, new_data.email, new_data.phone_number);
    MERGE INTO Guests g
USING (SELECT 1 AS guest_id, 'Borah' AS first_name, 'Bajiji' AS last_name, 
              'borah.bajiji@email.com' AS email, '123-456-7890' AS phone_number FROM dual) new_data
ON (g.guest_id = new_data.guest_id)
WHEN MATCHED THEN
    UPDATE SET g.first_name = new_data.first_name, 
               g.last_name = new_data.last_name, 
               g.email = new_data.email, 
               g.phone_number = new_data.phone_number
WHEN NOT MATCHED THEN
    INSERT (guest_id, first_name, last_name, email, phone_number)
    VALUES (new_data.guest_id, new_data.first_name, new_data.last_name, new_data.email, new_data.phone_number);
UPDATE Employees
SET POSITION='CEO'
WHERE EMPLOYEE_ID= 2;
UPDATE Employees
SET first_name = 'Edisthon', last_name = 'Nshuti'
WHERE employee_id = 1;

UPDATE Employees
SET POSITION='Manager'
SET first_name = 'Jesse', last_name = 'Kayigire'
WHERE employee_id = 3;
UPDATE Employees
SET position = 'Manager',
    first_name = 'Jesse',
    last_name = 'Kayigire'
WHERE employee_id = 3;
-- Insert guest data into the Guests table
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES 
(1, 'Anitha', 'Uwase', 'anitha.uwase@email.com', '123-456-7890');   -- First guest
MERGE INTO Guests g
USING (SELECT 1 AS guest_id, 'Anitha' AS first_name, 'Uwase' AS last_name, 
              'anitha.uwase@email.com' AS email, '123-456-7890' AS phone_number FROM dual) new_data
ON (g.guest_id = new_data.guest_id)
WHEN MATCHED THEN
    UPDATE SET g.first_name = new_data.first_name, 
               g.last_name = new_data.last_name, 
               g.email = new_data.email, 
               g.phone_number = new_data.phone_number
WHEN NOT MATCHED THEN
    INSERT (guest_id, first_name, last_name, email, phone_number)
    VALUES (new_data.guest_id, new_data.first_name, new_data.last_name, new_data.email, new_data.phone_number);
    
DELETE FROM Guests;
ALTER TABLE RESERVATIONS
DROP CONSTRAINT

-- Insert guest data into the Guests table
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES 
(1, 'Borah', 'Bajiji', 'borah.bajiji@email.com', '123-456-7890');   -- First guest

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
VALUES 
    (1, 1, 1, TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-02-20', 'YYYY-MM-DD')); -- Reservation for guest 1
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES 
    (2, 2, 2, TO_DATE('2025-03-03', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD'), TO_DATE('2025-02-21', 'YYYY-MM-DD')); 
    INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (1, 'Jesse', 'Kayigire', 'Manager', 3000000);    -- Housekeeping employee
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (2, 'Jesse', 'Kayigire', 'Manager', 3000000);    -- Manager employee
-- Insert service data into the Services table
INSERT INTO Services (service_id, service_name, description, price) 
VALUES 
    (1, 'Spa', 'Relaxing spa treatment', 100);       -- Spa service
    INSERT INTO Services (service_id, service_name, description, price) 
VALUES (2, 'Dinner', 'Five-course dinner for two', 150); -- Dinner service
-- Insert payment data into the Payments table
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES 
    (1, 1, TO_DATE('2025-02-25', 'YYYY-MM-DD'), 500);  -- Payment for reservation 1
    -- Update the status of Room 101 to 'under maintenance'
UPDATE Rooms 
SET status = 'under maintenance' 
WHERE room_id = 1;  -- Room 1 is being updated to maintenance status
-- Update the salary of employee with employee_id 1 (Manager)
UPDATE Employees 
SET salary = 55000 
WHERE employee_id = 1;  -- Updating the salary of employee with ID 1
-- Delete employee with reservation_id 1
DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID=1;-- Deleting reservation 1
-- Retrieve reservations with guest and room details
SELECT r.reservation_id, g.first_name, g.last_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;

-- Retrieve payments with reservation and guest details
SELECT p.payment_id, p.payment_date, p.amount, g.first_name, g.last_name
FROM Payments p
JOIN Reservations r ON p.reservation_id = r.reservation_id
JOIN Guests g ON r.guest_id = g.guest_id;
-- Retrieve employees and their services
SELECT e.employee_id, e.first_name, e.last_name, e.position, s.service_name, s.price
FROM Employees e
LEFT JOIN Services s ON e.position = 'Manager';
-- Find reservations created in the past 7 days
SELECT * FROM Reservations
WHERE reservation_date >= SYSDATE - 7;

-- Find payments made in the last 7 days
SELECT * FROM Payments
WHERE payment_date >= SYSDATE - 7;
-- Get the top 5 highest-paid employees
SELECT * FROM (
    SELECT e.*, RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employees e
) WHERE rank <= 5;

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

-- Find rooms that have been reserved more than 3 times
SELECT room_id, COUNT(*) AS total_bookings
FROM Reservations
GROUP BY room_id
HAVING COUNT(*) > 3;
-- Find reservations created in the past 7 days
SELECT * FROM Reservations
WHERE reservation_date >= SYSDATE - 7;
-- Retrieve reservations with guest and room details
SELECT r.reservation_id, g.first_name, g.last_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;
-- Find reservations created in the past 7 days
SELECT * FROM Reservations
WHERE reservation_date >= SYSDATE - 7;
-- Find payments made in the last 7 days
SELECT * FROM Payments
WHERE payment_date >= SYSDATE - 7;
-- Get the top 5 highest-paid employees
SELECT * FROM (
    SELECT e.*, RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employees e
) WHERE rank <= 5;
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (3, 'Racia', 'Akaliza', 'racia.akaliza@email.com', '234-567-8901');
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (4, 'Mary', 'Kamaliza', 'mary.kamaliza@email.com', '345-678-9012');
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (4, 'James', 'Kanamugire', 'james.kanamugire@email.com', '456-789-0123');
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (5, 'James', 'Kanamugire', 'james.kanamugire@email.com', '456-789-0123');
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (6, 'Patricia', 'Mutesi', 'patricia.mutesi@email.com', '567-890-1234');
INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) 
VALUES (7, 'Robert', 'Muhima', 'robert.muhima@email.com', '678-901-2345');
INSERT INTO Rooms (room_id, room_number, room_type, status) 
VALUES (3, '103', 'Single', 'available');
INSERT INTO Rooms (room_id, room_number, room_type, status) 
VALUES (4, '104', 'Double', 'booked');
INSERT INTO Rooms (room_id, room_number, room_type, status) 
VALUES (5, '105', 'Suite', 'under maintenance');
INSERT INTO Rooms (room_id, room_number, room_type, status) 
VALUES (6, '106', 'Single', 'available');
INSERT INTO Rooms (room_id, room_number, room_type, status) 
VALUES (7, '107', 'Double', 'booked');
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES (8, 3, 3, TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-05', 'YYYY-MM-DD'), TO_DATE('2024-10-20', 'YYYY-MM-DD'));
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES (9, 4, 4, TO_DATE('2024-11-10', 'YYYY-MM-DD'), TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_DATE('2024-10-22', 'YYYY-MM-DD'));
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES (10, 5, 5, TO_DATE('2024-11-12', 'YYYY-MM-DD'), TO_DATE('2024-11-16', 'YYYY-MM-DD'), TO_DATE('2024-10-25', 'YYYY-MM-DD'));
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES (11, 6, 6, TO_DATE('2024-11-14', 'YYYY-MM-DD'), TO_DATE('2024-11-18', 'YYYY-MM-DD'), TO_DATE('2024-10-28', 'YYYY-MM-DD'));
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (3, 'Sophie', 'Akeza', 'Receptionist', 40000);
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (4, 'Michael', 'Muhirwa', 'Chef', 50000);
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (5, 'Linda', 'Uwera', 'Housekeeping', 30000);
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (7, 'Emma', 'Ishimwe', 'Security', 35000);
INSERT INTO Services (service_id, service_name, description, price) 
VALUES (3, 'Gym', '24/7 access to gym facilities', 50);
INSERT INTO Services (service_id, service_name, description, price) 
VALUES (4, 'Room Service', 'Food and beverage service to your room', 30);
INSERT INTO Services (service_id, service_name, description, price) 
VALUES (5, 'Laundry', 'Laundry services for guests', 20);
INSERT INTO Services (service_id, service_name, description, price) 
VALUES (6, 'Airport Shuttle', 'Shuttle service to/from the airport', 100);
INSERT INTO Services (service_id, service_name, description, price) 
VALUES (7, 'Tour Guide', 'Guided tours around the city', 150);
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (3, 'Sophie', 'Kamikazi', 'Receptionist', 40000);
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (7, 'Sophie', 'Kamikazi', 'Receptionist', 40000);
INSERT INTO Employees (employee_id, first_name, last_name, position, salary) 
VALUES (8, 'Sophie', 'Kamikazi', 'Receptionist', 40000);
INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, reservation_date) 
VALUES (7, 7, 7, TO_DATE('2025-03-13', 'YYYY-MM-DD'), TO_DATE('2025-03-17', 'YYYY-MM-DD'), TO_DATE('2025-02-27', 'YYYY-MM-DD'));
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (3, 3, TO_DATE('2025-02-25', 'YYYY-MM-DD'), 300);
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (4, 4, TO_DATE('2025-02-26', 'YYYY-MM-DD'), 400);
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (5, 5, TO_DATE('2025-02-27', 'YYYY-MM-DD'), 500);
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (6, 6, TO_DATE('2025-02-28', 'YYYY-MM-DD'), 600);
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (7, 7, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 700);
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (3, 8, TO_DATE('2024-11-03', 'YYYY-MM-DD'), 200);
INSERT INTO Payments (payment_id, reservation_id, payment_date, amount) 
VALUES (8, 8, TO_DATE('2024-11-03', 'YYYY-MM-DD'), 200);



-- Retrieve reservations with guest and room details
SELECT r.reservation_id, g.first_name, g.last_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;
-- Retrieve payments with reservation and guest details
SELECT p.payment_id, p.payment_date, p.amount, g.first_name, g.last_name
FROM Payments p
JOIN Reservations r ON p.reservation_id = r.reservation_id
JOIN Guests g ON r.guest_id = g.guest_id;
-- Retrieve employees and their services
SELECT e.employee_id, e.first_name, e.last_name, e.position, s.service_name, s.price
FROM Employees e
LEFT JOIN Services s ON e.position = 'Manager';
-- Find reservations created in the past 7 days
SELECT * FROM Reservations
WHERE reservation_date >= SYSDATE - 7;
-- Find payments made in the last 7 days
SELECT * FROM Payments
WHERE payment_date >= SYSDATE - 7;
-- Get the top 5 highest-paid employees
SELECT * FROM (
    SELECT e.*, RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employees e
) WHERE rank <= 5;
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
-- Find guests who have made more than 3 reservations
SELECT guest_id, COUNT(*) AS total_reservations
FROM Reservations
GROUP BY guest_id
HAVING COUNT(*) > 3;
-- Find rooms that have been reserved more than 3 times
SELECT room_id, COUNT(*) AS total_bookings
FROM Reservations
GROUP BY room_id
HAVING COUNT(*) > 3;
-- Find guests who have made more than 3 reservations
SELECT guest_id, COUNT(*) AS total_reservations
FROM Reservations
GROUP BY guest_id
HAVING COUNT(*) > 3;
SELECT r.reservation_id, g.first_name, g.last_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;

SELECT r.reservation_id, g.first_name, g.last_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;

ALTER TABLE payments
ADD CONSTRAINT fk_reservation
FOREIGN KEY (reservation_id)
REFERENCES reservations(reservation_id);

Update employees
set last_name='Mugonga'
where employee_id=6;

delete from employees
where first_name = 'Michael';

select * from Guests;
select * from Rooms;
select * from Reservations;
select * from Employees;
select * from Payments;
select * from Services;




