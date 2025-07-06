CREATE TABLE products_table as
SELECT order_items.*, olist_products.product_category_name FROM order_items
LEFT JOIN olist_products ON order_items.product_id = olist_products.product_id

CREATE TABLE product_dates as
SELECT orders.*, products_table.price, products_table.product_category_name, products_table.order_item_id,  products_table.freight_value FROM orders
LEFT JOIN products_table ON orders.order_id = products_table.order_id

CREATE TABLE analysis_table as
SELECT product_dates.*, olist_order_reviews.reviews_score FROM product_dates
LEFT JOIN olist_order_reviews ON product_dates.order_id = olist_order_reviews.order_id

CREATE TABLE customer_product_table as
SELECT olist_customers.*, analysis_table.order_id, analysis_table.price, analysis_table.product_category_name, analysis_table.reviews_score, analysis_table.order_item_id
FROM olist_customers
LEFT JOIN analysis_table ON olist_customers.customer_id = analysis_table.customer_id
