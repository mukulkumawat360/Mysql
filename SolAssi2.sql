-- Task 1:- Understanding the Data
-- 1. Describe the data in hand in your own words. 
-- solution 1 
-- THe  following Dataset is a sales dataset Which Contains information of customers  with there professsion who bought
-- a product of a certain category . This also contain the profit,sales , discount and Quantiy detais with order date and 
-- the priority prefered by the consumers 


 
-- 2. Identify and list the Primary Keys and Foreign Keys for this dataset provided to 
-- you(In case you don’t find either primary or foreign key, then specially mention 
-- this in your answer)
-- Solution 2
-- cust_dimen[ foreign key='cust_id', primary key=None ]
-- market_fact[foreign key='prod_id','Cust_id','Ship_id','Ord_id',primary key="None"]
-- shipping dimen[primary key='Order_ID',foreign key='Ship_id']
-- prod_dimen [foreign key='prod_id',primary key="None"]
-- orders_dimen [foreign key='None',primary key="ord_id"]


--                                        Task 2:- Basic & Advanced Analysis

Use superstores;
-- 1. Write a query to display the Customer_Name and Customer Segment using alias 
-- name “Customer Name", "Customer Segment" from table Cust_dimen.
select Customer_Name as 'Customer Name' , Customer_Segment as 'Customer Segment' from  superstores.cust_dimen;

-- 2. Write a query to find all the details of the customer from the table cust_dimen 
-- order by desc

select * from superstores.cust_dimen order by Customer_Name DESC;

-- 3 Write a query to get the Order ID, Order date from table orders_dimen where 
-- ‘Order Priority’ is high
select Order_ID,Order_Date from superstores.orders_dimen where Order_Priority ='high';

-- 4 Find the total and the average sales (display total_sales and avg_sales)
select sum(Sales) as total_sales, avg(Sales) as avg_sales from superstores.market_fact;

-- 5  Write a query to get the maximum and minimum sales from maket_fact table.
select max(Sales) as 'Maximum sales ', min(Sales) as "minimum Sales " from market_fact;

-- 6 Display the number of customers in each region in decreasing order of 
-- no_of_customers. The result should contain columns Region, no_of_customers
select Region,  count(Customer_Name)  as no_of_customers from cust_dimen Group by Region  order by no_of_customers Desc ;

-- 7 Find the region having maximum customers (display the region name and 
-- max(no_of_customers)
select Region,  count(Customer_Name) as no_of_customers from cust_dimen Group by Region order by no_of_customers DESC  limit 1 ;

-- 8. Find all the customers from Atlantic region who have ever purchased ‘TABLES’ 
-- and the number of tables purchased (display the customer name, no_of_tables 
-- purchased) 

select cust_dimen.Customer_Name from  cust_dimen where Cust_id in (select market_fact.Cust_id from market_fact left join  prod_dimen on market_fact.Prod_id=prod_dimen.Prod_id where prod_dimen.Product_Sub_Category='TABLES') ;



-- 9  Find all the customers from Ontario province who own Small Business. (display 
-- the customer name, no of small business owners)
select Customer_Name from cust_dimen  where Province='ONTARIO'  AND Customer_Segment="SMALL BUSINESS" order by customer_Name  ;

-- 10. Find the number and id of products sold in decreasing order of products sold 
-- (display product id, no_of_products sold) 
select Prod_id , sum(Order_Quantity) from market_fact;

-- 11. Display product Id and product sub category whose produt category belongs to 
-- Furniture and Technlogy. The result should contain columns product id, product 
-- sub  category
select Prod_id ,Product_Sub_Category from prod_dimen where Product_Category ='Furniture' OR Product_Category ='Technlogy';

-- 12. Display the product categories in descending order of profits (display the product 
-- category wise profits i.e. product_category, profits)?

select prod_dimen.Product_Category,sum(market_fact.Profit  ) as Profit from prod_dimen inner join market_fact on market_fact.Prod_id = prod_dimen.Prod_id group by prod_dimen.Product_Category order by Profit DESC;

-- 13. Display the product category, product sub-category and the profit within each 
-- subcategory in three columns
Select distinct prod_dimen.Product_Category , prod_dimen.Product_Sub_Category,sum(market_fact.Profit)   as Profit from prod_dimen inner join market_fact on market_fact.Prod_id = prod_dimen.Prod_id group by prod_dimen.Product_Category , prod_dimen.Product_Sub_Category order by prod_dimen.Product_Category ;

-- 14 Display the order date, order quantity and the sales for the order
select orders_dimen.Order_Date,market_fact.Order_Quantity, market_fact.Sales from orders_dimen inner join market_fact on orders_dimen.Ord_id=market_fact.Ord_id ;

-- 15 Display the names of the customers whose name contains the 
--  i) Second letter as ‘R’
 -- ii) Fourth letter as ‘D’
 
 select Customer_Name from cust_dimen  where substring(Customer_Name,2,1)='R' ;
 select Customer_Name from cust_dimen where substring(Customer_Name,4,1)='D' ;

-- 16 Write a SQL query to to make a list with Cust_Id, Sales, Customer Name and 
-- their region where sales are between 1000 and 5000
select cust_dimen.Cust_id, market_fact.Sales, cust_dimen.Customer_Name,cust_dimen.Region from cust_dimen Left join market_fact on cust_dimen.Cust_id=market_fact.Cust_id where market_fact.Sales>1000 and market_fact.Sales<5000;

-- 17  Write a SQL query to find the 3rd highest sales.
select sales from market_fact order by sales Desc  limit 2,1;

--  18. Where is the least profitable product subcategory shipped the most? For the least 
-- profitable product sub-category, display the region-wise no_of_shipments and the 
-- profit made in each region in decreasing order of profits (i.e. region, 
-- no_of_shipments, profit_in_each_region)
select  cust_dimen.Region ,prod_dimen.Product_Sub_Category,market_fact.profit from prod_dimen inner join market_fact on prod_dimen.Prod_id=market_fact.Prod_id order by Profit  ;







