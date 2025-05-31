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
