
UPDATE products
SET Unit_Price = 10
WHERE Unit_Price IS NULL;

SELECT Product_Name, Unit_Price
FROM products;

