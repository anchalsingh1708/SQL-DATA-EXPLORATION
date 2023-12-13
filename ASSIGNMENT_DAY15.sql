/*Day 15
Create the table Emp_BIT. Add below fields in it.
●	Name
●	Occupation
●	Working_date
●	Working_hours
Insert the data as shown in below query.
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  
Create before insert trigger to make sure any new value of Working_hours, if it is negative, then it should be inserted as positive.*/

CREATE TABLE EMP_BIT(NAME VARCHAR(111),OCCUPATION VARCHAR(111),WORKINGDATE DATE,WORKINGHOURS INT);
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11); 

INSERT INTO Emp_BIT VALUES('ANCHAL', 'Scientist', '2020-10-04',-20);
SELECT*FROM EMP_BIT;

/*
CREATE DEFINER=`root`@`localhost` TRIGGER `BEFOR_EMP_BIT` BEFORE INSERT ON `emp_bit` FOR EACH ROW BEGIN
IF NEW.WORKINGHOURS<0
THEN
SET NEW.WORKINGHOURS = -NEW.WORKINGHOURS;
END IF;
END
*/
