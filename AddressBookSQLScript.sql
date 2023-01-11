/*UC 1 Ability to create a AddressBook Service Database - Use SQL client to create Database and Database records*/

CREATE DATABASE `addressbookservice`;  /*create database*/
USE addressbookservice;				  /*To use addressbookservice database*/
SELECT database(); 					 /*To see current database*/

/*UC 2 Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes*/

CREATE TABLE `addressbook` (
  `firstName` varchar(50) NOT NULL,			/*The NOT NULL constraint enforces a column to NOT accept NULL values.*/
  `lastName` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` int NOT NULL,
  `phoneNumber` double NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*UC 3 Ability to insert new Contacts to Address Book*/

INSERT INTO AddressBook (firstname, lastname, address,city, state, zip,phoneNumber,email) VALUES
 ('Pallavi', 'Chedge','Lakewood','Nagpur','Maharashtra', 346789, 8970065743,'pc@gmail.com'),
 ('Rashmi', 'Agrawal','Iriscourt','Mumbai','Maharashtra', 804198, 9805643789,'rashmi@gmail.com'),
 ('Rahul', 'Punewar','NovaApartment','Chennai','TamilNadu', 678907, 7777856749,'rp@gmail.com'),
 ('Shashwat', 'Patel','DattaApartment','Pune','Maharashtra', 341009, 9880565434,'sp@gmail.com');
 
 /*UC 4 Ability to edit existing contact person using their name.*/
UPDATE `addressbookservice`.`addressbook` SET lastName='Agrawal' WHERE firstname='Shashwat';
SELECT * FROM AddressBook;
UPDATE addressbook SET phoneNumber=7890065432 WHERE firstname='Rahul';

/*UC 5 Ability to delete a person using person's name*/
DELETE FROM `addressbookservice`.`addressbook` WHERE lastName='Chedge';
SELECT * FROM AddressBook;

/*UC 6 Ability to retrieve person belonging to a city or state from the address book*/
SELECT * FROM AddressBook WHERE city = 'Chennai' OR State='TamilNadu';

/*UC 7 Ability to understand the size of address book by city and state - Here size indicates the count*/
SELECT count(firstname) FROM AddressBook WHERE city = 'Mumbai';
SELECT count(firstname) FROM AddressBook WHERE city = 'Nagpur';
SELECT count(firstname) FROM AddressBook WHERE city = 'Pune';
SELECT count(firstname) FROM AddressBook WHERE state='TamilNadu';

/*UC 8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city */
 INSERT INTO AddressBook (firstname, lastname, address,city, state, zip,phoneNumber,email) values
 ('Pallavi','Chedge','Lakewood','Nagpur','Maharashtra',600392,8907675123,'pc@gmail.com'),
 ('Ashwini','Kapse','BajajNagar','Surat','Gujarat',689765,7895644321,'ashwini@gmail.com');
 SELECT * FROM AddressBook;
 SELECT firstname,city FROM	AddressBook ORDER BY city;
 
 /*UC 9 Ability to identify each Address Book with name and
Type. - Here the type could Family, Friends, Profession, etc
- Alter Address Book to add name and type*/
 
 ALTER TABLE addressbook ADD addressbookName varchar(25) NOT NULL;
 ALTER TABLE addressbook ADD contactType varchar(25) NOT NULL;
 DESC addressbook;
 UPDATE AddressBook SET addressbookname='one', contactType='Family' WHERE lastname='Punewar';
 UPDATE AddressBook SET addressbookname='two', contactType='Friends' WHERE lastname='Kapse';
 UPDATE  AddressBook SET addressbookname='two', contactType='Profession' WHERE lastname='Agrawal';
 SELECT * FROM addressbook;
 SELECT * FROM addressbook WHERE contactType='Family';
 SELECT * FROM AddressBook WHERE contacttype='Profession';
 SELECT * FROM AddressBook WHERE contacttype='Friends';
 
 /*UC 10 Ability to get number of contact persons i.e. count by type*/
SELECT count(firstname) FROM AddressBook WHERE contactType='Profession';

/*UC-11 Ability to add person to both Friend and Family*/
INSERT INTO addressbook (firstName, lastName, address, city, state, zip, phoneNumber, email, addressbookName, contactType)
VALUES ('Smarani','Sharma','LaxmiNagar','Mumbai','Maharashtra',603400,8876790543,'smarani@gmail.com','three','Family and Friend');
SELECT * FROM addressbook;

/*UC-12 Draw the ER Diagram for AddressBook Service DB*/
 Create table city(cid int not null auto_increment, city varchar(50) not null, primary key(cid));
 insert into city(city)values('Mumbai'),('Pune'),('Nagpur'),('Chennai'),('Hyderabad'),('Ahmedabad');
 select * from city;
 create table personcontact(id int not null, firstName varchar(50) not null, lastName varchar(50) not null, city int not null, primary key(id),
    foreign key (city) References city(cid));
    insert into personcontact(id, firstName, lastName, city) values(1, "Radha", "Rathore", 2),
     (2, "Shruti", "Patel", 3),
     (3, "Vrushabh", "Rai", 1),
     (4, "Shilpa", "Sharma", 2);
     
     CREATE TABLE PersonContactType ( ContactTypeID int NOT NULL,
     firstName varchar(50) not null,
	 lastName varchar(50) not null,
     contactType varchar(50) not null,
     ID int,
     PRIMARY KEY (ContactTypeID),
     FOREIGN KEY (ID) REFERENCES addressbook(ID));
     
     INSERT INTO personcontacttype (`ContactTypeID`, `firstName`, `lastName`, `contactType`, `ID`)
     VALUES ('1', 'Vidya', 'Pawar', 'Family', '2'), ('2', 'Shikha', 'Patel', 'Friend', '3'), ('3', 'Shashwat', 'Chedge', 'Family', '1'),('4', 'Mayuri', 'Dhande', 'Profession', '4');
     
     /*UC 13 Ability to retrieve person belonging to a city or state from the addressbook*/ 
     select count(firstname) from AddressBook where city = 'Mumbai' and contactType='Profession';
     select firstname,city from AddressBook order by city;
     select count(firstname) from AddressBook where state='TamilNadu';
