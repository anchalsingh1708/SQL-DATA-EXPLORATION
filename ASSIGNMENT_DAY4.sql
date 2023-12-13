#ASSIGNMENT DAY4
/*1)	Show the orderNumber, status and comments from orders table for shipped status only. If some comments are having null values then show them as “-“. */
use classicmodels;
SET SQL_SAFE_UPDATES = 0;

SELECT orderNumber, 
       status, 
       ifnull(comments, '-') AS comments
FROM orders
WHERE status = 'shipped';

/*2)	Select employee number, first name, job title and job title abbreviation from employees table based on following conditions.
If job title is one among the below conditions, then job title abbreviation column should show below forms.
●	President then “P”
●	Sales Manager / Sale Manager then “SM”
●	Sales Rep then “SR”
●	Containing VP word then “VP”
*/

select employeenumber,firstname,lastname,jobtitle ,
case
when jobtitle="President" then"P"
when jobtitle like "%Sale Manager%" or jobtitle like "%Sales Manager%" then "SM"
when jobtitle="Sales Rep" then "SR"
when jobtitle like "%VP%" then"VP"
else "-"
end as job_title_Abbrevation
 from employees;





