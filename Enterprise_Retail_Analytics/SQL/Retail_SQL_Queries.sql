from pathlib import Path

content = """# SQL Database Programming

import sqlite3

# Database Connection
connection = sqlite3.connect("retail_analytics.db")
df.to_sql("Retail_Data", connection, if_exists="replace", index=False)

# SQL Query 01 - Preview Dataset
query = '''
SELECT * FROM Retail_Data LIMIT 5;
'''
display(pd.read_sql(query, connection))

# SQL Query 02 - Display Dataset
query = '''
SELECT * FROM Retail_Data;
'''
display(pd.read_sql(query, connection))

# SQL Query 03 - Customer ID, Age, Gender
query = '''
SELECT "Customer ID", Age, Gender
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))

# SQL Query 04 - Customers Older Than 40
query = '''
SELECT * FROM Retail_Data
WHERE Age > 40;
'''
display(pd.read_sql(query, connection))

# SQL Query 05 - Female Customers
query = '''
SELECT * FROM Retail_Data
WHERE Gender='Female';
'''
display(pd.read_sql(query, connection))

# SQL Query 06 - Purchase > 80
query = '''
SELECT * FROM Retail_Data
WHERE "Purchase Amount (USD)" > 80;
'''
display(pd.read_sql(query, connection))

# SQL Query 07 - Clothing Customers
query = '''
SELECT * FROM Retail_Data
WHERE Category='Clothing';
'''
display(pd.read_sql(query, connection))

# SQL Query 08 - Highest Purchase
query = '''
SELECT * FROM Retail_Data
ORDER BY "Purchase Amount (USD)" DESC;
'''
display(pd.read_sql(query, connection))

# SQL Query 09 - Youngest Customers
query = '''
SELECT * FROM Retail_Data
ORDER BY Age ASC;
'''
display(pd.read_sql(query, connection))

# SQL Query 10 - First 20 Records
query = '''
SELECT * FROM Retail_Data
LIMIT 20;
'''


# SQL Query 11 - Distinct Locations
query = '''
SELECT DISTINCT
    Location
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))


# SQL Query 12 - Total Customers
query = '''
SELECT
COUNT(DISTINCT "Customer ID") AS Total_Customers
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))


# SQL Query 13 - Total Revenue
query = '''
SELECT
SUM("Purchase Amount (USD)") AS Total_Revenue
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))


# SQL Query 14 - Average Purchase
query = '''
SELECT
ROUND(AVG("Purchase Amount (USD)"),2) AS Average_Purchase
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))


# SQL Query 15 - Highest Purchase
query = '''
SELECT
MAX("Purchase Amount (USD)") AS Highest_Purchase
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))


# SQL Query 16 - Lowest Purchase
query = '''
SELECT
MIN("Purchase Amount (USD)") AS Lowest_Purchase
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))


# SQL Query 17 - Average Age
query = '''
SELECT
ROUND(AVG(Age),2) AS Average_Age
FROM Retail_Data;
'''
display(pd.read_sql(query, connection))


# SQL Query 18 - Revenue by Category
query = '''
SELECT
    Category,
    SUM("Purchase Amount (USD)") AS Revenue
FROM Retail_Data
GROUP BY Category
ORDER BY Revenue DESC;
'''
display(pd.read_sql(query, connection))


# SQL Query 19 - Revenue by Gender
query = '''
SELECT
    Gender,
    SUM("Purchase Amount (USD)") AS Revenue
FROM Retail_Data
GROUP BY Gender;
'''
display(pd.read_sql(query, connection))


# SQL Query 20 - Revenue by Season
query = '''
SELECT
    Season,
    SUM("Purchase Amount (USD)") AS Revenue
FROM Retail_Data
GROUP BY Season
ORDER BY Revenue DESC;
'''
display(pd.read_sql(query, connection))


# SQL Query 21 - Revenue by Payment Method
query = '''
SELECT
    "Payment Method",
    SUM("Purchase Amount (USD)") AS Revenue
FROM Retail_Data
GROUP BY "Payment Method"
ORDER BY Revenue DESC;
'''
display(pd.read_sql(query, connection))


# SQL Query 22 - Customer Spending Level
query = '''
SELECT
    CASE
        WHEN "Purchase Amount (USD)" <= 40 THEN 'Low Spender'
        WHEN "Purchase Amount (USD)" <= 70 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS Spending_Level,
    COUNT(*) AS Total_Customers
FROM Retail_Data
GROUP BY Spending_Level
ORDER BY Total_Customers DESC;
'''
display(pd.read_sql(query, connection))


# SQL Query 23 - Categories with Revenue Greater Than 50000
query = '''
SELECT
    Category,
    SUM("Purchase Amount (USD)") AS Revenue
FROM Retail_Data
GROUP BY Category
HAVING Revenue > 50000
ORDER BY Revenue DESC;
'''
display(pd.read_sql(query, connection))


# SQL Query 24 - Top 5 Revenue Locations
query = '''
SELECT
    Location,
    SUM("Purchase Amount (USD)") AS Revenue
FROM Retail_Data
GROUP BY Location
ORDER BY Revenue DESC
LIMIT 5;
'''
display(pd.read_sql(query, connection))


# SQL Query 25 - Customer Ranking Using ROW_NUMBER
query = '''
SELECT
    "Customer ID",
    "Purchase Amount (USD)",
    ROW_NUMBER() OVER (
        ORDER BY "Purchase Amount (USD)" DESC
    ) AS Customer_Rank
FROM Retail_Data;
'''
display(pd.read_sql(query, connection).head(20))


# SQL Query 26 - Customer Ranking Using RANK
query = '''
SELECT
    "Customer ID",
    "Purchase Amount (USD)",
    RANK() OVER (
        ORDER BY "Purchase Amount (USD)" DESC
    ) AS Purchase_Rank
FROM Retail_Data;
'''
display(pd.read_sql(query, connection).head(20))


# Close Database Connection
connection.close()

print("✅ Database Connection Closed Successfully")



