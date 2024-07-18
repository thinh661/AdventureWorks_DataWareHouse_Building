# Data Warehouse Design and Implement Demo

![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/data-warehousing1.png)
## Table of Contents
- [Introduction](#introduction)
- [Project Phases](#project-phases)
- [Data Source](#data-source)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [EDA OLTP](#eda)
- [Design DWH](#design)
- [ETL Phase](#etl-phase)
- [Analysis Phase](#analysis-phase)
- [Reporting Phase](#reporting-phase)

## Introduction
Welcome to the AdventureWorks Data Warehousing Project. This project is an exemplary demonstration of a complete data warehousing solution, encompassing the Extract, Transform, Load (ETL) phase, analysis phase with SQL Server Analysis Services (SSAS), and reporting phase using Power BI.

## Project Phases
1. **EDA OTLP Database**: Explore and understand the "AdventureWorks" database.
2. **Design the Data Warehouse**: Design a snowflake data warehouse for 2 business process (Sale - Product).
3. **ETL (Extract, Transform, Load)**: In this phase, data is extracted from a transactional database called "AdventureWorks" version 2012 transformed to meet data warehousing requirements, and loaded into a structured data warehouse.
4. **Analysis**: The data is modeled and structured for efficient querying and analysis using SQL Server Analysis Services (SSAS).
5. **Reporting**: Interactive reports and visualizations are created using Pivot Table in Power BI, allowing end-users to derive insights from the data.

## Data Source
The source dataset for this project is the "AdventureWorks" database, which can be found [here](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/OLTP_Backup/AdventureWorks2012.bak) or Google. This transactional database serves as the foundation for the end-to-end project.

## Technologies Used
- SQL Server / Mircosoft Visual Studio
- SQL Server Integration Services (SSIS)
- SQL Server Analysis Services (SSAS)
- Power BI

## Getting Started
To explore and replicate the project, follow these steps:
1. Clone this repository to your local machine.
2. [Download and install SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) if not already installed.
3. Follow the instructions in the respective folders for each project phase (EDA, Design, ETL, Analysis, Reporting) to set up and execute the code.

## EDA Database Phase
Read information about the AdventureWorks database in [here](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)

Because I'll analysis around Sale and Product Business Process to anwser for 6 question:
- Report revenue by each employee => revenue
- Report revenue by region => sales
- Report number of orders by employee => Number of orders
- Report number of units by region => Number of orders
- Report sales quantity by product group => Number of products
- Report sales quantity by product and region => Number of products
so I only focus about 8 main tables in AW2012 database:

* Person:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/Person_oltp.png)
* Employee:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/employee_oltp.png)
* Territory:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/teritory_oltp.png)
* Product Category:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/product_category_oltp.png)  
* Product Sub Category:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/product_sub_category_oltp.png) 
* Product:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/product_oltp.png) 
* Sales Order Header:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/sales_orer_header_oltp.png) 
* Sales Order Detail:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/sales_order_detail_otlp.png) 

## Design DWH Phase
* From the OLTP database, I redesigned the database according to OLAP principles, specifically using dimension modeling and the snowflake schema.

* The reason for choosing the snowflake schema is that I built a data warehouse based on two facts: Sales and Product. I opted for the snowflake schema to optimize table creation and the ETL process. 

* However, the downside of this method is that it complicates the query process.

* Snowflake Schema Design:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/snowflake_dwh.png) 

* Fact SalesOrder:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/fact_sales_order.png) 

* Fact Prodcut:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/fact_product.png) 

* Dim Sales Person:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/dim_sales_person.png) 

* Dim Territory:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/dim_territory.png) 

* Dim Time:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/dim_time.png) 

* Dim Product:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/dim_product.png) 

* Dim ProductSubCategory:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/dim_product_sub_category.png) 

* Dim ProductCategory:
    ![Logo](https://github.com/thinh661/AdventureWorks_DataWareHouse_Building/blob/master/image/dim_product_category.png) 



## ETL Phase

* Detailed instructions for the ETL phase can be found in the [ETL_SSIS folder](/ETL_AW_by_SSIS).

    * Load data into staging:
        ![Load data](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Customer%20Dim.PNG)

   * Transform dim person into staging:
   
    ![ETL Customer Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Customer%20Dim.PNG)

   * Transform dim territory into staging:
   
    ![ETL Book Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Book%20Dim.PNG)

   * Transform dim time into staging:
   
    ![ETL Shipping Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Shipping%20Dim.PNG)

   * Load Fact Sales Order into staging:
   
    ![ETL Fact Table Full Load](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Fact%20Table%20Full%20Load.PNG)

    * Load full data from staging into Data Warehouse:
   
    ![ETL Fact Table Full Load](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Fact%20Table%20Full%20Load.PNG)

## Analysis Phase
To explore the analysis phase, refer to the [Analysis folder](/Analysis).

This project harnesses the power of SQL Server Analysis Services (SSAS) for advanced data modeling and analysis. In particular, we've employed the Tabular mode of OLAP (Online Analytical Processing) to create efficient data models that cater to our analytical needs.

- **Tabular Mode:** We've chosen to work with the Tabular mode in SSAS. This mode specializes in constructing tabular data models, which provide a streamlined, relational view of the data. It excels in scenarios where data retrieval speed and simplicity are top priorities.

    ![SSAS OLAP](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/Cube%20Browsing%20OLAP.PNG)


## Reporting Phase
For reporting and visualization using Pivot Table and Power BI, visit the [Reporting folder](/Reporting).

The reporting phase in this project is designed to provide users with the flexibility and tools to gain insights from the data. We've incorporated two distinct types of reporting to cater to different user needs:

#### 1. Pivot Table Reporting

Pivot tables are a well-known and versatile tool within Microsoft Excel, allowing users to analyze, aggregate, and visualize data in a tabular format. This method of reporting is particularly useful when you need to perform basic ad-hoc analysis or create custom reports directly in Excel. With pivot tables, users can slice and dice the data to answer specific questions and gain insights quickly.

* Total Quantity, Total Price, Total Shipping Cost, Total Revenue of the 12 months over all years

![Pivot_Table_Insight_1](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/PP%20Insight%201.PNG)

* The Best-selling language books
    
![Pivot_Table_Insight_2](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/PP%20Insight%202.PNG)

* Total Quantity, Total Price, Total Shipping Cost, Total Revenue of all shipping methods for countries.

![Pivot_Table_Insight_3](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/PP%20Insight%203.PNG)

* Total Price of all Years
  
![Pivot_Table_Insight_4](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/PP%20Insight%204.PNG)



#### 2. Power BI Dashboard Reporting

Power BI is a powerful business intelligence tool that delivers interactive and dynamic reports, dashboards, and data visualizations. It is designed for self-service reporting, enabling users to explore data intuitively, create compelling visualizations, and share insights with others. Power BI reports are ideal for more in-depth analysis, interactive dashboards, and data-driven storytelling.

These two types of reporting options provide a spectrum of reporting capabilities to suit various user preferences and needs. Whether you prefer the simplicity and familiarity of pivot tables or the dynamic and interactive experience of Power BI, this project offers a range of reporting tools to empower you to extract valuable insights from the data.

![PowerBIDashboard](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/Gravity%20Book%20Sales%20Power%20BI%20Dashboard.PNG)


## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to adapt and expand upon this template to provide all the necessary details, instructions, and context for your "Gravity Books Sales End-to-End Project" repository. An informative README.md helps users understand and engage with your project effectively.
