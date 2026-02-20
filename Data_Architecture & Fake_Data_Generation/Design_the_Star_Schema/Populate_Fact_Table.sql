
INSERT INTO analytics.fact_flight_operations (
    flight_id, flight_no, departure_city_id, arrival_city_id, 
    time_id, status_id, passenger_count, revenue, fuel_cost, load_factor
)
SELECT DISTINCT ON (f.flight_id) -- ✅ This ensures each flight_id is only handled ONCE
    f.flight_id::uuid,
    f.flight_no,
    d1.city_id,
    d2.city_id,
    t.time_id,
    s.status_id,
    f.passenger_count,
    f.revenue,
    f.fuel_cost,
    f.load_factor
FROM analytics.flight_operations f
JOIN analytics.dim_city d1 ON f.departure_city = d1.city_name
JOIN analytics.dim_city d2 ON f.arrival_city = d2.city_name
JOIN analytics.dim_time t ON DATE(f.departure_time) = t.date
JOIN analytics.dim_flight_status s ON f.status = s.status_name
ORDER BY f.flight_id, f.departure_time DESC -- Necessary when using DISTINCT ON
ON CONFLICT (flight_id) 
DO UPDATE SET 
    status_id = EXCLUDED.status_id,
    passenger_count = EXCLUDED.passenger_count,
    revenue = EXCLUDED.revenue;