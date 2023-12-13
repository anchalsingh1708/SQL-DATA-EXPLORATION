/*Day 12
1)	Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. 
Format the YoY values in no decimals and show in % sign.
Table: Orders*/
use classicmodels;
     create table orders_ex select year(orderDate) as orderyear,
				  monthname(orderDate) as ordermonth,
                  count(ordernumber) as Total_Orders 
                  from orders
                  group by orderyear,ordermonth;
                  
     with t as (select OrderYear,OrderMonth,Total_Orders ,
                  lag(Total_orders) over(partition by orderyear ) as previous_order
                  from orders_ex
                  )
	 select orderyear,
			ordermonth,
            Total_Orders,ifnull(concat(round(((total_orders-previous_order)/(previous_order))*100,0),"%"),'-') 
              as "YOY%" from t;


/*2)	Create the table emp_udf with below fields.
●	Emp_ID
●	Name
●	DOB
Add the data as shown in below query.
INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");
Create a user defined function calculate_age which returns the age in years and months (e.g. 30 years 5 months) by accepting DOB column as a parameter.
*/
create table emp_udf(Emp_ID integer primary key auto_increment,Name varchar(111),DOB date);
INSERT INTO Emp_UDF(Name, DOB)
					VALUES ("Piyush", "1990-03-30"),
                    ("Aman","1992-08-15"), 
                    ("Meena","1998-07-28"), 
                    ("Ketan","2000-11-21"), 
                    ("Sanjay","1995-05-21");
                    
	select*from emp_udf;
    
    #calculate_age() is a function created in classicmodel
    select *,calculate_age(dob) as Age from emp_udf order by emp_id;
    
    /*
    CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_age`(date_of_birth DATE) RETURNS varchar(50) CHARSET latin1
BEGIN
    DECLARE years_diff INT;
    DECLARE months_diff INT;
    DECLARE age_string VARCHAR(50);

    SET years_diff = FLOOR(DATEDIFF(CURDATE(), date_of_birth) / 365);
    SET months_diff = FLOOR(MOD(DATEDIFF(CURDATE(), date_of_birth), 365) / 30);

    SET age_string = CONCAT(years_diff, ' years ', months_diff, ' months');

    RETURN age_string;
END
    */




