-- Unit 4.5.1 - Basic Queries

USE POS;

SELECT * FROM Client;

SELECT
    Client.name, Client.surname
FROM
    Client;

SELECT * FROM Payment WHERE Payment.total >= 1000;


SELECT *
FROM Client
ORDER BY Client.surname, Clien.name;

--Decsedent order

SELECT *
FROM Client
ORDER BY Client.surname DESC, Client.name DESC;

-- Unit 4.5.2 - Aggregate & Scalar Functions
SELECT *
     SUM(Invoice.total)
FROM
    Invoice;

SELECT *
     AVG(Invoice.total)
FROM
    Invoice;

SELECT *
     MIN(Invoice.total)
FROM 
    Invoice;

--Using the Group By Keyword
SELECT 
     Invoice.cashierId, SUM(Invoice.total)
FROM
     Invoice;
GROUP BY
     Invoice.cashierId;

-- When your query contains both aggregate columns and non-aggregate columns,
-- you must add a GROUP BY, and list within it ALL the non aggrgate columns.

SELECT *
     Invoice.cashierId, Invoice.issueTime, SUM(Invoice.total)
FROM
     Invoice
GROUP BY
     Invoice.cashierId, Invoice.issueTime;

-- Using scalar function

SELECT *
     Invoice.cashierId, DATE(Invoice.issueTime), SUM(Invoice.total)
FROM
     Invoice
GROUP BY
     Invoice.cashierId, DATE(Invoice.issueTime);

SELECT *
     CONCAT('€', Invoice.total)
FROM
     Invoice; 

SELECT * 
     ROUND(AVG(Invoice.total), 2)
FROM
     Invoice;

SELECT * 
     CONCAT('€', ROUND(AVG(Invoice.total), 2)) AS AverageValue
FROM
     Invoice AS I;

