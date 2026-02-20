SELECT 
    month, 
    SUM(total_revenue) as revenue_trend,
    LAG(SUM(total_revenue)) OVER (ORDER BY month) as prev_month_rev
FROM analytics.vw_flight_kpis
WHERE year = 2025
GROUP BY month
ORDER BY month;