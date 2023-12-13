/*Day 13
1)	Display the customer numbers and customer names from customers 
table who have not placed any orders using subquery
Table: Customers, Orders
*/
use classicmodels;
SELECT c.customernumber, c.customername
FROM customers c
LEFT JOIN orders o USING (customernumber)
WHERE o.customernumber IS NULL;

SELECT customerNumber, customerName
FROM Customers
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders
    WHERE Customers.customerNumber = Orders.customerNumber
);

/*
2)	Write a full outer join between customers and orders using union and
 get the customer number, customer name, count of orders for every customer.
Table: Customers, Orders
*/
select customernumber,customername,count(ordernumber) as Total_Orders
from customers left join orders using(customernumber)
group by customernumber 
union
select customernumber,customername,count(ordernumber) as Total_Orders
from customers right join orders using(customernumber)
group by customernumber;


/*3)	Show the second highest quantity ordered value for each order number.
Table: Orderdetails
*/
with  t as 
         (select ordernumber, quantityOrdered,
         dense_rank() over(partition by ordernumber order by quantityordered desc) as rnk
         from orderdetails)
		select ordernumber, quantityOrdered from t where rnk=2;

/*4)	For each order number count the number of products and then find the min and max of the values among count of orders.
Table: Orderdetails*/

SELECT MAX(CountPerOrder) AS "MAX(Total)",
       MIN(CountPerOrder) AS "Min(Total)"
FROM (
    SELECT ordernumber, COUNT(productcode) AS CountPerOrder
    FROM orderdetails
    GROUP BY ordernumber
) AS count;



/* 5)	Find out how many product lines are there for which the buy price value is greater than the average of buy price value. 
Show the output as product line and its count.*/


SELECT productline,
       COUNT(productline) AS line_count
FROM products
GROUP BY productline
HAVING AVG(buyprice) < MIN(buyprice);








