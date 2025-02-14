/* 
SCD Type 2 Implementation 
We need to alter the schema to support SCD Type 2
*/

-- Customer Dimension Table

ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.customer_dim`
ADD COLUMN Start_Date DATE,
ADD COLUMN End_Date DATE,
ADD COLUMN Is_Current BOOLEAN;

-- To Add a default value for an existing table
ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.customer_dim` ADD COLUMN Is_Current BOOLEAN;
ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.customer_dim` ALTER COLUMN Is_Current SET DEFAULT TRUE; 
UPDATE `omega-baton-449316-p5.retail_sales_dataset.customer_dim` SET Is_Current = TRUE WHERE TRUE;


-- Product Dimension Table

ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.product_dim` 
ADD COLUMN Start_Date DATE,
ADD COLUMN End_Date DATE;

ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.product_dim`  ADD COLUMN Is_Current BOOLEAN;
ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.product_dim`  ALTER COLUMN Is_Current SET DEFAULT TRUE; 
UPDATE `omega-baton-449316-p5.retail_sales_dataset.product_dim` SET Is_Current = TRUE WHERE TRUE;


-- Store Dimension Table

ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.store_dim` 
ADD COLUMN Start_Date DATE,
ADD COLUMN End_Date DATE;

ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.store_dim`   ADD COLUMN Is_Current BOOLEAN;
ALTER TABLE `omega-baton-449316-p5.retail_sales_dataset.store_dim`  ALTER COLUMN Is_Current SET DEFAULT TRUE; 
UPDATE `omega-baton-449316-p5.retail_sales_dataset.store_dim`  SET Is_Current = TRUE WHERE TRUE;
