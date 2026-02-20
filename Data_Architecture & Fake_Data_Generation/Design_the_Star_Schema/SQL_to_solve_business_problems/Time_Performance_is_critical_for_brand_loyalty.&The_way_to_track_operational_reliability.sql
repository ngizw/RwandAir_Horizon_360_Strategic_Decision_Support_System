SELECT 
    month, 
    departure_city,
    (SUM(cancelled_flights)::float / SUM(total_flights)) * 100 AS cancellation_rate
FROM analytics.vw_flight_kpis
GROUP BY month, departure_city
ORDER BY cancellation_rate DESC;