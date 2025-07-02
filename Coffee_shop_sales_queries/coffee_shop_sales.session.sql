SELECT * FROM coffee_shop_sales;

SELECT transaction_time,transaction_qty
FROM coffee_shop_sales;


SELECT
   store_location,
   product_category,
   product_type,
   product_detail
FROM coffee_shop_sales;


SELECT
   store_location,
   product_category,
   product_type,
   product_detail,
   transaction_date,
   unit_price
FROM coffee_shop_sales
WHERE
    product_category = 'Tea'
ORDER BY unit_price DESC;

SELECT * FROM coffee_shop_sales;

--JANUARY
CREATE TABLE january_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 1;

--FEBRUARY
CREATE TABLE february_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 2

---MARCH
CREATE TABLE march_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 3;

SELECT * FROM march_coffee_sales;


--APRIL
CREATE TABLE april_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 4


--MAY
CREATE TABLE may_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 5


--JUNE
CREATE TABLE june_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 6


--JULY
CREATE TABLE july_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 7


--AUGUST
CREATE TABLE august_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 8


--SEPTEMBER
CREATE TABLE september_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 9


--OCTOBER
CREATE TABLE october_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 10


--NOVEMBER
CREATE TABLE november_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 11

--DECEMBER
CREATE TABLE december_coffee_sales AS
   SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 12