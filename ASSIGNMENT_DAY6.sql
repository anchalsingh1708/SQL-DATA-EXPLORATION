/*
Day 6:

1)	Create a journey table with following fields and constraints.

●	Bus_ID (No null values)
●	Bus_Name (No null values)
●	Source_Station (No null values)
●	Destination (No null values)
●	Email (must not contain any duplicates)*/
use classicModels;
create table journey1(Bus_ID int not null,
					 Bus_Name varchar(111) not null,
					 Source_Station varchar(111) not null,
                     Destination Varchar(111),
                     Email varchar(111) unique);


/*2)	Create vendor table with following fields and constraints.

●	Vendor_ID (Should not contain any duplicates and should not be null)
●	Name (No null values)
●	Email (must not contain any duplicates)
●	Country (If no data is available then it should be shown as “N/A”)*/

create table vendor(Vendor_ID int unique not null ,
					Name varchar(111) not null,
                    Email varchar(111) unique,
                    country varchar(111) default "N/A");

/*3)	Create movies table with following fields and constraints.

●	Movie_ID (Should not contain any duplicates and should not be null)
●	Name (No null values)
●	Release_Year (If no data is available then it should be shown as “-”)
●	Cast (No null values)
●	Gender (Either Male/Female)
●	No_of_shows (Must be a positive number)*/
create table Movies(Movies_ID int unique not null,
			 Name varchar(111) not null,
			 Release_Year year default "-",
             Cast varchar(222) not null,
             Gender enum ('Male','Female'),
             No_of_shows int check (No_of_shows>=0)
             
             )



/*4)	Create the following tables. Use auto increment wherever applicable

a. Product
✔	product_id - primary key
✔	product_name - cannot be null and only unique values are allowed
✔	description
✔	supplier_id - foreign key of supplier table*/

create table Product(product_id int primary key,
					 product_name varchar(111),
					 description varchar(222),
                     supplier_id integer,
                     foreign key(supplier_id) references suppliers(supplier_id)
                     on delete cascade
                     on update cascade);
describe product;
/* 
b. Suppliers
✔	supplier_id - primary key
✔	supplier_name
✔	location 
*/

create table suppliers(supplier_id int primary key auto_increment,
					   supplier_name varchar(111),
                       location varchar(111));

/*c. Stock
✔	id - primary key
✔	product_id - foreign key of product table
✔	balance_stock
*/
create table Stock(id integer primary key,
				   product_id int, foreign key(product_id) references product(product_id),
                   balance_stock varchar(111));



