CREATE TABLE analytics.fact_flight_operations (
    flight_id UUID PRIMARY KEY,
    flight_no VARCHAR(10),
    departure_city_id INT REFERENCES analytics.dim_city(city_id),
    arrival_city_id INT REFERENCES analytics.dim_city(city_id),
    time_id INT REFERENCES analytics.dim_time(time_id),
    status_id INT REFERENCES analytics.dim_flight_status(status_id),
    passenger_count INT,
    revenue NUMERIC(12,2),
    fuel_cost NUMERIC(12,2),
    load_factor NUMERIC(5,2)
);


SELECT * FROM fact_flight_operations;
SELECT * FROM dim_city;
SELECT * FROM dim_time;
SELECT * FROM dim_flight_status;
SELECT * FROM fact_flight_operations;