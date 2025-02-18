/* 
    SCD Type 2 for Customer Dimension
*/

MERGE INTO
  `omega-baton-449316-p5.retail_sales_dataset.customer_dim` custDim
USING
  `omega-baton-449316-p5.staging.staging_customer` newCust
ON
  custDim.CustomerID = newCust.CustomerID AND
  custDim.Start_Date < newCust.Start_Date AND
  custDim.End_Date IS NULL
  WHEN MATCHED THEN 
  UPDATE SET custDim.Customer_FirstName = newCust.Customer_FirstName, custDim.Customer_LastName = newCust.Customer_LastName, custDim.Customer_Email = newCust.Customer_Email, custDim.Customer_Age = newCust.Customer_Age, custDim.Customer_Gender = newCust.Customer_Gender, custDim.Start_Date = custDim.Start_Date, custDim.End_Date = newCust.Start_Date, custDim.Is_Current = FALSE;


MERGE INTO
  `omega-baton-449316-p5.retail_sales_dataset.customer_dim` custDim
USING
  `omega-baton-449316-p5.staging.staging_customer` newCust
ON
  custDim.CustomerID = newCust.CustomerID AND
  custDim.End_Date IS NULL
  WHEN NOT MATCHED THEN
INSERT
  ( Customer_SK,
    CustomerID,
    Customer_FirstName,
    Customer_LastName,
    Customer_Email,
    Customer_Age,
    Customer_Gender,
    Start_Date,
    End_Date,
    Is_Current )
VALUES
  ( GENERATE_UUID(), newCust.CustomerID, newCust.Customer_FirstName, newCust.Customer_LastName, newCust.Customer_Email, newCust.Customer_Age, newCust.Customer_Gender, newCust.Start_Date, NULL, TRUE );

/* 
    SCD Type 2 for Product Dimension
*/

MERGE INTO
  `omega-baton-449316-p5.retail_sales_dataset.product_dim` prodDim
USING
  `omega-baton-449316-p5.staging.staging_product` newProd
ON
  prodDim.ProductID = newProd.ProductID
  AND prodDim.End_Date IS NULL
  WHEN MATCHED THEN UPDATE
SET
  prodDim.ProductID = newProd.ProductID,
  prodDim.SKU_Number = newProd.SKU_Number,
  prodDim.Product_Name = newProd.Product_Name,
  prodDim.Product_Description = newProd.Product_Description,
  prodDim.Category = newProd.Category,
  prodDim.Brand = newProd.Brand,
  prodDim.Supplier = newProd.Supplier,
  prodDim.Department = newProd.Department,
  prodDim.Start_Date = prodDim.Start_Date,
  prodDim.End_Date = newProd.Start_Date,
  prodDim.Is_Current = FALSE;


MERGE INTO 
  `omega-baton-449316-p5.retail_sales_dataset.product_dim` prodDim
USING 
  `omega-baton-449316-p5.staging.staging_product` newProd
ON 
  prodDim.ProductID = newProd.ProductID AND
  prodDim.End_Date IS NULL
WHEN NOT MATCHED THEN
INSERT (
    Product_SK,
    ProductID,
    SKU_Number,
    Product_Name,
    Product_Description,
    Category,
    Brand,
    Supplier,
    Department,
    Start_Date,
    End_Date,
    Is_Current
) 
VALUES (
  GENERATE_UUID(),
  newProd.ProductID,
  newProd.SKU_Number,
  newProd.Product_Name,
  newProd.Product_Description,
  newProd.Category,
  newProd.Brand,
  newProd.Supplier,
  newProd.Department,
  newProd.Start_Date,
  NULL,
  TRUE
);


/* 
    SCD Type 2 for Store Dimension
*/

MERGE INTO
  `omega-baton-449316-p5.retail_sales_dataset.store_dim` storeDim
USING
  `omega-baton-449316-p5.staging.staging_store` newStore
ON
  storeDim.StoreID = newStore.StoreID
  AND storeDim.End_Date IS NULL
  WHEN MATCHED THEN UPDATE
SET
  storeDim.StoreID = newStore.StoreID,
  storeDim.Store_Number = newStore.Store_Number,
  storeDim.Store_Name = newStore.Store_Name,
  storeDim.Store_State = newStore.Store_State,
  storeDim.Store_City = newStore.Store_City,
  storeDim.Store_PostalCode = newStore.Store_PostalCode,
  storeDim.Store_StreetAddress = newStore.Store_StreetAddress,
  storeDim.Store_Manager = newStore.Store_Manager,
  storeDim.Start_Date = storeDim.Start_Date,
  storeDim.End_Date = newStore.Start_Date,
  storeDim.Is_Current = FALSE;


MERGE INTO 
  `omega-baton-449316-p5.retail_sales_dataset.store_dim` storeDim
USING 
  `omega-baton-449316-p5.staging.staging_store` newStore
ON storeDim.StoreID = newStore.StoreID AND
  storeDim.End_Date IS NULL
WHEN NOT MATCHED THEN 
INSERT (
    Store_SK,
    StoreID,
    Store_Number,
    Store_Name,
    Store_State,
    Store_City,
    Store_PostalCode,
    Store_StreetAddress,
    Store_Manager,
    Start_Date,
    End_Date,
    Is_Current
) 
VALUES (
    GENERATE_UUID(),
    newStore.StoreID,
    newStore.Store_Number,
    newStore.Store_Name,
    newStore.Store_State,
    newStore.Store_City,
    newStore.Store_PostalCode,
    newStore.Store_StreetAddress,
    newStore.Store_Manager,
    newStore.Start_Date,
    NULL,
    TRUE
);

