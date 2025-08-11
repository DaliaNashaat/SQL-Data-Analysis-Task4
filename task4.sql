-- 1. Select all customers
SELECT * FROM parks_and_recreation.customer;


-- 2. Filter customers older than 40 and sort by age
SELECT 
    Client_Num, 
    Customer_Age, 
    Gender
FROM customer
WHERE Customer_Age > 40
ORDER BY Customer_Age DESC;


-- 3. Select all credit cards
SELECT * 
FROM credit_card;


-- 4. Group by Education Level and count
SELECT 
    Education_Level, 
    COUNT(*) AS total_customers
FROM customer
GROUP BY Education_Level
ORDER BY total_customers DESC;


-- 5. INNER JOIN: Customer with their credit card info
SELECT 
    c.Client_Num, 
    c.Customer_Age, 
    cc.Card_Category, 
    cc.Credit_Limit
FROM customer AS c
INNER JOIN credit_card AS cc 
    ON c.Client_Num = cc.Client_Num
ORDER BY cc.Credit_Limit DESC;

-- 6. LEFT JOIN: All customers even without credit cards
SELECT 
    c.Client_Num, 
    c.Customer_Age, 
    cc.Card_Category
FROM customer AS c
LEFT JOIN credit_card AS cc 
    ON c.Client_Num = cc.Client_Num;
    
    -- 7. RIGHT JOIN: All credit cards even without matching customers
SELECT 
    c.Client_Num, 
    c.Customer_Age, 
    cc.Card_Category
FROM customer AS c
RIGHT JOIN credit_card AS cc 
    ON c.Client_Num = cc.Client_Num;
    
    -- 8. Customers with above average credit limit
SELECT 
    c.Client_Num, 
    cc.Credit_Limit
FROM customer AS c
INNER JOIN credit_card AS cc 
    ON c.Client_Num = cc.Client_Num
WHERE cc.Credit_Limit > (
    SELECT AVG(Credit_Limit) 
    FROM credit_card
);


-- 9. Average transaction amount per card category
SELECT 
    Card_Category, 
    AVG(Total_Trans_Amt) AS avg_transaction_amount
FROM credit_card
GROUP BY Card_Category
ORDER BY avg_transaction_amount DESC;

-- 10. Total transaction volume per card category
SELECT 
    Card_Category, 
    SUM(Total_Trans_Vol) AS total_volume
FROM credit_card
GROUP BY Card_Category
ORDER BY total_volume DESC;



-- 11. Create a view with full customer + credit card info
DROP VIEW customer_credit_info_v2;
CREATE VIEW customer_credit_info_v2 AS
SELECT 
    c.Client_Num, 
    c.Customer_Age, 
    c.Gender, 
    c.Education_Level,
    cc.Card_Category, 
    cc.Credit_Limit, 
    cc.Total_Trans_Amt
FROM customer AS c
INNER JOIN credit_card AS cc 
    ON c.Client_Num = cc.Client_Num;



-- 12. Create indexes for faster JOINs and filtering
CREATE INDEX idx_customer_age ON customer(Customer_Age);
CREATE INDEX idx_credit_limit ON credit_card(Credit_Limit);
















    

    
    
    
    
    
    
    
    
    
    
    
    
























    
    
    
    
    
    
    
    








