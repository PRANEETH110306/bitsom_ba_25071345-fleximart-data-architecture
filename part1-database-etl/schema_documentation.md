# **Entity–Relationship Description:**

### **ENTITY: customers**

**Purpose:**
Stores customer personal and contact information required for order processing and analysis.

**Attributes:**
1. **customer_id (Primary Key):** Unique identifier for each customer
2. **first_name:** Customer’s first name
3. **last_name:** Customer’s last name
4. **email:** Email address of customer, which is unique and every customer has different email.
5. **phone:** Customer phone number
6. **city:** City of residence
7. **registration_date:** Date when the customer registered

**Relationships:**
- One customer can place many orders
- Relationship: customers (1) → orders (M)


### **ENTITY: products**

**Purpose:**
Stores product details available for sale in FlexiMart.

**Attributes:**
1. **product_id (Primary Key):** Unique identifier for each product
2. **product_name:** Name of the product
3. **category:** Product category/ type of product. Like- Electronics, fashion etc..
4. **price:** Selling price of the product
5. **stock_quantity:** Available stock

**Relationships:**
- One product can appear in many order items
- Relationship: products (1) → order_items (M)


### **ENTITY: orders**

**Purpose:**
Stores high-level order transaction information.

**Attributes:**
1. **order_id (Primary Key):** Unique identifier for each order
2. **customer_id (Foriegn Key):** Referred to customers.customer_id, and connects to customer table.
3. **order_date:** Date when the order was placed
4. **total_amount:** Total value of the order
5. **status:** Order status (Completed, Pending, etc.)

**Relationships:**
- One order belongs to one customer
- One order can have many order items

**Example:**
- customers (1) → orders (M)
- orders (1) → order_items (M)


### **ENTITY: order_items**

**Purpose:**
Stores detailed line-item information for each order.

**Attributes:**
1. **order_item_id (Primary Key):** Unique identifier for each order line
2. **order_id (Foreign Key):** Referred to orders.order_id, and connects to order table.
3. **product_id (Foreign Key):** Referred to products.product_id and connect to product table.
4. **quantity:** Number of units ordered
5. **unit_price:** Price per unit at time of sale
6. **subtotal:** Calculated as quantity × unit_price

**Relationships:**
- Each order item is linked to one order and one product


# **Normalization Explanation (Third Normal Form – 3NF):**

The FlexiMart database is designed in Third Normal Form (3NF) to reduce data redundancy and maintain data consistency. Each table stores data related to a single entity, and all non-key attributes depend only on the primary key.

In the customers table, details such as email, phone, and city depend only on customer_id. There are no partial dependencies because the primary key is a single attribute. There are also no transitive dependencies, since non-key attributes do not depend on other non-key attributes.

The products table contains only product-related information, which avoids repeating product details in multiple places. The orders table separates order information from customer data, reducing duplication and improving clarity.

The order_items table resolves the many-to-many relationship between orders and products by storing line-level details. This design prevents update anomalies (price changes are handled in one place), insert anomalies (customers and products can exist without orders), and delete anomalies (deleting an order does not remove customer or product data).


# **Sample Data Representation:**

### **Customers table:**

| customer_id | first_name | last_name | email                                                   | phone          | city      | registration_date |
| ----------- | ---------- | --------- | ------------------------------------------------------- | -------------- | --------- | ----------------- |
| C001        | Rahul      | Sharma    | [rahul.sharma@gmail.com](mailto:rahul.sharma@gmail.com) | 9876543210     | Bangalore | 2023-01-15        |
| C002        | Priya      | Patel     | [priya.patel@yahoo.com](mailto:priya.patel@yahoo.com)   | +91-9988776655 | Mumbai    | 2023-02-20        |


### **Products table:**

| product_id | product_name       | category    | price    | stock_quantity |
| ---------- | ------------------ | ----------- | -------- | -------------- |
| P001       | Samsung Galaxy S21 | Electronics | 45999.00 | 150            |
| P002       | Nike Running Shoes | Fashion     | 3499.00  | 80             |

