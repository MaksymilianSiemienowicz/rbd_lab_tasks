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



INSERT INTO
data.user(first_name, last_name, email, phone_number)
VALUES
('kak', 'gds', 'csom', '43214'),
('rew', 'asda', 'fom', '312'),
('sdd', 'dasd', 'dsom', '312'),
('dasd', 'xgre', 'dacom', '312'),
('dee', 'erew', 'som', '322');

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

TRUNCATE TABLE data.paymentmethod;
DROP TABLE data.payment;
CREATE TABLE data.payment(
id serial PRIMARY KEY,
cost money,
payment_method_id INT,
CONSTRAINT fk_id_payment_method
    FOREIGN KEY (payment_method_id) REFERENCES paymentmethod(id)
);


TRUNCATE TABLE data.paymentmethod;
DROP TABLE data.payment;
CREATE TABLE data.payment(
id serial PRIMARY KEY,
cost money,
payment_method_id INT,
CONSTRAINT fk_id_payment_method
    FOREIGN KEY (payment_method_id) REFERENCES paymentmethod(id)
);



TRUNCATE TABLE data.adress;
TRUNCATE TABLE data.paymentmethod;
DROP TABLE data.ride;
CREATE TABLE data.ride(
    id serial PRIMARY KEY,
    distance decimal,
    driver_id INT,
    passenger_id INT,
    payment_id INT,
    driver_car_id INT,
    address_pickup_id INT,
    address_destination_id int,
    CONSTRAINT fk_payment_id
        FOREIGN KEY (payment_id) REFERENCES data.paymentmethod(id),
    CONSTRAINT fk_address_pickup
        FOREIGN KEY (address_pickup_id) REFERENCES data.adress(id),
    CONSTRAINT fk_driver_id
        FOREIGN KEY (driver_id) REFERENCES data.driver(id),
    CONSTRAINT fk_passenger_id
        FOREIGN KEY (passenger_id) REFERENCES data.pasenger(id),
    CONSTRAINT fk_diver_car_id
        FOREIGN KEY (driver_car_id) REFERENCES data.drivercar(id),
    CONSTRAINT fk_address_destination
        FOREIGN KEY (address_destination_id) REFERENCES data.adress(id)
);

ALTER TABLE data.adress
  ADD CONSTRAINT id_area
  FOREIGN KEY (area_id) REFERENCES data.area(id);


ALTER TABLE data.pasenger
  ADD CONSTRAINT id_user
  FOREIGN KEY (user_id) REFERENCES data.user(id);



ALTER TABLE data.pasenger
  ADD CONSTRAINT id_payment_type
  FOREIGN KEY (preferowany_typ_platnosci) REFERENCES data.paymentmethod(id);



ALTER TABLE data.pasengerrating
  ADD CONSTRAINT id_passenger
  FOREIGN KEY (pasenger_id) REFERENCES data.pasenger(id);


ALTER TABLE data.pasengerrating
  ADD CONSTRAINT id_ride
  FOREIGN KEY (ride_id) REFERENCES data.ride(id);


ALTER TABLE data.driverrating
  ADD CONSTRAINT id_driver
  FOREIGN KEY (driver_id) REFERENCES data.driver(id);

ALTER TABLE data.driverrating
  ADD CONSTRAINT id_ride
  FOREIGN KEY (ride_id) REFERENCES data.ride(id);

ALTER TABLE data.driver
  ADD CONSTRAINT id_user
  FOREIGN KEY (user_id) REFERENCES data.user(id);

ALTER TABLE data.drivercar
  ADD CONSTRAINT id_car
  FOREIGN KEY (car_id) REFERENCES data.car(id);

ALTER TABLE data.drivercar
  ADD CONSTRAINT id_driver
  FOREIGN KEY (driver_id) REFERENCES data.driver(id);

ALTER TABLE data.car
  ADD CONSTRAINT id_type
  FOREIGN KEY (car_type) REFERENCES data.cartype(id);



