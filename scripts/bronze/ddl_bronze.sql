CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;

 
DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
	cst_id int,
    cst_key VARCHAR(50),
    cst_first_name VARCHAR(50),
    cst_last_name VARCHAR(50),
    cst_material_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE
);

DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
	prd_id int,
	prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost int,
    prd_line VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);

DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id int,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales int,
    sls_quantity int,
    sls_price int
);    

DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12(
    cust_cid VARCHAR(50),
    cust_bdate DATE,
    cust_gen VARCHAR(50)
);    
    
DROP TABLE IF EXISTS  bronze.erp_loc_a101;  
CREATE TABLE bronze.erp_loc_a101(
    loc_a101_cid VARCHAR(50),
    loc_a101_cntry VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
	 px_cat_g1v2_id VARCHAR(50),
     px_cat_g1v2_cat VARCHAR(50),
     px_cat_g1v2_subcat VARCHAR(50),
     px_cat_g1v2_maintenance VARCHAR(50)
);     




TRUNCATE TABLE bronze.crm_cust_info  ;
LOAD DATA LOCAL INFILE '/Users/malindualwis/Documents/DATA WAREHOUSE/DATASETS/crm_/cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWs(
	cst_id,
    cst_key,
    cst_first_name,
    cst_last_name,
    cst_material_status,
    cst_gndr ,
    cst_create_date 
);    

TRUNCATE TABLE bronze.crm_prd_info;
LOAD DATA LOCAL INFILE'/Users/malindualwis/Documents/DATA WAREHOUSE/DATASETS/crm_/prd_info.csv'
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
	prd_id,
	prd_key,
    prd_nm ,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt 
);    


TRUNCATE TABLE bronze.crm_sales_details;
LOAD DATA LOCAL INFILE'/Users/malindualwis/Documents/DATA WAREHOUSE/DATASETS/crm_/sales_details.csv'
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS(
	    sls_ord_num ,
    sls_prd_key ,
    sls_cust_id ,
    sls_order_dt ,
    sls_ship_dt ,
    sls_due_dt ,
    sls_sales ,
    sls_quantity ,
    sls_price 
);    


TRUNCATE TABLE bronze.erp_cust_az12;
LOAD DATA LOCAL INFILE'/Users/malindualwis/Documents/DATA WAREHOUSE/DATASETS/erp_/cust_az12.csv'
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS  (
	 cust_cid ,
    cust_bdate ,
    cust_gen 
);

TRUNCATE TABLE bronze.erp_loc_a101;
LOAD DATA LOCAL INFILE '/Users/malindualwis/Documents/DATA WAREHOUSE/DATASETS/erp_/loc_a101.csv'
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
	loc_a101_cid ,
    loc_a101_cntry 
);
SELECT * FROM bronze.erp_loc_a101;

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE '/Users/malindualwis/Documents/DATA WAREHOUSE/DATASETS/erp_/px_cat_g1v2.csv'
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY'\n'
IGNORE 1 ROWS (
	px_cat_g1v2_id ,
     px_cat_g1v2_cat ,
     px_cat_g1v2_subcat ,
     px_cat_g1v2_maintenance 
);
