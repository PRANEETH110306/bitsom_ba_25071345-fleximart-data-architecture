# Part 1: Database Design and ETL Pipeline

## Overview

Part 1 focuses on designing a relational database and building an ETL pipeline to clean and load raw CSV data. It also includes database documentation and SQL queries to answer business questions.

---

## Task 1.1: ETL Pipeline Implementation

### Description
This task involves extracting raw customer, product, and sales data from CSV files, cleaning the data, and loading it into a MySQL database.

### Key Activities
- Read raw CSV files for customers, products, and sales
- Removed duplicate records
- Handled missing values using appropriate strategies
- Standardized phone numbers, product categories, and date formats
- Added surrogate keys using auto-increment columns
- Loaded cleaned data into MySQL tables

### File
- `etl_pipeline.py`
- `data_quality_report.txt`

---

## Task 1.2: Database Schema Documentation

### Description
This task documents the relational database schema and explains table relationships and normalization.

### Key Activities
- Described all entities and their attributes
- Explained relationships between tables
- Justified the design using Third Normal Form (3NF)
- Provided sample data representation in table format

### File
- `schema_documentation.md`

---

## Task 1.3: Business Query Implementation

### Description
This task answers business-related questions using SQL queries on the cleaned database.

### Key Activities
- Customer purchase history analysis
- Product sales analysis by category
- Monthly sales trend analysis
- Used joins, GROUP BY, HAVING, and aggregate functions

### File
- `business_queries.sql`

---

## Outcome

Cleaned data was successfully loaded into a relational database, and meaningful business insights were generated using SQL queries.