insert into data.user (first_name, last_name, email, phone_number) values ('Jilli', 'Annis', 'jannis0@smugmug.com', '164-164-6475');
insert into data.user (first_name, last_name, email, phone_number) values ('Nata', 'Hearns', 'nhearns1@miibeian.gov.cn', '994-333-4069');
insert into data.user (first_name, last_name, email, phone_number) values ('Kathie', 'Fishleigh', 'kfishleigh2@ask.com', '213-902-1455');
insert into data.user (first_name, last_name, email, phone_number) values ('Betty', 'Flower', 'bflower3@narod.ru', '510-393-5221');
insert into data.user (first_name, last_name, email, phone_number) values ('Albert', 'Rickertsen', 'arickertsen4@hugedomains.com', '964-516-0918');
insert into data.user (first_name, last_name, email, phone_number) values ('Terence', 'Lawles', 'tlawles5@dailymotion.com', '431-896-8630');
insert into data.user (first_name, last_name, email, phone_number) values ('Cesaro', 'Mion', 'cmion6@google.pl', '420-282-1649');
insert into data.user (first_name, last_name, email, phone_number) values ('Greta', 'De Ruel', 'gderuel7@fc2.com', '248-410-8845');
insert into data.user (first_name, last_name, email, phone_number) values ('Etienne', 'Brame', 'ebrame8@seesaa.net', '726-955-0813');
insert into data.user (first_name, last_name, email, phone_number) values ('Marketa', 'Hatliff', 'mhatliff9@blog.com', '504-883-4890');
insert into data.user (first_name, last_name, email, phone_number) values ('Winnie', 'Beddin', 'wbeddina@hatena.ne.jp', '670-696-5199');
insert into data.user (first_name, last_name, email, phone_number) values ('Danielle', 'Iacobucci', 'diacobuccib@usatoday.com', '660-385-5007');
insert into data.user (first_name, last_name, email, phone_number) values ('Sherlocke', 'Pollicote', 'spollicotec@scientificamerican.com', '338-184-7185');
insert into data.user (first_name, last_name, email, phone_number) values ('Catarina', 'McGloin', 'cmcgloind@histats.com', '817-214-5658');
insert into data.user (first_name, last_name, email, phone_number) values ('Clementina', 'Bernaert', 'cbernaerte@rambler.ru', '568-692-2556');
insert into data.user (first_name, last_name, email, phone_number) values ('Thedric', 'Sansum', 'tsansumf@zimbio.com', '596-540-1716');
insert into data.user (first_name, last_name, email, phone_number) values ('Mace', 'Soan', 'msoang@netlog.com', '611-137-5598');
insert into data.user (first_name, last_name, email, phone_number) values ('Marilyn', 'Jerzyk', 'mjerzykh@epa.gov', '691-368-1444');
insert into data.user (first_name, last_name, email, phone_number) values ('Stormy', 'Kemwal', 'skemwali@youku.com', '812-702-3059');
insert into data.user (first_name, last_name, email, phone_number) values ('Vivien', 'Pavlenkov', 'vpavlenkovj@live.com', '191-205-8693');
insert into data.user (first_name, last_name, email, phone_number) values ('Adrian', 'Brett', 'abrettk@mediafire.com', '264-666-9596');
insert into data.user (first_name, last_name, email, phone_number) values ('Sybille', 'Alvarez', 'salvarezl@omniture.com', '490-130-6413');
insert into data.user (first_name, last_name, email, phone_number) values ('Burk', 'Pheazey', 'bpheazeym@slate.com', '819-946-0438');
insert into data.user (first_name, last_name, email, phone_number) values ('Ariela', 'Sadry', 'asadryn@xrea.com', '707-129-3630');
insert into data.user (first_name, last_name, email, phone_number) values ('Lek', 'Hayman', 'lhaymano@umn.edu', '433-646-4475');
insert into data.user (first_name, last_name, email, phone_number) values ('Nicolas', 'Alders', 'naldersp@ifeng.com', '827-383-6201');
insert into data.user (first_name, last_name, email, phone_number) values ('Fallon', 'Wastie', 'fwastieq@com.com', '209-876-6810');
insert into data.user (first_name, last_name, email, phone_number) values ('Fax', 'Marcam', 'fmarcamr@qq.com', '241-675-9596');
insert into data.user (first_name, last_name, email, phone_number) values ('Chicky', 'Beauvais', 'cbeauvaiss@1688.com', '911-390-8000');
insert into data.user (first_name, last_name, email, phone_number) values ('Elvira', 'Lomas', 'elomast@state.gov', '123-919-0919');
insert into data.user (first_name, last_name, email, phone_number) values ('Dunn', 'Brambley', 'dbrambleyu@hugedomains.com', '951-372-1790');
insert into data.user (first_name, last_name, email, phone_number) values ('Ad', 'Scholcroft', 'ascholcroftv@unicef.org', '892-737-8969');
insert into data.user (first_name, last_name, email, phone_number) values ('Noam', 'Barday', 'nbardayw@wikimedia.org', '781-548-2850');
insert into data.user (first_name, last_name, email, phone_number) values ('Harri', 'Bottrell', 'hbottrellx@nih.gov', '715-508-2061');
insert into data.user (first_name, last_name, email, phone_number) values ('Neill', 'Spiaggia', 'nspiaggiay@imdb.com', '734-772-7808');
insert into data.user (first_name, last_name, email, phone_number) values ('Claus', 'Feldstein', 'cfeldsteinz@uiuc.edu', '569-927-1134');
insert into data.user (first_name, last_name, email, phone_number) values ('Thelma', 'Mateos', 'tmateos10@de.vu', '640-303-7576');
insert into data.user (first_name, last_name, email, phone_number) values ('Christye', 'Brou', 'cbrou11@wikia.com', '854-946-6722');
insert into data.user (first_name, last_name, email, phone_number) values ('Eba', 'Frear', 'efrear12@printfriendly.com', '544-869-3202');
insert into data.user (first_name, last_name, email, phone_number) values ('Bunni', 'Onians', 'bonians13@baidu.com', '542-326-3529');
insert into data.user (first_name, last_name, email, phone_number) values ('Lucio', 'Verbruggen', 'lverbruggen14@google.ca', '607-691-6499');
insert into data.user (first_name, last_name, email, phone_number) values ('Axel', 'Abrahmer', 'aabrahmer15@state.tx.us', '255-434-3732');
insert into data.user (first_name, last_name, email, phone_number) values ('Maddie', 'Lipscombe', 'mlipscombe16@boston.com', '956-566-6957');
insert into data.user (first_name, last_name, email, phone_number) values ('Channa', 'Deeprose', 'cdeeprose17@dropbox.com', '956-649-1979');
insert into data.user (first_name, last_name, email, phone_number) values ('Chrissie', 'Hollyland', 'chollyland18@smugmug.com', '736-457-9268');
insert into data.user (first_name, last_name, email, phone_number) values ('Mortie', 'Worpole', 'mworpole19@wsj.com', '467-512-7470');
insert into data.user (first_name, last_name, email, phone_number) values ('Emera', 'Fairrie', 'efairrie1a@jalbum.net', '233-947-6835');
insert into data.user (first_name, last_name, email, phone_number) values ('Ciro', 'Shortt', 'cshortt1b@elegantthemes.com', '483-529-1967');
insert into data.user (first_name, last_name, email, phone_number) values ('Cilka', 'Carvill', 'ccarvill1c@discuz.net', '149-427-2131');
insert into data.user (first_name, last_name, email, phone_number) values ('Cello', 'Zywicki', 'czywicki1d@prweb.com', '740-344-5845');












//////////LABY06/////////////
SELECT street_name, building_number,count(city) FROM data.adress
WHERE street_name LIKE '%ll'
group by street_name, building_number
ORDER BY street_name DESC;

SELECT first_name
FROM data.user
WHERE id IN
  (SELECT distance FROM data.ride
    WHERE driver_id = 1);

SELECT first_name, last_name FROM data.user ORDER BY first_name ASC LIMIT 10 OFFSET 30;

SELECT first_name FROM data.user
UNION
SELECT manufcturer FROM data.car;

SELECT first_name FROM data.user
UNION ALL
SELECT manufcturer FROM data.car;

SELECT first_name FROM data.user
EXCEPT
SELECT manufcturer FROM data.car;

SELECT first_name FROM data.user
INTERSECT
SELECT manufcturer FROM data.car;

SELECT * from data.user
INNER JOIN data.ride on "user".id = driver_id;

SELECT * from data.user
LEFT JOIN data.ride on "user".id = driver_id;

SELECT * from data.user
RIGHT JOIN data.ride on "user".id = driver_id;

SELECT * from data.user
FULL OUTER JOIN data.ride on "user".id = driver_id;






























