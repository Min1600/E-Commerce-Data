# E-Commerce Data Analysis

### Background and Overview

This project looks into E-Commerce data made by [Olist store](https://www.olist.com/), the data contains information of over 100k orders from 2016 to 2018 made at marketplaces all over Brazil. Olist is a Brazillian E-Commerce tech startup, that connects small and medium-sized sellers to major marketplaces like Mercado Livre, Amazon, and Walmart. Olist helps the Brazillian marketplace manage their business by offering Enterprise Resource Planning (ERP) software, logistics services and financial tools. In this project I will analyze the ERP data from Olist mainly focusing on price, delivery time, product popularity, reviews and freight values products sold using Olist. 

With this data we can find the most popular products in general as well as based on time of year which will help companies be aware of what products have high demand during specific times to better prepare for inventory management, marketing of products and sales. We can also find products that have low reviews and look deeper into the reasonings for these low reviews to make improvements to products. This allows better customer satisfaction in future and potentially better sales. Look into the effect of delivery times and price on reviews to better understand how to improve customer satisfaction. 

### Data Structure Overview

The data chosen from Olist orders database represents sales information, transaction dates, customer reviews, and product information from October 2016 to August 2018.


Sales data: Each unique record contains product data with an order id that is repeated based on how many products are bought per order and a product id for each unique product. Data contains price and freight value for every product bought.

Transaction dates: Every record contains transactional dates and a unique order id with the exact purchase time of each order, the estimated delivery time as well as the actual date the product was received by the customer.

Review data: Reference table that includes order id and customer review score

Product Category: Reference table that includes product id and product category name.


![Data Structure](img/Visualisation.png)

### Executive Summary

