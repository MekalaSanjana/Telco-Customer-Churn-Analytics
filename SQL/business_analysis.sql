USE excel_analysis;

-- 1. Overall Churn Analysis
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS Retained_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final;


-- 2. Churn by Contract Type
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY Contract
ORDER BY Churn_Rate DESC;


-- 3. Churn by Internet Service
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY InternetService
ORDER BY Churn_Rate DESC;


-- 4. Churn by Payment Method
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;


-- 5. Churn by Tenure Group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 36 THEN '2-3 Years'
        WHEN tenure <= 60 THEN '3-5 Years'
        ELSE '5+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY Tenure_Group
ORDER BY Churn_Rate DESC;


-- 6. Churn by Senior Citizen Status
SELECT
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior'
        ELSE 'Non-Senior'
    END AS Senior_Citizen_Status,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY SeniorCitizen
ORDER BY Churn_Rate DESC;


-- 7. Churn by Monthly Charges
SELECT
    CASE
        WHEN MonthlyCharges < 30 THEN 'Low Charges'
        WHEN MonthlyCharges < 70 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS Charge_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY Charge_Group
ORDER BY Churn_Rate DESC;


-- 8. Churn by Gender
SELECT
    gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY gender
ORDER BY Churn_Rate DESC;


-- 9. Churn by Partner Status
SELECT
    Partner,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY Partner
ORDER BY Churn_Rate DESC;


-- 10. Churn by Dependents
SELECT
    Dependents,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY Dependents
ORDER BY Churn_Rate DESC;


-- 11. Contract + Payment Method Analysis
SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY Contract, PaymentMethod
HAVING COUNT(*) >= 50
ORDER BY Churn_Rate DESC;


-- 12. High-Risk Customer Segments
SELECT
    Contract,
    InternetService,
    CASE
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 36 THEN '2-3 Years'
        WHEN tenure <= 60 THEN '3-5 Years'
        ELSE '5+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY Contract, InternetService, Tenure_Group
HAVING COUNT(*) >= 30
ORDER BY Churn_Rate DESC;


-- 13. Multiple Services Analysis
SELECT
    TechSupport,
    OnlineSecurity,
    OnlineBackup,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telco_customer_churn_final
GROUP BY TechSupport, OnlineSecurity, OnlineBackup
HAVING COUNT(*) >= 30
ORDER BY Churn_Rate DESC;