# Part 3: Data Warehouse and Analytics

## Overview

Part 3 focuses on building a data warehouse using a star schema and performing OLAP analytics to analyze historical sales data.

---

## Task 3.1: Star Schema Design Documentation

### Description
This task documents the design of a star schema for sales analytics.

### Key Activities
- Defined fact and dimension tables
- Explained granularity and business process
- Justified design decisions such as surrogate keys
- Demonstrated sample data flow from source to warehouse

### File
- `star_schema_design.md`

---

## Task 3.2: Star Schema Implementation

### Description
This task implements the star schema in a MySQL data warehouse and loads sample data.

### Key Activities
- Created dimension and fact tables
- Inserted realistic sample data
- Ensured foreign key relationships
- Verified minimum data requirements

### Files
- `warehouse_schema.sql`
- `warehouse_data.sql`

---

## Task 3.3: OLAP Analytics Queries

### Description
This task performs analytical queries on the data warehouse to support business decision-making.

### Key Activities
- Monthly sales drill-down analysis
- Product performance analysis
- Customer segmentation analysis
- Used GROUP BY, CASE statements, and window functions

### File
- `analytics_queries.sql`

---

## Outcome

A fully functional data warehouse was created, enabling advanced analytical queries and business insights.

