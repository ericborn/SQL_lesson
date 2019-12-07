-- This will drop the table called mock only if it exists
DROP TABLE IF EXISTS mock;

-- creates the table called mock with the columns listed and the types
CREATE TABLE mock (
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
gender VARCHAR(6),
ip_address VARCHAR(15)
);

-- copies fake data from a csv file located on the c:\ drive
COPY mock(first_name,last_name,email,gender,ip_address)
FROM 'c:\MOCK_DATA.csv' DELIMITER ',' CSV HEADER;

-- creates the table called southwest
CREATE TABLE southwest (
first_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50) NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
gender VARCHAR(6) NOT NULL,
dob DATE NOT NULL,
PreferredFirstName VARCHAR(50) NULL
);

-- inserts data for a passenger into the southwest table
-- declares specific columns since data for the null columns
-- are not included
INSERT INTO southwest (first_name,last_name,email,gender,dob)
VALUES
('Kurt','Born','zots@charter.net','Male','1954-07-16')

-- inserts data into southwest with no declared columns since 
-- data for all columns is included
INSERT INTO southwest
VALUES
('tom','','jones','jones@charter.net','Male','1985-07-16','bud')

-- selects all rows and columns from the southwest table
SELECT * FROM southwest

-- updates the southwest table where the users last name is born
-- sets the email address to a new email
UPDATE southwest
SET email = 'brokenemail@email.com'
WHERE last_name = 'born'

-- selects all columns from the mock table but limits the results to 10 rows
SELECT *
FROM mock
LIMIT 10

-- selects the gender and does a count of all rows grouping on gender
SELECT gender, count(*) AS count
FROM mock
GROUP BY gender

-- selects the first and last name columns from the mock database where first name 
-- contains Jul and any characters after that
SELECT first_name, last_name
FROM mock
WHERE first_name LIKE 'Jul%'