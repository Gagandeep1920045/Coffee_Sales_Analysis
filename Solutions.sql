-- -------                        SOLUTIONS
----      Query 1
-- What is the total revenue and total quantity sold for each month ?
SELECT
	date_format(transaction_date, '%b') as Month_Name,
    concat(Round(SUM(transaction_qty * unit_price),2)," $") as Total_Revenue,
    Sum(transaction_qty) as Total_Quantity
FROM Coffee
Group By Month_Name;

----      Query 2
-- Calculate the total revenue, total transactions, and Average Transaction Value (ATV)
-- for each store location. Which store is leading ?
SELECT
	store_location,
    CONCAT(ROUND(SUM(transaction_qty * unit_price), 2),' $') AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Transactions,
    CONCAT(ROUND(AVG(transaction_qty * unit_price), 2),' $') AS Average_Transaction_Value
FROM
Coffee
GROUP BY Store_location
ORDER BY Total_Revenue DESC;

----      Query 3
-- What is the percentage contribution of each product_category
-- (Coffee, Tea, Bakery, etc.) to the total revenue ?
With sales as
	(Select
		product_category,
		Concat(Round(sum(transaction_qty * unit_price),2)," $") as Total_Revenue
    from coffee
    group by product_category
    order by Total_revenue)
Select
	product_category,
    Total_revenue,
    Round(sum(total_revenue) over (),2) as Overall_Sales,
    Concat(Round(Total_Revenue/sum(total_revenue) over () * 100, 2),' %') as percentage_of_total
From Sales;

----      Query 4
-- calculate the Month-over-Month (MoM) growth percentage in sales.
With sales as
	(select
	date_format(transaction_date," %b") as Month,
	Concat(Round(sum(transaction_qty * unit_price),2)," $") as Total_Revenue
from coffee
group by Month)
SELECT
	Month,
	total_Revenue as Current_Revenue,
	lag(total_Revenue) over () as Previous_month_Revenue,
	Concat(Round((total_Revenue - lag(total_Revenue) over () )/ lag(total_Revenue) over () * 100,2)," %") as Mom_growth_percentage
from sales;

----      Query 5
-- How much revenue is generated during the peak morning hours 
-- (7:00 AM – 10:00 AM) compared to the rest of the day ?
SELECT 
    CASE
        WHEN HOUR(transaction_time) BETWEEN 7 AND 9 THEN 'Morning Rush (7-10 AM)'
        ELSE 'Other Hours'
    END AS time_period,
    SUM(transaction_qty * unit_price) AS total_revenue,
    COUNT(transaction_id) AS total_transactions,
    ROUND(SUM(transaction_qty * unit_price) / (SELECT 
                    SUM(transaction_qty * unit_price)
                FROM
                    coffee) * 100,
            2) AS revenue_percentage
FROM
    coffee
GROUP BY time_period;    

----      Query 6
-- Identify the top 3 busiest hours of the day for 
-- each store based on the number of transactions ?
WITH HourStats AS (
    SELECT 
        store_location,
        HOUR(transaction_time) AS hour_of_day,
        COUNT(transaction_id) AS total_transactions
    FROM coffee
    GROUP BY store_location, HOUR(transaction_time)
),
RankedHours AS (
    SELECT 
        store_location,
        hour_of_day,
        total_transactions,
        RANK() OVER (PARTITION BY store_location ORDER BY total_transactions DESC) as rnk
    FROM HourStats
)
-- Selecting only the top 3 hours per store
SELECT 
    store_location,
    hour_of_day,
    total_transactions
FROM RankedHours
WHERE rnk <= 3
ORDER BY store_location, total_transactions DESC;

----      Query 7
-- Compare the average daily revenue generated on weekdays versus weekends ?
SELECT
	CASE
		WHEN dayofweek(transaction_date) IN (1,7) Then "Weekend"
        Else "Weekdays"
	END AS Day_Type,
Round(sum(transaction_qty * unit_price)/count(distinct transaction_date),2) as Average_Daily_Revenue
From coffee
Group by Day_Type;

----      Query 8
-- List the top 10 product_detail items by total revenue.
SELECT 
    product_detail,
    ROUND(SUM(transaction_qty * unit_price), 2) AS Total_Revenue
FROM
    coffee
GROUP BY product_detail
ORDER BY Total_Revenue DESC
LIMIT 10;

----      Query 9
-- Identify the bottom 10 products by quantity sold. 
-- Should these be removed or promoted ?
SELECT
	product_detail,
    sum(Transaction_qty) as Quantity_Sold,
    Round(sum(transaction_qty * unit_price),2) as Total_Revenue
From coffee
group by product_detail
Order by quantity_sold
Limit 10;

----      Query 10
-- Within the 'Coffee' category, which product_type 
-- (e.g., Drip coffee vs. Gourmet brewed coffee) generates the most profit ?
SELECT 
    product_type,
    ROUND(SUM(transaction_qty * unit_price), 2) AS Total_Revenue
FROM
    coffee
WHERE
    product_category = 'Coffee'
GROUP BY product_type
ORDER BY Total_Revenue DESC
LIMIT 1;