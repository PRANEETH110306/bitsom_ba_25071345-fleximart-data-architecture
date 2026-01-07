# FlexiMart Data Architecture Project

**Student Name:** A Praneeth    
**Student ID:** bitsom_ba_25071345    
**Email:** praneethpark@gmail.com    
**Date:** 07/01/2026    

## Project Overview

This project implements an end-to-end data architecture solution starting from raw CSV files to analytical reporting. It includes building an ETL pipeline, designing a relational database, performing NoSQL analysis using MongoDB, and creating a data warehouse with a star schema for OLAP analytics.

## Repository Structure    
├── part1-database-etl/    
│   ├── etl_pipeline.py    
│   ├── schema_documentation.md    
│   ├── business_queries.sql    
│   └── data_quality_report.txt    
├── part2-nosql/    
│   ├── nosql_analysis.md    
│   ├── mongodb_operations.js    
│   └── products_catalog.json    
├── part3-datawarehouse/    
│   ├── star_schema_design.md    
│   ├── warehouse_schema.sql    
│   ├── warehouse_data.sql    
│   └── analytics_queries.sql    
└── README.md    

## Technologies Used

- Python 3.x, pandas, mysql-connector-python
- MySQL 8.0 / PostgreSQL 14
- MongoDB 6.0

## Setup Instructions

### Database Setup

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js
```

## Key Learnings

Through this project, I learned how to build ETL pipelines for cleaning and transforming raw data. I gained practical experience in relational database design and dimensional data modeling using a star schema. I also understood how NoSQL databases support flexible and semi-structured data using MongoDB. Additionally, I learned how OLAP queries help in analyzing business performance and identifying sales trends.

This practical was very helpful and informative. Although the implementation was challenging at times, it was interesting and improved my understanding of real-world data engineering concepts. I particularly enjoyed working with MySQL and am interested in doing more practical work using it.


## Challenges Faced

## Challenges Faced

1. During Task 1, handling duplicate and missing values was challenging, as both were initially being counted together. This was resolved by separating the logic for identifying duplicate records and records removed due to missing mandatory fields. Additionally, writing sample data representation using a Markdown (.md) file was new to me and required extra attention to formatting. Another issue faced was that the `order_items` table remained empty initially, which was later fixed by correcting the data insertion logic.

2. In Task 2, setting up MongoDB was a challenge as it had to be downloaded and configured again. Understanding how to run MongoDB operations using the provided sample JSON data took some time, but it helped me understand NoSQL concepts better.

3. In Task 3, designing the Star Schema and writing OLAP analytical queries was difficult as I was doing these practicals after a long gap. The queries required multiple checks and executions to ensure correct grouping and accurate results. Re-running the queries several times helped me gain confidence and a better understanding of data warehouse analytics.

