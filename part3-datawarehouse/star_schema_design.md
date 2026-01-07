# Star Schema Design – Data Warehouse

## Section 1: Schema Overview

The data warehouse is designed using a **star schema** to analyze historical sales data efficiently. The central table is the fact table, surrounded by multiple dimension tables.

### FACT TABLE: fact_sales

**Grain:**  
One row per product per order line item.

**Business Process:**  
Sales transactions.

**Measures (Numeric Facts):**
- quantity_sold: Number of units sold for a product in a transaction.
- unit_price: Price per unit at the time of sale.
- discount_amount: Discount applied to the transaction.
- total_amount: Final sale amount calculated as (quantity_sold × unit_price − discount).

**Foreign Keys:**
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

---

### DIMENSION TABLE: dim_date

**Purpose:**  
Stores date-related information to support time-based analysis.

**Type:**  
Conformed dimension.

**Attributes:**
- **date_key (Primary Key):** Surrogate key in YYYYMMDD format.
- **full_date:** Actual calendar date.
- **day_of_week:** Name of the day (Monday, Tuesday, etc.).
- **month:** Month number (1–12).
- **month_name:** Name of the month.
- **quarter:** Quarter of the year (Q1–Q4).
- **year:** Calendar year.
- **is_weekend:** Indicates whether the date is a weekend.

---

### DIMENSION TABLE: dim_product

**Purpose:**  
Stores product-related descriptive information.

**Attributes:**
- **product_key (Primary Key):** Surrogate key for products.
- **product_id:** Original product identifier from source system.
- **product_name:** Name of the product.
- **category:** High-level product category.
- **subcategory:** Sub-category of the product.
- **unit_price:** Standard price of the product.

---

### DIMENSION TABLE: dim_customer

**Purpose:**  
Stores customer-related information for customer analysis.

**Attributes:**
- **customer_key (Primary Key):** Surrogate key for customers.
- **customer_id:** Original customer identifier from source system.
- **customer_name:** Full name of the customer.
- **city:** City of residence.
- **state:** State of residence.
- **customer_segment:** Classification such as High, Medium, or Low value.

---

## Section 2: Design Decisions

## Section 2: Design Decisions

### Why you chose this granularity (transaction line-item level)

The data warehouse uses transaction line-item level granularity because it captures sales data at the most detailed level. Each record represents one product sold in an order, which helps in accurately analyzing quantities sold, pricing, and discounts. This level of detail makes it easier to analyze sales by product, customer, and date. It also allows the data to be aggregated later for monthly, quarterly, or yearly reports without losing important information.

---

### Why surrogate keys instead of natural keys

Surrogate keys are used instead of natural keys to ensure consistency and better performance. Natural keys such as product IDs or customer IDs can change over time or may not be unique across different systems. Surrogate keys are system-generated and do not change, which makes joins between tables faster and more reliable. They also help in maintaining historical data even if source system values are updated.

---

### How this design supports drill-down and roll-up operations

This star schema design supports drill-down and roll-up operations by separating facts and dimensions clearly. Users can roll up sales data from daily to monthly or yearly levels using the date dimension. Similarly, they can drill down from category-level sales to individual products using the product dimension. This structure makes analytical reporting and OLAP queries simple and efficient.


---

## Section 3: Sample Data Flow

**Given Data,**

### Source Transaction
Order ID: 101  
Customer: John Doe  
Product: Laptop  
Quantity: 2  
Unit Price: 50,000  

### Data Warehouse
date_key: 20240115  
product_key: 5  
customer_key: 12    
quantity_sold: 2    
unit_price: 50000   
total_amount: 100000 

- dim_date: {date_key: 20240115, full_date: '2024-01-15', month: 1, quarter: 'Q1'...}
- dim_product: {product_key: 5, product_name: 'Laptop', category: 'Electronics'...}
- dim_customer: {customer_key: 12, customer_name: 'John Doe', city: 'Mumbai'...}

---

### Data Warehouse Representation
---
**fact_sales**  
{   
date_key: 20240115, 
product_key: 5, 
customer_key: 12,   
quantity_sold: 2,   
unit_price: 50000,  
discount_amount: 0, 
total_amount: 100000    
}
---
---
**dim_date**    
{   
date_key: 20240115, 
full_date: '2024-01-15',    
day_of_week: 'Monday',  
month: 1,   
month_name: 'January',  
quarter: 'Q1',  
year: 2024, 
is_weekend: false   
} 
---
---
**dim_product**     
{   
product_key: 5,     
product_name: 'Laptop',  
category: 'Electronics',    
subcategory: 'Computers',   
unit_price: 50000   
}   
---
---
**dim_customer**    
{   
customer_key: 12,   
customer_name: 'John Doe',  
city: 'Mumbai',     
state: 'Maharashtra',   
customer_segment: 'High Value'  
}   
---

This example shows how one sales transaction is broken into dimensions and measures, enabling efficient analysis across time, product, and customer dimensions.
