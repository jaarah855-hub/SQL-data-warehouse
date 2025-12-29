/*
============================================================
DDL Script: Create Gold Views
============================================================

Script Purpose:
This script creates views for the Gold layer in the data warehouse.
The Gold layer represents the final dimension and fact tables (Star Schema)

Each view performs transformations and combines data from the Silver layer
to produce a clean, enriched, and business-ready dataset.

Usage:

    - These views can be queried directly for analytics and reporting.
============================================================
*/

-- ============================================================
-- Create Dimension: gold.dim_customers
-- ============================================================
IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
   DROP VIEW gold.dim_customers;
GO
create view gold.dim_customers as 
SELECT
    row_number() over (order by cst_id) as customer_key,
    ci.cst_id as customer_id,
    ci.cst_key as customer_number,
    ci.cst_first_name,
    ci.cst_last_name,
    ci.cst_material_status as marital_status, 
    case when ci.cst_gndr != 'n/a' then ci.cst_gndr
         else coalesce(ca.gen, 'n/a')
    end as new_gen,
    ca.bdate as birthdate,
    ci.cst_create_date as create_date,
    la.cntry as country
FROM silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
on ci.cst_key = ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key = la.cid
