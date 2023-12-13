/*Day 10
Create the view products status. Show year wise total products sold. 
Also find the percentage of total value for each year. 
The output should look as shown in below figure.*/
use classicmodels;
Create view `products status` as
select year(orderdate) as YEAR,
    concat(count(productcode) ,
           concat(' (',concat(round((SUM(priceeach) / (SELECT SUM(priceeach) FROM orderdetails)) * 100,0),'%'),')')
    ) AS Value
from orders join orderdetails using(ordernumber)
group by year(orderdate) ;
select*from `products status`;



