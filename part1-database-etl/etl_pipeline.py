import pandas as pd
import mysql.connector
import re

def clean_phone(phone):
    if pd.isna(phone):
        return None
    digits = re.sub(r"\D", "", str(phone))
    if len(digits) == 10:
        return "+91-" + digits
    return None


report_lines = []

# ---------------- DATABASE CONFIG ----------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "root",      # put your password if any
    "database": "fleximart"
}

# ---------------- READ CSV FILES ----------------
customers = pd.read_csv("customers_raw.csv")
products = pd.read_csv("products_raw.csv")
sales = pd.read_csv("sales_raw.csv")

report_lines.append(f"Customers records read: {len(customers)}")
report_lines.append(f"Products records read: {len(products)}")
report_lines.append(f"Sales records read: {len(sales)}")

# ---------------- CLEAN COLUMN NAMES ----------------
customers.columns = customers.columns.str.lower().str.strip()
products.columns = products.columns.str.lower().str.strip()
sales.columns = sales.columns.str.lower().str.strip()

# ---------------- TRANSFORM: CUSTOMERS ----------------

# Count total records before cleaning
customers_total = len(customers)

# Count duplicate records (based on customer_id) BEFORE removing anything
customer_duplicate_count = customers.duplicated(subset="customer_id").sum()

# Count records with missing mandatory fields BEFORE removing anything
missing_mandatory_count = customers[
    customers[["first_name", "last_name", "email"]].isnull().any(axis=1)
].shape[0]

# Remove identified duplicate records
customers = customers.drop_duplicates(subset="customer_id")

# Remove records with missing mandatory fields
customers = customers.dropna(subset=["first_name", "last_name", "email"])

# Phone formatting
customers["phone"] = customers["phone"].apply(clean_phone)

# Date formatting
customers["registration_date"] = pd.to_datetime(
    customers["registration_date"], errors="coerce"
).dt.strftime("%Y-%m-%d")

# Convert NaN to None for MySQL
customers = customers.where(pd.notna(customers), None)

# ---------------- REPORT LINES FOR CUSTOMERS TABLE----------------
report_lines.append(f"Customer duplicate records identified: {customer_duplicate_count}")
report_lines.append(
    f"Customer records removed due to missing mandatory fields: {missing_mandatory_count}"
)
report_lines.append(
    f"Customer records removed during cleaning (total): "
    f"{customer_duplicate_count + missing_mandatory_count}"
)

# ---------------- TRANSFORM: PRODUCTS ----------------

# Remove duplicates
before = len(products)
products.drop_duplicates(subset="product_name", inplace=True)
after = len(products)
report_lines.append(f"Product duplicates removed: {before - after}")

# Standardize category
products["category"] = products["category"].str.title()

# Handle missing values
products["price"] = products["price"].fillna(products["price"].median())
products["stock_quantity"] = products["stock_quantity"].fillna(0)

products = products.where(pd.notna(products), None)

# ---------------- TRANSFORM: SALES ----------------

# Convert date
sales["transaction_date"] = pd.to_datetime(
    sales["transaction_date"], errors="coerce"
).dt.strftime("%Y-%m-%d")

# Remove rows with missing important values
sales.dropna(subset=["customer_id", "product_id", "transaction_date"], inplace=True)

# ---------------- LOAD INTO DATABASE ----------------
conn = mysql.connector.connect(**DB_CONFIG)
cursor = conn.cursor()

# Insert customers
for _, row in customers.iterrows():
    cursor.execute("""
        INSERT INTO customers (customer_id, first_name, last_name, email, phone, city, registration_date)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, tuple(row))

# Insert products
for _, row in products.iterrows():
    cursor.execute("""
        INSERT INTO products (product_id, product_name, category, price, stock_quantity)
        VALUES (%s, %s, %s, %s, %s)
    """, tuple(row))

# Insert into orders table
for _, row in sales.iterrows():
    cursor.execute("""
        INSERT INTO orders (customer_id, order_date, total_amount, status)
        VALUES (%s, %s, %s, %s)
    """, (
        row["customer_id"],
        row["transaction_date"],
        row["quantity"] * row["unit_price"],
        row["status"]
    ))

    # Get generated order_id
    order_id = cursor.lastrowid

    # Insert into order_items table
    cursor.execute("""
        INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal)
        VALUES (%s, %s, %s, %s, %s)
    """, (
        order_id,
        row["product_id"],
        row["quantity"],
        row["unit_price"],
        row["quantity"] * row["unit_price"]
    ))




conn.commit()
cursor.close()
conn.close()

report_lines.append("Data loaded successfully into database.")

with open("data_quality_report.txt", "w") as f:
    for line in report_lines:
        f.write(line + "\n")

print("ETL completed successfully.")
