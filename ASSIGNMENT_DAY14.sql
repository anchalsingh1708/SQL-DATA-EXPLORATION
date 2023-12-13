/*Day 14
Create the table Emp_EH. Below are its fields.
●	EmpID (Primary Key)
●	EmpName
●	EmailAddress
Create a procedure to accept the values for the columns in Emp_EH. Handle the error using exception handling concept.
 Show the message as “Error occurred” in case of anything wrong.*/
 
 create table Emp_EH(EmpID int primary key,EmpName varchar(111),EmailAddress varchar(111));
 
 #Create Procedure Proc_EMP_EH in classicmodels 
 call Proc_Emp_EH(1,"Anchal","anc@gmail.com");
 call Proc_Emp_EH(2,"Anchal","anc@gmail.com");
 call Proc_Emp_EH(1,"Anchal","anc@gmail.com");
 select*from Emp_EH;
 /*
 CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Emp_EH`(id int,name varchar(111),email varchar(111))
BEGIN
declare continue handler for sqlexception
begin
select ("Error Occured") as Message;
end;
insert into Emp_EH values(id,name,email);

END*/