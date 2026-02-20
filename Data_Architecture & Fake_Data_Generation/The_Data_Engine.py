import pandas as pd
from faker import Faker
import random
from sqlalchemy import create_engine, text
from datetime import datetime, date

# Initialize Faker
fake = Faker()

# Connect to PostgreSQL
engine = create_engine(
    "postgresql+psycopg2://sql_course:Abajura20%40@127.0.0.1:5432/rwandair_db"
)

# Ensure schemas exist
with engine.begin() as conn:
    conn.execute(text("CREATE SCHEMA IF NOT EXISTS analytics;"))
    conn.execute(text("CREATE TABLE IF NOT EXISTS analytics.load_log ("
                      "id SERIAL PRIMARY KEY, "
                      "table_name TEXT, "
                      "rows_inserted INT, "
                      "load_timestamp TIMESTAMP);"))

def generate_airline_data(records=3000): # Increased records for better year-long coverage
    flights = []
    # Set the range: Jan 1, 2025 to Today (Jan 2026)
    start_date = datetime(2025, 1, 1)
    end_date = datetime.now()

    for _ in range(records):
        # Generate random date between start and end
        departure_time = fake.date_time_between(start_date=start_date, end_date=end_date)
        
        # Add a bit of "logic" - Weekends and holidays often have higher revenue/passengers
        is_weekend = departure_time.weekday() >= 5
        passenger_multiplier = 1.2 if is_weekend else 1.0

        flights.append({
            "flight_id": fake.uuid4(),
            "flight_no": f"WB{random.randint(100, 999)}",
            "departure_city": random.choice(["Kigali", "Nairobi", "Dubai", "London", "Johannesburg"]),
            "arrival_city": random.choice(["Brussels", "Lagos", "Mumbai", "Kigali", "Guangzhou"]),
            "departure_time": departure_time,
            "status": random.choice(["On-Time", "Delayed", "Cancelled"]),
            "passenger_count": int(random.randint(50, 250) * passenger_multiplier),
            "revenue": random.uniform(5000, 50000) * passenger_multiplier,
            "fuel_cost": random.uniform(2000, 15000),
            "load_factor": random.uniform(0.6, 0.98),
            # Managerial additions:
            "cargo_weight_kg": random.uniform(500, 10000),
            "passenger_satisfaction": random.randint(1, 5)
        })
    return pd.DataFrame(flights)

# Generate records
df = generate_airline_data(5000) # 5000 records gives a nice density for a full year

# Push to PostgreSQL
df.to_sql(
    name="flight_operations",
    con=engine,
    schema="analytics",
    if_exists="replace",
    index=False
)

# Logging the load
rows_inserted = len(df)
timestamp = datetime.now()

with engine.begin() as conn:
    conn.execute(
        text("INSERT INTO analytics.load_log (table_name, rows_inserted, load_timestamp) "
             "VALUES (:table_name, :rows_inserted, :timestamp)"),
        {"table_name": "flight_operations", "rows_inserted": rows_inserted, "timestamp": timestamp}
    )

print(f"✅ {rows_inserted} rows from 2025 to 2026 successfully pushed!")




