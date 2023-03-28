CREATE DATABASE taxidb;
CREATE SCHEMA data;

CREATE TABLE data.user(
id serial PRIMARY KEY,
first_name varchar(255),
last_name varchar(10),
email varchar(10),
phone_number varchar(25)
);

CREATE TABLE data.pasenger(
id serial PRIMARY KEY,
user_id int NOT NULL,
preferowany_typ_platnosci int
);

CREATE TABLE data.pasengerRating(
id serial PRIMARY KEY,
behaviour int NOT NULL,
punctuality int NOT NULL,
pasenger_id int NOT NULL,
ride_id int UNIQUE NOT NULL
);

CREATE TABLE data.driverRating(
id serial PRIMARY KEY,
skills int NOT NULL,
car_condition int NOT NULL,
compliance_with_regulations int NOT NULL,
driver_id int NOT NULL,
ride_id int UNIQUE NOT NULL
);

CREATE TABLE data.driver(
id serial PRIMARY KEY,
photo bytea[],
user_id int UNIQUE NOT NULL
);

CREATE TABLE data.driverCar(
id serial PRIMARY KEY,
registration_number varchar(25),
color varchar(25),
car_id int NOT NULL,
driver_id int NOT NULL
);

CREATE TABLE data.car(
id serial PRIMARY KEY,
manufcturer varchar(100),
model varchar(100),
car_type int NOT NULL
);

CREATE TABLE data.carType(
id serial PRIMARY KEY,
name varchar(50) NOT NULL
);

CREATE TABLE data.ride(
id serial PRIMARY KEY,
distance decimal NOT NULL,
dirver_id int NOT NULL ,
passener_id int NOT NULL,
payment_id int NOT NULL,
driver_car_id int NOT NULL,
address_pickup_id int NOT NULL,
address_destination_id int NOT NULL
);

CREATE TABLE data.paymentMethod(
id serial PRIMARY KEY,
payment_name varchar(50) NOT NULL
);

CREATE TABLE data.payment(
id serial PRIMARY KEY,
cost money NOT NULL,
payment_method_id int NOT NULL
);

CREATE TABLE data.adress (
  id serial PRIMARY KEY,
  street_name varchar(255),
  building_number varchar(10),
  flat_number varchar(10),
  city varchar(25),
  zip_code varchar(25),
  country varchar(25),
  area_id int NOT NULL
);

CREATE TABLE data.area (
  id serial PRIMARY KEY,
  area_name varchar(255) NOT NULL
);

INSERT INTO 
data.area(area_name)
VALUES
('Śródmieście'),
('Chełm'),
('Ujeścisko'),
('Wrzeszcz');

INSERT INTO
data.adress(street_name, building_number, flat_number, zip_code, city, country)
VALUES
 ('Grunwaldzka', '2a', '3', 'Gdansk', '80-000', 'Poland'),
  ('Norwida', '19', '1c', 'Gdynia', '81-000', 'Poland'),
  ('Koszykowa', '86', null, 'Warszawa', '02-008', 'Warszawa'),
  ('Bursztynowa', '3', '3', 'Mława','1-111','Polska'),
  ('Czstochowska', '5', '5', 'Gdansk', '80-180', 'Polska');


INSERT INTO
data.payment(cost)
VALUES
('50$'),
('30$'),
('10$'),
('5$'),
('100$');

INSERT INTO
data.paymentMethod(payment_name)
VALUES
('blik'),
('cash'),
('card');

INSERT INTO 
data.ride(distance)
VALUES
('50'),
('10'),
('30'),
('12'),
('1000');

INSERT INTO
data.car(manufcturer, model)
VALUES
('Toyota', 'Corolla'),
('Seat', 'Leon'),
('Saab', '93'),
('Ford', 'Fiesta'),
('Citroen', 'C4');

INSERT INTO
data.carType(car_type)
VALUES
('Suv'),
('Sedan'),
('Cabrio'),
('Pick-Up'),
('Van');

INSERT INTO
data.driverCar(registration_number, color)
VALUES
('AAAA AA', 'black'),
('Bb BBBB', 'green'),
('zz ZZZ', 'yellow'),
('AW 3FR4', 'white'),
('AAA AAAAAA', 'red');

INSERT INTO
data.driver(photo)
VALUES
('\\000');

INSERT INTO
data.driverRating(skills, car_condition, compliance_with_regulations)
VALUES
('5', '5', '5'),
('2', '2', '2'),
('1', '2', '4'),
('1', '1', '1'),
('3', '6', '8');

INSERT INTO
data.pasengerRating(behaviour, punctuality)
VALUES
('1', '4'),
('1', '6'),
('8', '8'),
('3', '3'),
('5', '5');

INSERT INTO
data.user(first_name, last_name, email, phone_number)
VALUES
('kak', 'gds', 'csdc@gmaill.com', '43214'),
('rew', 'asda', 'fdsfsd@gmail,com', '321312'),
('sdd', 'dsdasd', 'dsdas@gmail.com', '32312'),
('dasd', 'xgre', 'dasdas@gmail.com', '321312'),
('dease', 'erewrew', 'sddas@gmail.com', '321312');

SELECT * FROM data.user;
SELECT * FROM data.carType;
SELECT * FROM data.pasenger;
SELECT * FROM data.pasengerRating;
SELECT * FROM data.driverRating;
SELECT * FROM data.driver;
SELECT * FROM data.driverCar;
SELECT * FROM data.car;
SELECT * FROM data.ride;
SELECT * FROM data.paymentMethod;
SELECT * FROM data.payment;
SELECT * FROM data.adress;
SELECT * FROM data.user;
SELECT * FROM data.area;













