--- Analyzing coffee_shop_sales(product_type) using store_location______:using the case statement
---This is how to use "CASE STATEMENT" 
SELECT 
      product_category,
      product_type,
      store_location,
      CASE 
         WHEN store_location = 'Lower Manhattan' THEN 'Popular'
         WHEN store_location = 'Astoria' THEN 'local'
         ELSE  'remote'
      END AS location_stats
FROM coffee_shop_sales;

---Using aggregate function 'COUNT' with the 'CASE' statement
SELECT 
     COUNT(transaction_id) AS sales_transaction,
      CASE 
         WHEN store_location = 'Lower Manhattan' THEN 'Popular'
         WHEN store_location = 'Astoria' THEN 'local'
         ELSE  'remote'
      END AS location_stats
FROM coffee_shop_sales
GROUP BY location_stats
ORDER BY sales_transaction DESC;


----Calculating sales_transaction for each 'product_type'
SELECT 
     COUNT(transaction_id) AS sales_transaction,
      CASE 
         WHEN store_location = 'Lower Manhattan' THEN 'Popular'
         WHEN store_location = 'Astoria' THEN 'local'
         ELSE  'remote'
      END AS location_stats
FROM coffee_shop_sales
WHERE product_category = 'Coffee'
GROUP BY location_stats
ORDER BY sales_transaction DESC


   SELECT * FROM coffee_shop_sales;

SELECT 
     COUNT(transaction_id) AS sales_transaction,
      CASE 
         WHEN store_location = 'Lower Manhattan' THEN 'Popular'
         WHEN store_location = 'Astoria' THEN 'local'
         ELSE  'remote'
      END AS location_stats
FROM coffee_shop_sales
WHERE product_category = 'Tea'
GROUP BY location_stats
ORDER BY sales_transaction DESC


SELECT 
     COUNT(transaction_id) AS sales_transaction,
      CASE 
         WHEN store_location = 'Lower Manhattan' THEN 'Popular'
         WHEN store_location = 'Astoria' THEN 'local'
         ELSE  'remote'
      END AS location_stats
FROM coffee_shop_sales
WHERE product_category = 'Drinking Chocolate'
GROUP BY location_stats
ORDER BY sales_transaction DESC


SELECT 
     COUNT(transaction_id) AS sales_transaction,
      CASE 
         WHEN store_location = 'Lower Manhattan' THEN 'Popular'
         WHEN store_location = 'Astoria' THEN 'local'
         ELSE  'remote'
      END AS location_stats
FROM coffee_shop_sales
WHERE product_category = 'Bakery'
GROUP BY location_stats
ORDER BY sales_transaction DESC


SELECT 
     COUNT(transaction_id) AS sales_transaction,
      CASE 
         WHEN store_location = 'Lower Manhattan' THEN 'Popular'
         WHEN store_location = 'Astoria' THEN 'local'
         ELSE  'remote'
      END AS location_stats
FROM coffee_shop_sales
WHERE product_category = 'Coffee beans'
GROUP BY location_stats
ORDER BY sales_transaction DESC;

---Using Subqueries_CTES
SELECT *
FROM(SELECT *
   FROM coffee_shop_sales
   WHERE EXTRACT (MONTH FROM transaction_date)= 1
   ) AS january_coffee_sales;

SELECT
   product_id,
   product_type
FROM
  coffee_shop_sales
WHERE 
product_type ='Gourmet brewed coffee';

---Analysing the different types of product for sales and their category
SELECT
   product_id,
   product_type AS product_selection
FROM
   january_coffee_sales
WHERE
   product_id IN (
      SELECT
      product_id
      FROM
      coffee_shop_sales
      WHERE
      product_category = 'Tea';
   )

SELECT
   product_id,
   product_type AS product_selection
FROM
   january_coffee_sales
WHERE
   product_id IN (
      SELECT
      product_id
      FROM
      coffee_shop_sales
      WHERE
      product_category = 'Coffee'
   )


SELECT
   product_id,
   product_type AS product_selection
FROM
   january_coffee_sales
WHERE
   product_id IN (
      SELECT
      product_id
      FROM
      coffee_shop_sales
      WHERE
      product_category = 'Drinking Chocolate'
   )

SELECT
   product_id,
   product_type AS product_selection
FROM
   january_coffee_sales
WHERE
   product_id IN (
      SELECT
      product_id
      FROM
      coffee_shop_sales
      WHERE
      product_category = 'Bakery'
   )

SELECT
   product_id,
   product_type AS product_selection
FROM
   january_coffee_sales
WHERE
   product_id IN (
      SELECT
      product_id
      FROM
      coffee_shop_sales
      WHERE
      product_category = 'Coffee beans'
   );

---
 SELECT
   product_id,
   product_category AS product_selection
FROM
   january_coffee_sales
WHERE
   product_id IN (
      SELECT
      product_id
      FROM
      coffee_shop_sales
      WHERE
      product_type = 'Brewed Chai tea'
   )  

   SELECT *
   FROM coffee_shop_sales;

SELECT
   product_id,
   product_category AS product_selection
FROM
   january_coffee_sales
WHERE
   product_id IN (
      SELECT
      product_id
      FROM
      coffee_shop_sales
      WHERE
      product_type = 'Scone',
   )

/*Find the store that has the most sales
--get the total number of sales opening per store_id*/
--You can use this to count a specific column


WITH store_sales_count AS(
SELECT 
   store_id,
   COUNT(*)
FROM
   coffee_shop_sales
GROUP BY
   store_id)
SELECT *
FROM
  store_sales_count;


SELECT store_location AS location
FROM january_coffee_sales
WHERE store_id IN (
   SELECT
      store_id
   FROM
      coffee_shop_sales
   WHERE
      Product_category = 'Coffee'
);

SELECT store_id,
store_location AS location
FROM january_coffee_sales
WHERE store_id IN (
   SELECT
      store_id
   FROM
      coffee_shop_sales
   --WHERE
      --Product_category = 'Coffee'
   ORDER BY
   store_id 
);

WITH store_sales_count AS(
SELECT 
     store_id,
     COUNT(*)
FROM
    january_coffee_sales
GROUP BY
     store_id)

SELECT store_location
FROM
  coffee_shop_sales
LEFT JOIN
  store_sales_count ON store_sales_count.store_id = coffee_shop_sales.store_id;


     
 WITH store_sales_count AS(
SELECT 
     store_id,
     COUNT(*) AS total_store
FROM
    january_coffee_sales
GROUP BY
     store_id)

SELECT 
january_coffee_sales.store_location AS location,
store_sales_count.total_store
FROM
  january_coffee_sales
LEFT JOIN
  store_sales_count ON store_sales_count.store_id = coffee_shop_sales.store_id    