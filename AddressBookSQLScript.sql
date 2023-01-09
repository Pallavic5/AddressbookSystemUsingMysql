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

INSERT INTO `addressbookservice`.`addressbook`
(`firstName`,
`lastName`,
`address`,
`city`,
`state`,
`zip`,
`phoneNumber`,
`email`)
VALUES
('Pallavi', 'Chedge','Lakewood','Nagpur','Maharashtra', 346789, 8970065743,'pc@gmail.com'),
 ('Rashmi', 'Agrawal','Iriscourt','Mumbai','Maharashtra', 804198, 9805643789,'rashmi@gmail.com'),
 ('Rahul', 'Punewar','NovaApartment','Chennai','TamilNadu', 678907, 7777856749,'rp@gmail.com'),
 ('Shashwat', 'Patel','DattaApartment','Pune','Maharashtra', 341009, 9880565434,'sp@gmail.com');
 
 /*UC 4 Ability to edit existing contact person using their name.*/
UPDATE `addressbookservice`.`addressbook` SET lastName='Agrawal' where firstname='Shashwat';
SELECT * FROM AddressBook;
UPDATE addressbook SET phoneNumber=7890065432 where firstname='Rahul';

/*UC 5 Ability to delete a person using person's name*/
DELETE FROM `addressbookservice`.`addressbook` WHERE lastName='Chedge';
SELECT * FROM AddressBook;

/*UC 6 Ability to retrieve person belonging to a city or state from the address book*/
select * from AddressBook where city = 'Chennai' or State='TamilNadu';

/*UC 7 Ability to understand the size of address book by city and state - Here size indicates the count*/
select count(firstname) from AddressBook where city = 'Mumbai';
select count(firstname) from AddressBook where city = 'Nagpur';
select count(firstname) from AddressBook where city = 'Pune';
select count(firstname) from AddressBook where state='TamilNadu';

/*UC 8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city */
 insert into AddressBook (firstname, lastname, address,city, state, zip,phoneNumber,email) values
 ('Pallavi','Chedge','Lakewood','Nagpur','Maharashtra',600392,8907675123,'pc@gmail.com'),
 ('Ashwini','Kapse','BajajNagar','Surat','Gujarat',689765,7895644321,'ashwini@gmail.com');
 select * from AddressBook;
 select firstname,city from AddressBook order by city;
 
 /*UC 9 Ability to identify each Address Book with name and
Type. - Here the type could Family, Friends, Profession, etc
- Alter Address Book to add name and type*/
 
 alter table addressbook add addressbookName varchar(25) not null;
 alter table addressbook add contactType varchar(25) not null;
 desc addressbook;
 update AddressBook set addressbookname='one', contactType='Family' where lastname='Punewar';
 update AddressBook set addressbookname='two', contactType='Friends' where lastname='Kapse';
 update AddressBook set addressbookname='two', contactType='Profession' where lastname='Agrawal';
 select * from addressbook;
 select * from addressbook where contactType='Family';
 select * from AddressBook where contacttype='Profession';
 select * from AddressBook where contacttype='Friends';