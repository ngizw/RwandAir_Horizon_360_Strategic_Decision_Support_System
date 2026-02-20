CREATE OR REPLACE VIEW analytics.vw_flight_kpis AS
SELECT
    t.year,
    t.month,
    d1.city_name AS departure_city,
    d2.city_name AS arrival_city,
    COUNT(f.flight_id) AS total_flights,
    SUM(f.passenger_count) AS total_passengers,
    SUM(f.revenue) AS total_revenue,
    SUM(f.fuel_cost) AS total_fuel_cost,
    AVG(f.load_factor) AS avg_load_factor,
    SUM(CASE WHEN s.status_name = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_flights
FROM analytics.fact_flight_operations f
JOIN analytics.dim_city d1 ON f.departure_city_id = d1.city_id
JOIN analytics.dim_city d2 ON f.arrival_city_id = d2.city_id
JOIN analytics.dim_time t ON f.time_id = t.time_id
JOIN analytics.dim_flight_status s ON f.status_id = s.status_id
GROUP BY t.year, t.month, d1.city_name, d2.city_name;
