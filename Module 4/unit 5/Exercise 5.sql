-- Exercise 5.2
USE POS;

-- Show the id, name and surname of all the clients who made a purchases.
--Tables: Client, Invoice

SELECT DISTINCT
     Client.*
FROM
    Client
    RIGHT JOIN Invoice ON Invoice.clientid = Client.id;

--Alternate 
SELECT DISTINCT
     Client.*
FROM
    Client
    JOIN Invoice ON Invoice.clientId - Client.Id;

--Q2
-- Show the name and surname of all clients, as well as the number of purchases
-- each invoice counts as one purchase.
--Tables: Client, Invoice
SELECT DISTINCT
     Client.name, Client.surname, COUNT(Invoice.id) AS SaleCount
FROM
     Client
     LEFT JOIN Invoice ON Invoice.clientId = Client.id
GROUP BY 
    Client.name, Client.surname;

--Q3
-- Show the total pending payment amount left to collect from clients. 
--Tables: Payment, Invoice
SELECT
     (SELECT SUM(Invoice.total) FROM Invoice) - 
     (SELECT SUM(Payment.total) FROM Payment);

-- Q4
-- Show the id, name and surname of any clients who owe us money (debtors), as well as how much they
--owe us. 
--Tables: Payment, Invoice, Client 
SELECT 
     Client.id, Client.name, Client.surname,
     (SELECT SUM(Invoice.total) FROM Invoice WHERE Invoice.clientId = Client.id) - 
     (SELECT SUM(Payment.total) FROM Payment WHERE Payment.clientId = Client.id) AS Balance
FROM
    Client
HAVING
     Balance IS NOT NULL


--Q5
--Show the total sales made for each category of product. 
--Tables: InvoiceItem, Category, Item
SELECT
     Category.catName, SUM(InvoiceItem.unitPrice * InvoiceItem.qty) AS sales
FROM
    InvoiceItem
    JOIN Item ON InvoiceItem.itemId = Item.id
    JOIN Category ON Item.categoryId = Category.id
GROUP BY
    Category.catName;

