-- =====================================================
-- TELCO CUSTOMER CHURN ANALYTICS
-- DATA CLEANING
-- =====================================================

USE excel_analysis;


-- 1. Check total rows in the original table
SELECT COUNT(*) AS Total_Rows
FROM telco_customer_churn_cleaned;


-- 2. Check unique customers
SELECT COUNT(DISTINCT customerID) AS Unique_Customers
FROM telco_customer_churn_cleaned;


-- 3. Identify duplicate customer IDs
SELECT
    customerID,
    COUNT(*) AS Duplicate_Count
FROM telco_customer_churn_cleaned
GROUP BY customerID
HAVING COUNT(*) > 1
LIMIT 10;


-- 4. Create final table with one record per customer
CREATE TABLE IF NOT EXISTS telco_customer_churn_final AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY customerID
               ORDER BY customerID
           ) AS rn
    FROM telco_customer_churn_cleaned
) AS ranked
WHERE rn = 1;


-- 5. Verify the cleaned table
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT customerID) AS Unique_Customers
FROM telco_customer_churn_final;


-- 6. Check for remaining duplicate customer IDs
SELECT
    customerID,
    COUNT(*) AS Duplicate_Count
FROM telco_customer_churn_final
GROUP BY customerID
HAVING COUNT(*) > 1;