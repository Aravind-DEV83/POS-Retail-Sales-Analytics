# POS-Retail-Sales-Analytics
An end-to-end data pipeline for ingesting, transforming and modelling POS retail sales data, providing insights to customer purchases, product sales and store performance


### Dimensional Model Design

The first step in the dimensional design model is to identify the business process to model, combining the understanding of business requirements and the available source data.


1. Thought Process for Identifying Key Business Processes



2. Declare the Grain

Tracking data at its lowest grain provides maximum flexibility because detailed data is ready for ad-hoc queries by business users and provides indepth analysis if the user want to drill down.

The Fact table store data at transaction level for each item, each row represents a single product purchase in a sales transaction.


3. Identify the Dimensions

    | Dimensions              | Attributes                                                          |
    | ------------------------|:-------------------------------------------------------------------:|
    | Customer Dimension      | CustomerID, Name, Gender, Age, Membership_Type etc..                |
    | Product Dimension       | ProductID, Product_Name, Brand, Category, Supplier etc..            |
    | Store Dimension         | StoreID, Store_Name, Store_Number, Location, Store_Type etc..       |
    | Promotional Dimension   |  PromotionID, Discount_Type, Discount_Value, Start & End_Date etc.. |
    | Date Dimension          | DateID, Day, Month, Year, Quarter, Fiscal_Year etc..                |
    | Cashier Dimension       | CashierID, Cashier_Emp_Id, Cashier_Name                             |
    | PaymentMethod Dimension | PaymentMethodID, PaymentMethodDescription, PaymentMethodGroup       |


4. Identify the Facts

    | Facts                               | Formula                                                         |
    | ------------------------------------|:---------------------------------------------------------------:|
    | Sales Quantity                      | Quantity                                                        |
    | Regular Unit Price                  |                                                                 |
    | Discount Unit Price                 | Regular UP - (Regular UP * Discount %)                          |
    | Net Unit Price                      | Regular UP - Discount UP                                        |
    | Extended Sales Dollar Amount        | Net UP * Sales Quantity                                         |
    | Extended Discount Dollar Amount     | (Regular UP - Net UP) * Sales Quantity                          |
    | Extended Cost Dollar Amount         | Cost price per unit * Sales Quantity                            |
    | Extended Gross Profit Dollar Amount | Extended Sales Dollar Amount - Extended Cost Dollar Amount      |
    | Loyality Points earned              | Points earned for each time                                     |


#### Dimensional Model

![Dimensional Model](<images/POS Sales DIM Model.png>)

##### Dimension Table Surrogate Keys

⋅⋅* The unique primary key of a dimension table should be a surrogate key rather than relying on the operational system identifier, known as the natural key.

⋅⋅* We are going to use **GENERATE_UUID()** function in bigquery to generate globally Unique identifiers, it eliminates the risk of key collisions.

As a fundamental thing to consider from kimball DW Tool kit,
``` Every join between dimension and fact tables in the data warehouse
should be based on meaningless integer surrogate keys. You should avoid using a
natural key as the dimension table’s primary key. ```

##### Fact Table Surrogate Keys

⋅⋅* The primary key of a fact table typically consists of a subset of the table’s foreign keys and/or
degenerate dimension