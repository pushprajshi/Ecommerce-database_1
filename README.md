# E-commerce Database (PostgreSQL)

This repository contains the SQL schema and sample data for an **E-commerce Database** built with PostgreSQL.  
It is designed for learning, practice, and small projects related to database management.

---

# Project File
- **Ecommerce.Database.sql** → Includes schema (tables, sequences, constraints) and sample records.

---

# Database Structure

  # 1. Customers
    Stores customer details.  
    - customer_id (PK)  
    - name  
    - email (Unique)  
    - phone  
    - city  

  # 2. Products
    Stores product information.  
    - product_id (PK)  
    - product_name  
    - price  
    - stock  

  # 3. Orders
    Stores order details.  
    - order_id (PK)  
    - customer_id (FK → customers)  
    - order_date  

  # 4. Order_Items
    Stores items included in each order.  
    - order_item_id (PK)  
    - order_id (FK → orders)  
    - product_id (FK → products)  
    - quantity  

  # 5. Payments
    Stores payment records for orders.  
    - payment_id (PK)  
    - order_id (FK → orders)  
    - amount  
    - payment_date  
    - method  

---

#  Relationships
- A **customer** can place many **orders**.  
- An **order** can include multiple **products** through **order_items**.  
- A **payment** is linked to an **order**.  

---

##  How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/Ecommerce-Database.git
2. ER Diagram:
   ```bash
    https://docs.google.com/document/d/16Cd9CblzkZkDc99vCblXhMCTWbnQmY9dvI_efS45E7c/edit?usp=sharing
