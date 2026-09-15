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
GROUP BY
    TechSupport,
    OnlineSecurity,
    OnlineBackup
HAVING COUNT(*) >= 30
ORDER BY Churn_Rate DESC;