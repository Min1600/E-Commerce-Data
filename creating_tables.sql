
CREATE TABLE orders(
    order_id TEXT PRIMARY KEY,
    customer_id TEXT,
    order_status VARCHAR(15),
    order_purchase_time TIMESTAMP,
    order_approved TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE order_payments(
    order_id TEXT,
    payment_type VARCHAR(20),
    payment_installments INT,
    payment_value DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE order_items(
    order_id TEXT,
    order_item_id INT,
    product_id TEXT,
    seller_id TEXT,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE olist_order_reviews(
    reviews_id TEXT,
    order_id TEXT,
    reviews_score INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE olist_products(
    product_id TEXT,
    product_category_name TEXT
);

CREATE TABLE olist_customers(
    customer_id TEXT,
    customer_city TEXT,
    customer_state TEXT
);