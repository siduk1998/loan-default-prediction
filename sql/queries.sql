-- 1. Total records and default rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(SeriousDlqin2yrs) AS total_defaults,
    ROUND(SUM(SeriousDlqin2yrs) * 100.0 / COUNT(*), 2) AS default_rate_percent
FROM loan_data;

-- 2. Default rate by age group
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 45 THEN '30-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS total,
    SUM(SeriousDlqin2yrs) AS defaults,
    ROUND(SUM(SeriousDlqin2yrs) * 100.0 / COUNT(*), 2) AS default_rate
FROM loan_data
GROUP BY age_group
ORDER BY default_rate DESC;

-- 3. Average income of defaulters vs non-defaulters
SELECT 
    SeriousDlqin2yrs AS defaulted,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income,
    ROUND(AVG(DebtRatio), 2) AS avg_debt_ratio
FROM loan_data
WHERE MonthlyIncome IS NOT NULL
GROUP BY SeriousDlqin2yrs;

-- 4. High risk customers (late payments + high debt)
SELECT id, age, MonthlyIncome, DebtRatio, 
       NumberOfTimes90DaysLate, SeriousDlqin2yrs
FROM loan_data
WHERE NumberOfTimes90DaysLate >= 3
  AND DebtRatio > 0.5
ORDER BY NumberOfTimes90DaysLate DESC
LIMIT 20;

-- 5. Customers with no income (potential risk)
SELECT COUNT(*) AS missing_income_count
FROM loan_data
WHERE MonthlyIncome IS NULL;