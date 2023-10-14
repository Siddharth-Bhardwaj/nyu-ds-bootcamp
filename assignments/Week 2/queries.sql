-- Pull total number of orders that were completed on 18th March 2023
SELECT count (distinct order_id) from sales where date = "03-18-2023";

-- Pull total number of orders that were completed on 18th March 2023 with the first name ‘John’ and last name ‘Doe’
SELECT count (distinct s.order_id) 
from sales as s inner join customers as c on s.customer_id = c.customer_id 
where s.date = "03-18-2023" c.first_name = "John" and c.last_name = "Doe";

-- Pull total number of customers that purchased in January 2023 and the average amount spend per customer
select count(distinct s.customer_id) as total_customers from sales as s where s.date between "01-01-2023" and "01-31-2023";

select c.customer_id, sum(s.revenue) / count(distinct s.order_id) 
from customers c inner join sales s on c.customer_id = s.customer_id
where s.date between "01-01-2023" and "01-31-2023"
group by c.customer_id;

-- Pull the departments that generated less than $600 in 2022
select i.department, sum(s.revenue) as rev
from sales s inner join items i on s.item_id = i.item_id
where s.date between "01-01-2022" and "12-31-2022"
group by i.department
having rev < 600;

-- What is the most and least revenue we have generated by an order
select min(revenue), max(revenue) from sales;

-- What were the orders that were purchased in our most lucrative order
select * 
from sales s
where s.revenue = (select max(revenue) from sales);
