# Olist E-Commerce Sales Performance Analysis (2016-2018)

## Background and Overview

This project looks into E-Commerce data provided by [Olist store](https://www.olist.com/), the data contains information of over 100k products sold from 2016 to 2018 at marketplaces all over Brazil. Olist is a Brazillian E-Commerce tech startup that was established in the marketplace in 2016. Olits connects small and medium-sized sellers to major marketplaces like Mercado Livre, Amazon, and Walmart. Olist helps the Brazillian marketplace manage their business by offering Enterprise Resource Planning (ERP) software, logistics services and financial tools. In this project I will analyze the ERP data from their E-Commerce platform mainly focusing on sales, delivery time, product performance and reviews. The main goal is to look at the performance of Olist during its first few years in the marketplace to identify potential strategies and operational practices that contributed to Olist’s early success, which could inform future e-commerce business models.

### Objectives:

*Product Performance*: Identify the top-performing products and categories based on sales volume and revenue, as well as their performance across different times of the year. This insight will help Olist optimize inventory planning, tailor marketing campaigns, and anticipate seasonal demand more effectively.

*Review Scores Analysis*: Explore customer reviews to uncover patterns that influence review scores. Insights from this analysis can guide improvements in customer experience, leading to higher satisfaction, increased retention, and potentially greater sales.

*Sales Trends and Growth Rate*: Examine overall sales trends and growth rate over time. This will provide a clear view of Olist’s business trajectory, highlight seasonal patterns, and reveal whether growth during the early years was consistent and sustainable.

## Executive Summary

*Olist Growth Rate:*

 Olist sales analysis of product orders from October 2016 to August 2018 shows a huge increase in sales from 2016 to 2017 with a growth of over 14000% as the company's first official release in the main market place was estbalished in 2016. The marketing and overall usefullness of the services provided must have gained a lot of popularity during the short period between October 2016 and December 2016, an analysis with a focus on the marketing of the company is out of the scope of this project but would be useful in the future. From 2017 to 2018 the company had a growth rate in sales of 20%, indicating a more steady growth rate as the company is now established and well known, huge growth spikes are less likely after being tapped into the market. During 2018 the growth rate was stagnant with aa average of -1% growth over an 8 month period, this further indicates that the initial impressive growth was due to a unique service that captured immediately gained a lot of demand and popularity among customers.

*Product Performance:*

 Overall, Beleza_saude had the highest amount of sales, contributed to 9.5% of total sales with nearly 10000 products sold. While the most popular product is cama_mesa_banho with over 11000 products sold. Based on season the results are similar with cama mesa banho, Beleza saude and esporte lazer being in the top five throughout the year. All products sold have very small fluctuations in percentage sales contribution over time, showcasing no biases towards time of year.

*Review Scores Analysis:*

 Reviews scores overall are high with a median of 5/5 and mean of 4.1, when analysed by year there are no differences in median and mean scores. There is a moderate correlation between delivery time and customer reviews, indicating that a longer delivery time of orders may cause products to be negatively reviewed. When products arrive later than expected the reviews scores get effected negatively and when the products arrive earlier the review score are effected positively. For a more in depth discussion please have a look at the insights deep dive section.

## Data Structure Overview

The data chosen from Olist orders database represents sales information, transaction dates, customer reviews, and product information from October 2016 to August 2018.

### Sales data: 
Data contains price of products and freight values of every product bought. Each unique record contains an order id that is repeated based on how many products are bought per order and a product id to identify each unique product. This data helps us to evaluate how many items are bought per order and which products bring in the most sales. 

### Transaction dates: 
The records contains a unique order id, the purchase time of each order, the estimated delivery time, date the order was recieved by the carier and the date the product was received by the customer. This data can be used to find how long it takes products to reach the customers and how this may effect reviews of the products. The date of purchase is also used to find any trends regarding specific products bought based on time of the year.

### Customer Reviews:
Reference table that includes order id and customer review score for each product. The review scores are an indication of customer satisfaction, these scores can be used to investigate the product rating and find correlations for low and high review scores. This allows us to find ways to improve services for better customer satistfaction and retention.

### Product Category:
Reference table that includes unique product id and product category name. Contains the category name of the product to give more meaning and information to products.


![Data Structure](img/Visualisation.png)


## Insights Deep Dive

### Product Performance:

 There were only 272 products sold from October 2016 to December 2016, Olist's E-Commerce marketplace first started in 2016 hence the low numbers. On January 2017 there were nearly 1000 products sold much higher than the products sold in the 3 months during 2016. Overall, nearly 45000 products were sold in 2017 and over 50000 in just 8 months of 2018 (January-August). In 2016 Moveis decoracao was the most sold at 69 and had the highest sales (R$5817), during 2017 cama mesa banho had the most products sold at 5252 as well as the highest sales(R$501,166). Finally, in 2018 up to August, Beleza saude had the most sold at 5858 and the highest sales (R$757,111). Overall cama mesa banho, beleza saude, esporte lazer, relogios_presentes, informatica acessorios had the most sold from October 2016 to August 2018. These translate to household items, beauty health, sport leisure, watches and computer acessories respectively. Beleza saude has the highest overall percentage sales contribution at 10.6% out of 72 unique product categories, every other product was less than 10% of the total sales.

### Sales Trends:

Total revenue per month in 2017 shows an increasing trend over time, while in 2018 there is no clear trend. Peak sales in 2018 was in May at R$969,740 and its highest sales growth rate was 14% during March. For 2017 the peak revenue was in November at R$972,294 and the highest sales growth rate was 104% during February. Total sales per month in 2016 was very low with peak sales of R$40,305 in October and extereme lows of R$135 in Septemeber and R$11 in December, with no sales at all in November. Overall, 2017 experienced the highest growth rates throughout the year.

![Data Structure](img/Sales_and_Product_Growth_Rates-1.png)


### Review Score Analysis:

The average review score is 4.1 out of a maximum score of 5, median of 5 and standard deviation of 1.35 showcasing a relatively normal distribution with most products having a high review score of 4 to 5, more than 50% of review scores being 5. The mean review score for each year individually was between 3.9 and 4.1 while the median review score is 5 for each year.

As mentioned earlier delivery time effects review scores negatively, with a pearson's correlation coefficient of -0.33, indicating lower reviews for longer delivery times. The mean estimated delivery time is 24 days, when the delivery time takes more than 28 days to arrive the median review score is 1 and the mean 2.Whereas when the delivery takes less than 21 days (lower quartile of average delivery time) to arrive which is 87% of orders, the median score is 5. When filtering for deliveries that are considered fast (arrives in less than 21 days) but is later than the estimated time the median and mean reviews score drop to 3, plotting a graph showed that if the estimated time of delivery is off by more than 2 days review score drops drastically despite coming 'early' (under 21 days). And vice versa when products come sooner than estimated, despite having a 'long' delivery time (>28 days), the median review scores are higher at 4 instead of 1. Trying to match the data as closely as possible, there were 1478 products for delivery times that came earlier than expected, the time taken ranged from 28-70 days. There were 4540 products for delivery times that came later than expected, filtered out the products that took more than 70 days to arrive and was left with 4244 products. This was to ensure that the outliers of late deliveries' reviews were not taken into account, to reduce the effect of differences in delivery times between the early and late deliveries. The overall results indicates that not only do late deliveries affect reviews but differences in estimated times can affect customer reviews of products.

## Recommendations

