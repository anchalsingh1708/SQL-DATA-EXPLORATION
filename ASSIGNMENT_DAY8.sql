/*Day 8
Create table facility. Add the below fields into it.
●	Facility_ID
●	Name
●	State
●	Country
i) Alter the table by adding the primary key and auto increment to Facility_ID column.
ii) Add a new column city after name with data type as varchar which should not accept any null values*/

create table facility(Facility_ID int,Name varchar(111),State varchar(111),Country varchar(111));
alter table facility modify column Facility_ID int primary key auto_increment;
alter table facility add column city varchar(111) not null after name;
desc facility;