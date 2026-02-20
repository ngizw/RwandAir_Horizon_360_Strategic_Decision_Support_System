-- Populate dim_city
INSERT INTO analytics.dim_city (city_name, country)
SELECT DISTINCT departure_city, 'N/A' FROM analytics.flight_operations
UNION
SELECT DISTINCT arrival_city, 'N/A' FROM analytics.flight_operations;

-- Populate dim_time
INSERT INTO analytics.dim_time (date, day, month, quarter, year)
SELECT DISTINCT 
    DATE(departure_time),
    EXTRACT(DAY FROM departure_time),
    EXTRACT(MONTH FROM departure_time),
    EXTRACT(QUARTER FROM departure_time),
    EXTRACT(YEAR FROM departure_time)
FROM analytics.flight_operations;

-- Populate dim_flight_status
INSERT INTO analytics.dim_flight_status (status_name)
SELECT DISTINCT status FROM analytics.flight_operations;
