/*Day 11
1)	Create a stored procedure GetCustomerLevel which takes input as customer number and gives the output as either Platinum, Gold or Silver as per below criteria.
Table: Customers
●	Platinum: creditLimit > 100000
●	Gold: creditLimit is between 25000 to 100000
●	Silver: creditLimit < 25000*/

SELECT*FROM CUSTOMERS;
CALL GETCUSTOMERLEVEL(114);
/* 
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerLevel`(IN customer_Number INT)
BEGIN
    DECLARE credit_Limit DECIMAL(10, 2);

    -- Retrieve the credit limit for the given customer number
    SELECT CreditLimit INTO credit_Limit FROM Customers WHERE CustomerNumber = customer_Number;

    -- Determine the customer level based on the credit limit
    IF credit_Limit > 100000 THEN
        SELECT 'Platinum' AS CustomerLevel;
    ELSEIF credit_Limit BETWEEN 25000 AND 100000 THEN
        SELECT 'Gold' AS CustomerLevel;
    ELSE
        SELECT 'Silver' AS CustomerLevel;
    END IF;
END
*/


/*2)	Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, country wise total amount as an output.
 Format the total amount to nearest thousand unit (K)
Tables: Customers, Payments*/


 #get_country_payments is a stored procedure created in classicmodel
CALL GET_COUNTRY_PAYMENTS(2003,'FRANCE');
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_country_payments`(YEAR_P INT,COUNTRY_C VARCHAR(111))
BEGIN
SELECT year(PAYMENTDATE),COUNTRY,CONCAT(ROUND(sum(AMOUNT)/1000,0),'K')
       FROM CUSTOMERS JOIN PAYMENTS USING(CUSTOMERNUMBER)
       WHERE year(PAYMENTDATE)=YEAR_P AND COUNTRY=COUNTRY_C
       
       GROUP BY YEAR(PAYMENTDATE),COUNTRY;
       
END*/
