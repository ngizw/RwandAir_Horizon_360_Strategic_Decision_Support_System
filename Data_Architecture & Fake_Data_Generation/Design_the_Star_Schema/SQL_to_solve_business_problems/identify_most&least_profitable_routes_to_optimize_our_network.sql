SELECT 
    departure_city, 
    arrival_city, 
    SUM(total_revenue - total_fuel_cost) AS net_profit,
    (SUM(total_revenue) / NULLIF(SUM(total_passengers), 0)) AS yield_per_passenger
FROM analytics.vw_flight_kpis
GROUP BY departure_city, arrival_city
ORDER BY net_profit DESC;