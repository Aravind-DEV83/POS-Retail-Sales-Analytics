CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.customer_dim` (
  Customer_SK STRING,
  CustomerID INT64 NOT NULL,
  Customer_FirstName STRING,
  Customer_LastName STRING,
  Customer_Email STRING,
  Customer_Age INT64,
  Customer_Gender STRING,
);

CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.product_dim` (
  Product_SK STRING,
  ProductID INT64 NOT NULL,
  SKU_Number STRING,
  Product_Name STRING,
  Product_Description STRING,
  Category STRING,
  Brand STRING,
  Supplier STRING,
  Department STRING
);

CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.store_dim` (
    Store_SK STRING,
    StoreID INT64 NOT NULL,
    Store_Number STRING,
    Store_Name STRING,
    Store_State STRING,
    Store_City STRING,
    Store_PostalCode STRING,
    Store_StreetAddress STRING,
    Store_Manager STRING,
);

CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.cashier_dim` (
    Cashier_SK STRING,
    CashierID INT64 NOT NULL,
    Cashier_EmpID STRING,
    Cashier_EmpName STRING
);

CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.promotion_dim` (
    Promotion_SK STRING,
    PromotionalID INT64 NOT NULL,
    PromotionCode STRING,
    PromotionName STRING
);

CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.date_dim` (
    Date_SK STRING,
    DateID DATE NOT NULL,
    Full_Date_Description STRING,
    Day INT64,
    Month INT64,
    Year INT64,
    Fiscal_Year INT64,
    Fiscal_Quarter STRING,
    Fiscal_Month STRING,
    Fiscal_Week INT64,
    Fiscal_Year_Month STRING,
    Fiscal_Year_Quarter STRING,
    DayofWeek STRING
);

CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.payment_menthod_dim` (
    Payment_Method_Sk STRING,
    PaymentMethodID INT64 NOT NULL,
    PaymentMethodDescription STRING,
    PaymentMethodGroup STRING
);
