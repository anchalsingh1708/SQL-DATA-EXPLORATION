/*Day 7
1)	Show employee number, Sales Person (combination of first and last names of employees), 
unique customers for each employee number and sort the data by highest to lowest unique customers.
Tables: Employees, Customers*/
use classicmodels;
SELECT*from employees;
select*from customers;
select employeenumber,concat(firstname," ",lastname) as `Sales Person`,
							 count(customernumber) as `Total Customer` 
							 from employees inner join customers on employeenumber=salesrepemployeenumber 
                             group by employeenumber 
                             order by `total customer` desc;


/*2)	Show total quantities, total quantities in stock, left over quantities for each product and each customer. Sort the data by customer number.
Tables: Customers, Orders, Orderdetails, Products*/

SELECT C.CustomerNumber, C.CustomerName,P.ProductCode,P.ProductName,
											SUM(OD.QuantityOrdered) AS TotalQuantities,
											P.QuantityInStock AS TotalQuantitiesInStock,
											(P.QuantityInStock - SUM(OD.QuantityOrdered)) AS LeftoverQuantities
											FROM Customers C
											JOIN Orders O ON C.CustomerNumber = O.CustomerNumber
											JOIN OrderDetails OD ON O.OrderNumber = OD.OrderNumber
											JOIN Products P ON OD.ProductCode = P.ProductCode
											GROUP BY C.CustomerNumber, C.CustomerName, P.ProductCode, P.ProductName, P.QuantityInStock
											ORDER BY C.CustomerNumber;

/*3)	Create below tables and fields. (You can add the data as per your wish)

●	Laptop: (Laptop_Name)
●	Colours: (Colour_Name)
Perform cross join between the two tables and find number of rows.*/
											create table Laptop(Laptop_Name varchar(111));
											insert into Laptop values("MSI");
											insert into Laptop values("HP");
											insert into Laptop values("MAC");
											create table Colours(Colour_Name varchar(111));
											insert into Colours values("Black");
											insert into Colours values("Platinum");
											select laptop_name,colour_name  from laptop cross join colours;
										
                                        
/*4)	Create table project with below fields.

●	EmployeeID
●	FullName
●	Gender
●	ManagerID
Add below data into it.
INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);
Find out the names of employees and their related managers.*/

create table project(EmployeeID int,FullName varchar(111),Gender enum("Male","Female"),ManagerId int);
INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);

    select mgr.fullname as Manager_Name ,emp.fullname as Employee_Name
    from project as emp 
    JOIN
    project as mgr
    on mgr.employeeid=emp.managerId;

