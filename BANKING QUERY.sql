--BANK CLIENT DATA EXPLORATION REPORT


 -- PROJECT OVERVIEW

--Objective:
--Explore the bank clients dataset to uncover insights about customer demographics,
--product usage, financial behavior, and risk exposure.

--Columns:
--Client_ID, Name, Age, Location_ID, Joined_Bank, Banking_Contact, Nationality,
--Occupation, Fee_Structure, Loyalty_Classification, Estimated_Income,
--Superannuation_Savings, Amount_of_Credit_Cards, Credit_Card_Balance, Bank_Loans,
--Bank_Deposits, Checking_Accounts, Saving_Accounts, Foreign_Currency_Account,
--Business_Lending, Properties_Owned, Risk_Weighting, BRId, GenderId, IAId

--DATA OVERVIEW
-- Preview data
SELECT TOP 10 * FROM dbo.CUSTOMERS;

-- Table structure info
EXEC sp_help 'dbo.CUSTOMERS';

--DATA QUALITY CHECKS
-- Check for missing values in key columns
SELECT
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
  SUM(CASE WHEN Estimated_Income IS NULL THEN 1 ELSE 0 END) AS Missing_Income,
  SUM(CASE WHEN Bank_Loans IS NULL THEN 1 ELSE 0 END) AS Missing_Loans
FROM dbo.CUSTOMERS;

-- Check for duplicate Client IDs
SELECT Client_ID, COUNT(*) AS Duplicate_Count
FROM dbo.CUSTOMERS
GROUP BY Client_ID
HAVING COUNT(*) > 1;

-- Count total records
SELECT COUNT(*) AS Total_Records
FROM dbo.CUSTOMERS;

--DESCRIPTIVE STATISTICS
-- Age Summary
SELECT
  MIN(Age) AS Min_Age,
  MAX(Age) AS Max_Age,
  AVG(Age) AS Avg_Age
FROM dbo.CUSTOMERS;

-- Income Summary
SELECT
  MIN(Estimated_Income) AS Min_Income,
  MAX(Estimated_Income) AS Max_Income,
  AVG(Estimated_Income) AS Avg_Income
FROM dbo.CUSTOMERS;

--CUSTOMER SEGMENTATION
-- Customers by Age Group
SELECT
  CASE
    WHEN Age < 25 THEN 'Youth'
    WHEN Age BETWEEN 25 AND 40 THEN 'Young Adult'
    WHEN Age BETWEEN 41 AND 60 THEN 'Middle Aged'
    ELSE 'Senior'
  END AS Age_Group,
  COUNT(*) AS Customer_Count
FROM dbo.CUSTOMERS
GROUP BY
  CASE
    WHEN Age < 25 THEN 'Youth'
    WHEN Age BETWEEN 25 AND 40 THEN 'Young Adult'
    WHEN Age BETWEEN 41 AND 60 THEN 'Middle Aged'
    ELSE 'Senior'
  END
ORDER BY Customer_Count DESC;

--PRODUCT USAGE INSIGHTS
-- Credit Card Ownership
SELECT
  Amount_of_Credit_Cards,
  COUNT(*) AS Num_Customers,
  AVG(Credit_Card_Balance) AS Avg_Card_Balance
FROM dbo.CUSTOMERS
GROUP BY Amount_of_Credit_Cards
ORDER BY Amount_of_Credit_Cards;

-- Average Loans vs Deposits
SELECT
  AVG(Bank_Loans) AS Avg_Bank_Loans,
  AVG(Bank_Deposits) AS Avg_Bank_Deposits
FROM dbo.CUSTOMERS;

-- Total Checking vs Savings Accounts
SELECT
  SUM(Checking_Accounts) AS Total_Checking,
  SUM(Saving_Accounts) AS Total_Savings
FROM dbo.CUSTOMERS;


--GEOGRAPHIC AND DEMOGRAPHIC INSIGHTS
-- Customers by Location
SELECT Location_ID, COUNT(*) AS Num_Customers
FROM dbo.CUSTOMERS
GROUP BY Location_ID
ORDER BY Num_Customers DESC;

-- Average Income by Occupation
SELECT Occupation, AVG(Estimated_Income) AS Avg_Income
FROM dbo.CUSTOMERS
GROUP BY Occupation
ORDER BY Avg_Income DESC;

-- Gender Distribution
SELECT GenderId, COUNT(*) AS Num_Customers
FROM dbo.CUSTOMERS
GROUP BY GenderId;

--FINANCIAL RISK ANALYSIS
-- Risk Weighting vs Income & Loans
SELECT
  Risk_Weighting,
  AVG(Estimated_Income) AS Avg_Income,
  AVG(Bank_Loans) AS Avg_Bank_Loans
FROM dbo.CUSTOMERS
GROUP BY Risk_Weighting
ORDER BY Risk_Weighting;

-- Properties Owned vs Credit & Loans
SELECT
  Properties_Owned,
  AVG(Credit_Card_Balance) AS Avg_Credit_Balance,
  AVG(Bank_Loans) AS Avg_Bank_Loans
FROM dbo.CUSTOMERS
GROUP BY Properties_Owned
ORDER BY Properties_Owned;

--RISK ANALYSIS
 --Derived ratios for deeper financial analysis
SELECT
  Client_ID,
  ROUND(Bank_Loans / NULLIF(Estimated_Income, 0), 2) AS Debt_To_Income_Ratio,
  ROUND(Saving_Accounts / NULLIF((Saving_Accounts + Checking_Accounts), 0), 2) AS Savings_Rate,
  ROUND(Credit_Card_Balance / NULLIF(Estimated_Income, 0), 2) AS Credit_Utilization
FROM dbo.CUSTOMERS;

--CUSTOMER ACQUISITION ANALYSIS
-- New Clients by Year Joined
SELECT
  YEAR(Joined_Bank) AS Year_Joined,
  COUNT(*) AS New_Customers
FROM dbo.CUSTOMERS
GROUP BY YEAR(Joined_Bank)
ORDER BY Year_Joined;