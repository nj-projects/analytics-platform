# Analytics Platform (Polyglot Monorepo)

A production-style analytics platform built with Java, Python, Rust, SQL, and Power BI.

This project demonstrates real-world system design, data engineering,
backend development, and performance-aware service decomposition.

## 🚀 Tech Stack

- **Java (Spring Boot)** – Business logic & REST APIs
- **Python** – Data ingestion and ETL
- **Rust** – High-performance metrics processing
- **PostgreSQL** – System of record & analytics
- **Streamlit** – Internal dashboard
- **Power BI** – Business intelligence & reporting
- **Docker Compose** – Local orchestration
## 🧠 Architecture Overview

The system is centered around PostgreSQL as a shared data contract.

- Python ETL ingests and normalizes raw data
- Java handles order workflows and validation
- Rust performs concurrent, performance-critical calculations
- Power BI and Streamlit consume analytics via SQL and APIs

Each service is independently buildable and integrated via Docker Compose.
