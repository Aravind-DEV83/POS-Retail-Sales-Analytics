# POS-Retail-Sales-Analytics
An end-to-end data pipeline for ingesting, transforming and modelling POS retail sales data, providing insights to customer purchases, product sales and store performance


### Dimensional Model Design

The first step in the dimensional design model is to identify the business process to model, combining the understanding of business requirements and the available source data.


1. Thought Process for Identifying Key Business Processes


2. Declare the Grain

Tracking data at its lowest grain provides maximum flexibility because detailed data is ready for ad-hoc queries by business users and provides indepth analysis if the user want to drill down.

The Fact table store data at transaction level for each item, each row represents a single product purchase in a sales transaction.


3. Identify the Dimensions

4. Identify the Facts