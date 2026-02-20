-- City Dimension
CREATE TABLE analytics.dim_city (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(100),
    country VARCHAR(100)
);

-- Time Dimension
CREATE TABLE analytics.dim_time (
    time_id SERIAL PRIMARY KEY,
    date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT
);

-- Flight Status Dimension
CREATE TABLE analytics.dim_flight_status (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(50)
);
