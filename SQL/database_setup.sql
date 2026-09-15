-- =====================================================
-- TELCO CUSTOMER CHURN ANALYTICS
-- DATABASE SETUP
-- =====================================================

-- Create database
CREATE DATABASE IF NOT EXISTS excel_analysis;

-- Select database
USE excel_analysis;

-- Check available tables
SHOW TABLES;

-- Check the final cleaned table structure
DESCRIBE telco_customer_churn_final;

-- Verify total customers
SELECT COUNT(*) AS Total_Customers
FROM telco_customer_churn_final;

-- Verify unique customers
SELECT COUNT(DISTINCT customerID) AS Unique_Customers
FROM telco_customer_churn_final;