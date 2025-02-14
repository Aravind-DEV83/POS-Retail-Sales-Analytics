-- Test data insertion into dimensions

INSERT INTO `omega-baton-449316-p5.retail_sales_dataset.customer_dim` 
(Customer_SK, CustomerID, Customer_FirstName, Customer_LastName, Customer_Email, Customer_Age, Customer_Gender)
VALUES
(GENERATE_UUID(), 101, 'John', 'Doe', 'john.doe@email.com', 28, 'Male'),
(GENERATE_UUID(), 102, 'Alice', 'Smith', 'alice.smith@email.com', 34, 'Female');


INSERT INTO `omega-baton-449316-p5.retail_sales_dataset.product_dim` 
(Product_SK, ProductID, SKU_Number, Product_Name, Product_Description, Category, Brand, Supplier, Department)
VALUES
(GENERATE_UUID(), 201, 'SKU123', 'Laptop', 'Gaming Laptop', 'Electronics', 'Dell', 'ABC Suppliers', 'Computers'),
(GENERATE_UUID(), 202, 'SKU456', 'Smartphone', 'Latest model', 'Electronics', 'Apple', 'XYZ Suppliers', 'Mobiles');


INSERT INTO `omega-baton-449316-p5.retail_sales_dataset.store_dim`
(Store_SK, StoreID, Store_Number, Store_Name, Store_State, Store_City, Store_PostalCode, Store_StreetAddress, Store_Manager)
VALUES
(GENERATE_UUID(), 301, 'S001', 'BestBuy NY', 'NY', 'New York', '10001', '123 Main St', 'Mark Johnson'),
(GENERATE_UUID(), 302, 'S002', 'BestBuy LA', 'CA', 'Los Angeles', '90001', '456 Elm St', 'Susan Lee');


INSERT INTO `omega-baton-449316-p5.retail_sales_dataset.cashier_dim`
(Cashier_SK, CashierID, Cashier_EmpID, Cashier_EmpName)
VALUES
(GENERATE_UUID(), 401, 'EMP001', 'David Brown'),
(GENERATE_UUID(), 402, 'EMP002', 'Emma Wilson');


INSERT INTO `omega-baton-449316-p5.retail_sales_dataset.promotion_dim`
(Promotion_SK, PromotionalID, PromotionCode, PromotionName)
VALUES
(GENERATE_UUID(), 501, 'PROMO10', '10% Off'),
(GENERATE_UUID(), 502, 'PROMO20', '20% Off');

INSERT INTO `omega-baton-449316-p5.retail_sales_dataset.date_dim`
(Date_SK, DateID, Full_Date_Description, Day, Month, Year, Fiscal_Year, Fiscal_Quarter, Fiscal_Month, Fiscal_Week, Fiscal_Year_Month, Fiscal_Year_Quarter, DayofWeek)
VALUES
(GENERATE_UUID(), '2024-02-01', '1st February 2024', 1, 2, 2024, 2024, 'Q1', 'Feb', 5, '2024-02', '2024-Q1', 'Thursday'),
(GENERATE_UUID(), '2024-02-02', '2nd February 2024', 2, 2, 2024, 2024, 'Q1', 'Feb', 5, '2024-02', '2024-Q1', 'Friday');


INSERT INTO `omega-baton-449316-p5.retail_sales_dataset.payment_menthod_dim`
(Payment_Method_SK, PaymentMethodID, PaymentMethodDescription, PaymentMethodGroup)
VALUES
(GENERATE_UUID(), 601, 'Credit Card', 'Card'),
(GENERATE_UUID(), 602, 'Cash', 'Cash');


-- Test data insertion into dimensions

INSERT INTO  `omega-baton-449316-p5.retail_sales_dataset.sales_fact` 
(SalesID, CashierID, ProductID, CustomerID, StoreID, DateID, PromotionID, PaymentMethodID, Sales_Quantity, Regular_Unit_Price, Discount_Unit_Price, Net_Unit_Price, Extended_Sales_Dollar_Amount, Extended_Discount_Dollar_Amount, Extended_Cost_Dollar_Amount, Extended_Gross_Profit_Dollar_Amount, Loyalty_Points)
VALUES
(GENERATE_UUID(), 1, 1, 'c07959b0-bca6-448c-922c-6cc8019da235', 1, 1, 1, 1, 2, 1000.00, 900.00, 950.00, 2000.00, 1800.00, 1500.00, 500.00, 20),
(GENERATE_UUID(), 2, 2, '22c8a250-8116-44a4-8f29-14ff01ac7c47', 2, 2, 2, 2, 1, 800.00, 750.00, 770.00, 800.00, 750.00, 600.00, 200.00, 10);
