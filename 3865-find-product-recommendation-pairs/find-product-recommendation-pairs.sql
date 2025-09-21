# Write your MySQL query statement below
with cte as(
select a.product_id as product1_id,
b.product_id as product2_id,
count(a.user_id) as customer_count 
from productpurchases a 
join productpurchases b 
on a.user_id=b.user_id 
where a.product_id<b.product_id 
group by a.product_id,b.product_id 
having customer_count>=3)
select c.product1_id,c.product2_id,
max(case when c.product1_id=d.product_id then d.category end) as product1_category,
max(case when c.product2_id=d.product_id then d.category end) as product2_category,
c.customer_count
from cte c join productinfo d on d.product_id in(c.product1_id,c.product2_id)
group by c.product1_id,c.product2_id,c.customer_count
order by customer_count desc, product1_id,product2_id asc;