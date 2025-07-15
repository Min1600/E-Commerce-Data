# Olist E-Commerce Sales Performance Analysis (2016-2018)

### Background and Overview

This project looks into E-Commerce data made by [Olist store](https://www.olist.com/), the data contains information of over 100k orders from 2016 to 2018 made at marketplaces all over Brazil. Olist is a Brazillian E-Commerce tech startup, that connects small and medium-sized sellers to major marketplaces like Mercado Livre, Amazon, and Walmart. Olist helps the Brazillian marketplace manage their business by offering Enterprise Resource Planning (ERP) software, logistics services and financial tools. In this project I will analyze the ERP data from Olist mainly focusing on sales, delivery time, product performance, reviews and freight values.

With this data we look into the most popular products in general as well as based on time of year which will help Olist be aware of what products have high demand during specific times to better prepare for inventory management, marketing of products and sales. The products with low sales can be indentified for further investigation to improve product sales. Analysing reviews to find trends that effect customer review scores to make improvements in those areas. This allows better customer satisfaction in future and potentially better sales and customer retention.

### Data Structure Overview

The data chosen from Olist orders database represents sales information, transaction dates, customer reviews, and product information from October 2016 to August 2018. <br />


**Sales data**: Each unique record contains product data with an order id that is repeated based on how many products are bought per order and a product id for each unique product. Data contains price and freight value for every product bought.

**Transaction dates**: Every record contains transactional dates and a unique order id with the exact purchase time of each order, the estimated delivery time as well as the actual date the product was received by the customer.

**Review data**: Reference table that includes order id and customer review score

**Product Category**: Reference table that includes product id and product category name.


![Data Structure](img/Visualisation.png)

### Executive Summary

The top five highest revenue products and most bought products are Beleza saude (9.5% of sales), relogios presents (8.9% of sales), cama mesa banho (7.9% of sales), esporte lazer (7.3% of sales) and informatica acessorios (6.9% of sales). Based on season the results are similar with cama mesa banho, Beleza saude, esporte lazer being in the top five throughout the year, product sales are not effected by time of the year. All products have very small fluctuations in percentage sales contribution over time. 

The average items per order is 1.14, the more items bought per order the higher the freight cost.The average review score is 4.1 out of a maximum score of 5, median of 5 and standard deviation of 1.35 showcasing a relatively normal distribution with most products having a high review score of 4 to 5. There is a moderate correlation between delivery time and customer reviews, indicating that a longer delivery time of order may cause products to be negatively reviewed

- growth rate

### Insights Deep Dive

The price of products has a mean of R$119.81, median of R$74.9, lower quartile of R$39.9 and upper quartile of R$134. This means most products fall between the ranges of R$40 and R$135. The standard deviation is large at 180.5 as the highest cost product is 6735, this causes the distribution of price to be right skewed, driven by a small number of highly priced items. It is difficult to say if some product costs had a misinput as the data only contains the product category not the exact product name. The categories such as electronics and household items had high cost which makes sense as these items can cost over thousands of dollars. 

Total revenue is shown to be increasing over time, despite only having the first 8 months of 2018's data available, total revenue in 2018 is still higher than in 2017. Th Total revenue per month in 2017 shows an increasing trend over time, while in 2018 there is no clear trend and the peak revenue in 2018 was in May at R$969,740 while for 2017 the peak revenue was in November at R$972,294. Total Revenue per month in 2016 was very low with a peak revenue of R$40,305 in October adn extereme lows of R$135 in Septemeber and R$11 in December, with no reveue at all in November.

The product with the highest average review of 5 is fashion roupa infanto juvenil, this product had all the customers give it a review of 5, however only 7 of those products were sold. Other top product with and average review score of >4.5 and median of 5 are cds_dvds_musicais,livros_interesse_geral and livros_importados. One of the lowest rated products with 37 reviews fraldas_higien has a mean review score of 3.4 and a median of 3, portateis_cozinha_e_preparadores_de_alimentos with only 14 sold has a mean review score of 3.4 and median of 3.5. Another product seguros_e_servicos with only 2 reviews had a review score of 1 and 4, overall lowest mean and median but because of the low number of reviews conclusions about the product cannot be drawn. Every other product had a median score of 4 or 5 and mean of more than 3.5.

 As mentioned earlier delivery time effects review scores negatively, with a pearson's correlation coefficient of -0.33, indicating lower reviews for longer delivery times. Looking at freight value per order has shown that the more items ordered and the higher the price of the order the higher the freight value. 

### Recommendation

