/*1)	For every year, find the minimum amount value from payments table.*/
USE CLASSICMODELS;
select YEAR(PAYMENTDATE) AS YEAR,min(AMOUNT) AS MIN_AMOUNT FROM PAYMENTS group by YEAR(PAYMENTDATE)
 order by YEAR(PAYMENTDATE);

/*2)	For every year and every quarter, find the unique customers and total orders from orders table.
 Make sure to show the quarter as Q1,Q2 etc.*/
 
 SELECT 
        year,QUARTER,
        count(distinct customernumber) as Total_Customer,
        count(ordernumber) as Total_Orders
        from(
    select 
    customernumber,
        ordernumber,
        YEAR(orderdate) AS year,
        CONCAT('Q', QUARTER(orderdate)) AS quarter
    FROM
        orders
) AS subquery
        group by year,quarter
        order by year,quarter;
        
 
 
 
 /*
3)	Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month 
(e.g. Jan, Feb etc.) with filter on total amount as 500000 to 1000000. 
Sort the output by total amount in descending mode. [ Refer. Payments Table]*/

select date_format(paymentdate ,'%b')as Month,
concat(format(sum(amount)/1000,0),'K') as Formatted_Amount

from payments 

group by month
having sum(amount) >=500000 and sum(amount)<=1000000
order by sum(amount) desc;







