select *from customers limit 12;
#ASSIGNMENT DAY 3
select customernumber,customername,state,creditlimit from customers where state is not NULL and creditlimit between 50000 and 100000 order by creditlimit desc limit 12;

SELECT DISTINCT PRODUCTLINE FROM PRODUCTS WHERE right(PRODUCTLINE,4)="CARS";