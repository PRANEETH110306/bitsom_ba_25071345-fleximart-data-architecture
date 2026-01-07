-- dim dates
INSERT INTO dim_date VALUES
-- January dates
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),

-- February dates
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false);


-- dim product
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop Pro','Electronics','Computers',50000),
('P002','Smartphone X','Electronics','Mobiles',30000),
('P003','Bluetooth Headset','Electronics','Accessories',3000),
('P004','LED TV','Electronics','Television',60000),
('P005','Wireless Mouse','Electronics','Accessories',800),

('P006','Running Shoes','Fashion','Footwear',4000),
('P007','Jeans','Fashion','Clothing',2500),
('P008','Jacket','Fashion','Clothing',6000),
('P009','Sneakers','Fashion','Footwear',5500),
('P010','T-Shirt','Fashion','Clothing',1200),

('P011','Rice 5kg','Groceries','Food',600),
('P012','Wheat Flour','Groceries','Food',450),
('P013','Cooking Oil','Groceries','Essentials',1200),
('P014','Sugar','Groceries','Food',300),
('P015','Tea Powder','Groceries','Beverages',500);


-- dim customer
INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Bangalore','Karnataka','High Value'),
('C002','Priya Patel','Mumbai','Maharashtra','Medium Value'),
('C003','Amit Kumar','Delhi','Delhi','Low Value'),
('C004','Sneha Reddy','Hyderabad','Telangana','Medium Value'),
('C005','Vikram Singh','Chennai','Tamil Nadu','High Value'),
('C006','Anjali Mehta','Mumbai','Maharashtra','Medium Value'),
('C007','Ravi Verma','Delhi','Delhi','Low Value'),
('C008','Pooja Iyer','Bangalore','Karnataka','Medium Value'),
('C009','Karthik Nair','Kochi','Kerala','Low Value'),
('C010','Deepa Gupta','Delhi','Delhi','High Value'),
('C011','Arjun Rao','Hyderabad','Telangana','Medium Value'),
('C012','Lakshmi Krishnan','Chennai','Tamil Nadu','Low Value');


-- fact sales
INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount) VALUES

-- data according to January
(20240101,1,1,2,50000,0,100000),
(20240102,2,2,1,30000,0,30000),
(20240103,3,3,3,3500,0,10500),
(20240104,4,4,1,60000,5000,55000),
(20240105,5,5,4,900,0,3600),
(20240106,6,6,2,4000,0,8000),
(20240107,7,7,1,2500,0,2500),
(20240108,8,8,1,6000,0,6000),
(20240109,9,9,2,5500,0,11000),
(20240110,10,10,3,1200,0,3600),
(20240111,11,11,5,600,0,3000),
(20240112,12,12,2,450,0,900),
(20240113,13,1,1,1200,0,1200),
(20240114,14,2,4,300,0,1200),
(20240115,15,3,2,500,0,1000),
(20240106,1,4,1,50000,0,50000),
(20240107,2,5,2,30000,0,60000),
(20240108,3,6,3,3500,0,10500),
(20240109,4,7,1,60000,0,60000),
(20240110,5,8,5,900,0,4500),

-- data according to February
(20240201,6,9,2,4000,0,8000),
(20240202,7,10,1,2500,0,2500),
(20240203,8,11,2,6000,0,12000),
(20240204,9,12,1,5500,0,5500),
(20240205,10,1,3,1200,0,3600),
(20240206,11,2,4,600,0,2400),
(20240207,12,3,2,450,0,900),
(20240208,13,4,1,1200,0,1200),
(20240209,14,5,3,300,0,900),
(20240210,15,6,2,500,0,1000),
(20240211,1,7,1,50000,0,50000),
(20240212,2,8,2,30000,0,60000),
(20240213,3,9,3,3500,0,10500),
(20240214,4,10,1,60000,0,60000),
(20240215,5,11,4,900,0,3600),
(20240206,6,12,2,4000,0,8000),
(20240207,7,1,1,2500,0,2500),
(20240208,8,2,1,6000,0,6000),
(20240209,9,3,2,5500,0,11000),
(20240210,10,4,3,1200,0,3600);

