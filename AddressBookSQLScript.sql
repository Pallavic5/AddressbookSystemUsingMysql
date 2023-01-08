
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