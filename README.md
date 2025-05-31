# world-bank-debt-analysis-sql
SQL analysis of international debt data from The World Bank to identify trends across countries.
# 🔍 Project Goals

Using SQL, we aimed to answer the following questions:

1. **How many distinct countries are present in the dataset?**
2. **Which country has the highest total amount of debt?**
3. **Which country has the lowest total amount of repayments?**

## 💻 Dataset

The dataset used is the `international_debt` table, containing:
- `country_name`
- `country_code`
- `indicator_name`
- `indicator_code`
- `debt` (value in current US dollars)

## 🧠 Key Skills Demonstrated
- Filtering with `WHERE`
- Aggregating with `SUM`, `COUNT`, and `MIN`
- Grouping data using `GROUP BY`
- Sorting with `ORDER BY`
- Returning limited results with `LIMIT`

## 📈 Results Summary

- **Total Countries:** 124
- **Highest Debt Country:** China
- **Lowest Repayment Country:** Timor-Leste

## 📎 Attribution

This project was inspired by a guided SQL project on DataCamp, using real data from The World Bank.
📄 queries.sql
sql
Copy
Edit
-- Q1: Number of distinct countries
SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM public.international_debt;

-- Q2: Country with the highest total debt
SELECT country_name,
       SUM(debt) AS total_debt
FROM public.international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

-- Q3: Country with the lowest total repayments
SELECT country_name,
       MIN(indicator_name) AS indicator_name,
       SUM(debt) AS lowest_repayment
FROM international_debt
WHERE indicator_name IN (
  'Principal repayments on external debt, long-term (AMT, current US$)',
  'Principal repayments on external debt, private nonguaranteed (PNG) (AMT, current US$)'
)
GROUP BY country_name
ORDER BY lowest_repayment ASC
LIMIT 1;
