# Project Executive Summary

Horizon 360 is a comprehensive Business Intelligence ecosystem designed to optimize RwandAir’s operational efficiency and revenue growth. This project demonstrates a full-stack data engineering and analytics pipeline, transforming raw, fragmented flight data into actionable executive insights.
# The Tech Stack

Python and SQL queries? check them out here:
[Python_and_SQL_queries_for_this_Project](/Data_Architecture%20&%20Fake_Data_Generation/)
- **Data Engineering:** Python (Faker, Pandas) in VS Code for synthetic data generation (2025–2026).

- **Database Management:** PostgreSQL for data warehousing and Star Schema architecture.

- **ETL & Logic:** SQL (Views, Window Functions, and Constraints) for business logic.

- **Analytics & Visualization:** Power BI Desktop (DAX, Machine Learning integration).

# Data Architecture & Governance

To ensure a "Single Source of Truth," I implemented a Star Schema within PostgreSQL. This design minimizes data redundancy and maximizes Power BI performance.
Key Components:

- **Fact Table:** fact_flight_operations (Revenue, Passengers, Fuel, Load Factor).

- **Dimensions:** dim_time, dim_city, dim_flight_status.

- **Data Integrity:** Implemented ON CONFLICT and DISTINCT ON logic to prevent duplicate flight records during the ETL process.

# Strategic Business Insights
This project answers critical questions for RwandAir leadership:
- **Route Profitability:** Identifies high-yield routes by calculating net margin (Revenue - Fuel Cost).

- **Operational Reliability:** Tracks On-Time Performance (OTP) and identifies bottlenecks at specific hubs.

- **Fuel Efficiency:** Visualizes the "Fuel-to-Passenger" ratio to optimize aircraft deployment.

- **Predictive Forecasting:** Utilizes Python-integrated Linear Regression to forecast cargo revenue based on seasonal tonnage trends.
# How to Run the Project
**1. Database Setup:** Run the SQL scripts in the /sql folder to initialize the analytics schema and tables.

 **2. Data Generation:** Execute generate_data.py to populate the PostgreSQL database with flight records from Jan 2025 to Jan 2026.

**3. Analytics:** Open Horizon360_Dashboard.pbix in Power BI and refresh the data source to connect to your local Postgres instance.
# Dashboard Preview
![Dashboard_Page](/Images/Dashboard_Image.png)

[View interactive Dashboard here on the Power BI Desktop](/Power_BI_Dashboard/)

- **Executive Hub:** High-level KPIs for the CEO/CFO.

- **Operational Hub:** Real-time status monitoring for the COO.

- **Commercial Hub:** Route-by-route yield analysis for the Commercial Director.
# Managerial Philosophy
"Data is only as valuable as the decisions it enables. My approach as a BI Manager is to ensure that every dashboard I build directly correlates to a KPI that drives RwandAir’s growth, safety, and customer satisfaction."