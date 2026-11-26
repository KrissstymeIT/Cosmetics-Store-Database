USE store;

-- Task 4.1
SELECT *
FROM customer
ORDER BY last_name ASC;
 
 -- Task 4.2
SELECT DISTINCT brand_name
FROM brand
ORDER BY brand_name ASC;

-- Task 4.3
SELECT
    product_name,
    brand_id,
    category_id,
    product_type,
    price
FROM
    product
WHERE
    brand_id = 1
ORDER BY
    product_name ASC;

-- Task 4.4
SELECT
    first_name,
    last_name,
    gender,
    birth_date,
    phone_number
FROM
    customer
WHERE
    gender = 'F'
    AND birth_date BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY
    last_name ASC;

-- Task 4.5
SELECT *
FROM product
WHERE
    product_type = 'Крем'
    AND amount > 0
    AND volume_ml = 50;

-- Task 4.6
SELECT *
FROM product
WHERE
    amount > 0
    AND (product_type = 'Крем' OR product_type = 'Сироватка')
    AND (volume_ml = 30 OR volume_ml = 50);

-- Task 4.7
SELECT *
FROM orders
WHERE
    customer_id IS NULL;
