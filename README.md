# Coffee_Sales_Analysis

## Objective 🎯
Primary objective of the project is to analyze coffee shop transaction data to extract actionable insights regarding sales performance, customer purchasing patterns, and operational efficiency. The goal is to provide data-driven recommendations to stakeholders to optimize the menu, adjust staffing levels, and increase overall profitability.

## Business Problem 🧠 
The coffee shop chain is lacking a centralized dashboard or analytical report to monitor its performance. Management is unsure which hours are most profitable, which products are "dead stock" (slow-moving), and how different locations compare in terms of customer spending habits. They need to identify trends to prepare for seasonal shifts and marketing campaigns.

## Tools & Tech 💻  
* MySQL
* SQL concepts used :
  * Aggregations (SUM,COUNT,AVG,ROUND)
  * CTEs (WITH)
  * Window functions (RANK,LEAD,LAG)

 ## Key Questions Answered ❓
 
 ### 1. Monthly Revenue Growth  
 Question : What is the total revenue and total quantity sold for each month ?  
 ### 2. Location Benchmark  
Question : Calculate the total revenue, total transactions, and Average Transaction Value (ATV) for each store location.  
Which store is leading ?  
### 3.  Revenue Contribution  
Question : What is the percentage contribution of each product_category (Coffee, Tea, Bakery, etc.) to the total revenue ?  
### 4. Sales Trends (MoM)  
Question : calculate the Month-over-Month (MoM) growth percentage in sales.  
### 5. The Morning Rush  
Question : How much revenue is generated during the peak morning hours (7:00 AM – 10:00 AM) compared to  
the rest of the day ?  
### 6. Peak Hour Analysis  
Question : Identify the top 3 busiest hours of the day for each store based on the number of transactions.  
### 7. Weekday vs. Weekend  
Question : Compare the average daily revenue generated on weekdays versus weekends. Should we adjust operating hours ?  
### 8. Top 10 High-Performers  
Question : List the Top 10 product_detail items by total revenue.  
### 9. Menu Optimization  
Question : Identify the bottom 10 products by quantity sold. Should these be removed or promoted ?  
### 10. Category Deep Dive  
Question : Within the 'Coffee' category, which product_type (e.g., Drip coffee vs. Gourmet brewed coffee)  
generates the most profit ?  

## Insights 📊
* Peak Demand : Demand spikes sharply between 8:00 AM and 10:00 AM.
* Location Variance : Lower Manhattan acts as a high-volume commuter hub, while Astoria shows a  
more gradual mid-morning build-up.
* Inventory Efficiency : Ten products contribute to the majority of revenue, while the bottom 10% of the menu accounts for negligible quantity sold, suggesting an opportunity for inventory consolidation.
