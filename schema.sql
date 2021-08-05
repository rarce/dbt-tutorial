create schema if not exists jaffle_shop;
	
create schema if not exists stripe;

CREATE TABLE IF NOT EXISTS stripe.stripe_payments (
    ID INT,
    ORDERID INT,
    PAYMENTMETHOD VARCHAR(20),
    STATUS VARCHAR(10),
    AMOUNT BIGINT,
    CREATED DATE
);

CREATE TABLE IF NOT EXISTS jaffle_shop.customers (
    ID INT,
    FIRST_NAME VARCHAR(30),
    LAST_NAME VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS jaffle_shop.orders (
    ID INT,
    USER_ID INT,
    ORDER_DATE DATE,
    STATUS VARCHAR(20)
);