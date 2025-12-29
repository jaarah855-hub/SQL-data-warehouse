# Data Dictionary — Gold Layer

## Overview
The Gold Layer represents business-level data, structured to support analytical and reporting use cases.  
It consists of dimension tables and fact tables for specific business metrics.

---

## 1. gold.dim_customers

**Purpose**  
Stores customer details enriched with demographic and geographic data.

| Column Name | Data Type | Description |
|------------|----------|-------------|
| customer_key | INT | Surrogate key uniquely identifying each customer record in the dimension table |
| customer_id | INT | Unique numerical identifier assigned to each customer |
| customer_number | NVARCHAR(50) | Alphanumeric identifier used for tracking and referencing |
| first_name | NVARCHAR(50) | Customer’s first name as recorded in the system |
| last_name | NVARCHAR(50) | Customer’s last name or family name |
| country | NVARCHAR(50) | Customer’s country of residence (e.g., Australia) |
| marital_status | NVARCHAR(50) | Customer’s marital status (e.g., Married, Single) |
| gender | NVARCHAR(50) | Customer’s gender (e.g., Male, Female, n/a) |
| birthdate | DATE | Customer’s date of birth (YYYY-MM-DD format) |
| create_date | DATE | Date when the customer record was created in the system |

---

## 2. gold.dim_products

**Purpose**  
Provides information about products and their attributes.

| Column Name | Data Type | Description |
|------------|----------|-------------|
| product_key | INT | Surrogate key uniquely identifying each product record |
| product_id | INT | Unique identifier assigned to the product |
| product_number | NVARCHAR(50) | Alphanumeric product code used for categorization |
| product_name | NVARCHAR(50) | Descriptive product name (type, color, size) |
| category_id | NVARCHAR(50) | Identifier linking the product to its category |
| category | NVARCHAR(50) | High-level product classification (e.g., Bikes, Components) |
| subcategory | NVARCHAR(50) | Detailed product classification within the category |
| maintenance_required | NVARCHAR(50) | Indicates whether maintenance is required (Yes / No) |
| cost | INT | Base cost of the product |
| product_line | NVARCHAR(50) | Product line or series (e.g., Road, Mountain) |
| start_date | DATE | Date when the product became available |

---

## 3. gold.fact_sales

**Purpose**  
Stores transactional sales data for analytical purposes.

| Column Name | Data Type | Description |
|------------|----------|-------------|
| order_number | NVARCHAR(50) | Unique identifier for each sales order (e.g., SOS4496) |
| product_key | INT | Surrogate key linking to the product dimension |
| customer_key | INT | Surrogate key linking to the customer dimension |
| order_date | DATE | Date the order was placed |
| shipping_date | DATE | Date the order was shipped |
| due_date | DATE | Date when payment was due |
| sales_amount | INT | Total sale amount for the line item |
| quantity | INT | Number of units ordered |
| price | INT | Price per unit |
