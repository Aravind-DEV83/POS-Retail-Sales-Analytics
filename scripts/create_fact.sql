CREATE OR REPLACE TABLE `omega-baton-449316-p5.retail_sales_dataset.sales_fact` (
    Sales_SK STRING,
    Cashier_SK STRING,
    Product_SK STRING,
    Customer_SK STRING,
    Store_SK STRING,
    Date_SK STRING,
    Promotion_SK STRING,
    Payment_Method_SK STRING,
    Sales_Quantity INT64,
    Regular_Unit_Price NUMERIC(10,2),
    Discount_Unit_Price NUMERIC(10,2),
    Net_Unit_Price NUMERIC(10,2),
    Extended_Sales_Dollar_Amount NUMERIC(10,2),
    Extended_Discount_Dollar_Amount NUMERIC(10,2),
    Extended_Cost_Dollar_Amount NUMERIC(10,2),
    Extended_Gross_Profit_Dollar_Amount NUMERIC(10,2),
    Loyalty_Points INT64
);