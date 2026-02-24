/*
============================================================================
DDl Script: Create Bronze Tables
============================================================================
Script Purpose:
  This script creates tables in the Bronze Schema, dropping existing tables
  If they already exists.
  Run this script to re-define the DDL structuren of 'Bronze' Tables 
============================================================================
*/

if object_id ('bronze.crm_cust_info', 'U') is not null
	drop table bronze.crm_cust_info;  -- 'U' means user defined table 
go
create table bronze.crm_cust_info(
	cst_id Int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_material_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date date
);
go

-- now create DDL script for all CSV files 
-- DDL script for CSV = CREATE TABLE statement that matches CSV structure
if object_id ('bronze.crm_prd_info', 'U') is not null
	drop table bronze.crm_prd_info;
go
create table bronze.crm_prd_info(
prd_id int,
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost int,
prd_line nvarchar(50),
prd_start_dt datetime,
prd_end_dt datetime
);
go

if object_id ('bronze.crm_sales_details', 'U') is not null
	drop table bronze.crm_sales_details;
go
create table bronze.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);
go

if object_id ('bronze.erp_loc_a101', 'U') is not null
	drop table bronze.erp_loc_a101;
go
create table bronze.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50)
);
go

if object_id ('bronze.erp_cust_az12', 'U') is not null
	drop table bronze.erp_cust_az12;
go
create table bronze.erp_cust_az12(
cid nvarchar(50),
bdate date,
gen nvarchar(50)
);
go

if object_id ('bronze.erp_px_cat_g1v2', 'U') is not null
	drop table bronze.erp_px_cat_g1v2;
go
create table bronze.erp_px_cat_g1v2(
id nvarchar(50),
cat nvarchar(50),
subcat nvarchar(50),
maintenance nvarchar(50)
);
go

