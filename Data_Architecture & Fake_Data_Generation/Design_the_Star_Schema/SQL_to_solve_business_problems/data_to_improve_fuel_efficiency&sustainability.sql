
SELECT 
    departure_city, 
    arrival_city, 
    ROUND(AVG(avg_load_factor)::numeric, 2) as mean_load,
    ROUND(COALESCE(SUM(total_fuel_cost) / NULLIF(SUM(total_passengers), 0), 0)::numeric, 2) AS fuel_cost_per_passenger,
    -- Labeling the results for Power BI
    CASE 
        WHEN AVG(avg_load_factor) < 0.70 THEN 'Review Required'
        ELSE 'Optimized'
    END AS status
FROM analytics.vw_flight_kpis
GROUP BY departure_city, arrival_city
ORDER BY mean_load ASC;