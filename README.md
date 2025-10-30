# DATA-VISUALIZATION-SQL
## Bank Client Data Exploration Report (SQL Server)
This project seeks to explore the bank clients dataset to uncover insights about customer demographics, product usage,financial behavior, and risk exposure.
This dataset has 3000 records and various columns which include:Client_ID, Name, Age, Location_ID, Joined_Bank, Banking_Contact, Nationality, Occupation,
Fee_Structure, Loyalty_Classification, Estimated_Income, Superannuation_Savings,
Amount_of_Credit_Cards, Credit_Card_Balance, Bank_Loans, Bank_Deposits,
Checking_Accounts, Saving_Accounts, Foreign_Currency_Account, Business_Lending,
Properties_Owned, Risk_Weighting, BRId, GenderId, IAId

#### Customer Demographics
The bank has its youngest customer(17 years) and its oldest(85 years) with an average age of 51 years. The bank's major customer age group is the senior age group(60+ years) with a count of 1084 people,
the middle aged age group(between the age of 40 and 60) has a count of 881, young adults(between 25 and 40years) are 713 and the youth(below the age of 25) being the least with a count of 322.

#### Product Usage
Most customers of this bank have one credit card(1922), 765 customers have two credit cards and 313 customers have 3 credit cards.

#### Financial Behaviour 
The bank's Debt-to-Income Ratio varies between 0-19.15 which is very wide spread.This measures how much of a client’s income goes toward debt repayment. The portfolio contains high-risk, highly leveraged clients and financially stable ones.
Clients with ratios above 10 (e.g. IND81288, IND40785, IND74197) have very high leverage, meaning they carry significant debt relative to their income whereas clients with ratios below 3 are low-risk or conservative borrowers.

On matters Savings Rate,the ranges are from 0.1 to 0.73, suggesting variability in saving behavior. Customers with high savings rate(>0.5) are active savers in the bank while clients around 0.1–0.4 save less, likely transactional customers.

On matters Credit Utilization, most customers are below 0.1 (10%), suggesting low credit card usage or conservative spending. This could mean the client base is either financially disciplined or underusing credit facilities.

#### Time-based Growth
New Customer Acquisition over the years has been quite steady with the numbers ranging from 97 in 1995 to 194 new customers in 2021. The data shows a sharp increase starting 2019 with 187 new customers and peaking in 2020 with 248(more than double the previous years)
The bank experienced a slight decline in 2021 which is a natural stabilization after a surge, still well above pre-2019 levels, indicating sustained customer interest.

## Recomendations
#### Diversify Customer Demographics
The bank's major customer base(60%) is the aged and middle aged age group with only 10% being the youth. 
I would recommend that the bank develops youth-targeted products such as student or starter accounts with low fees and mobile-first onboarding.
Offer digital financial literacy campaigns to appeal to younger, tech-savvy customers.

#### Product and Marketing Recommendations
Increase Credit Card Engagement
Most customers have low credit utilization (<10%), suggesting underuse.
I would recommend introduction of reward programs, cashbacks, or tiered benefits to encourage responsible usage.
Educate customers on credit score advantages of consistent but low utilization.
Segment and market differently:
Low utilizers: Offer promotions to drive moderate use.
High utilizers: Offer credit limit reviews and debt counseling.

Enhance Savings and Investment Behavior
Savings rate varies widely (0.1–0.73), and many customers save very little.
I would recommend the launch of automated savings tools or “Save-as-you-spend” products to improve savings culture.
Offer higher-interest tiers or bonuses for customers maintaining savings rates >0.5.

#### Strengthen Risk Management and Credit Monitoring
The bank has a wide Debt-to-Income Ratio (0–19) range indicating both high-risk and low-risk borrowers.
Introduce automated credit risk scoring using DTI and other financial metrics to classify clients as Low / Medium / High Risk. The bank could flag clients with DTI > 10 for credit review or risk monitoring.

#### Maintain Growth Momentum Post-2020
New customer acquisitions spiked in 2019–2020, then slightly declined in 2021.
I would recommend that the bank conducts post-onboarding satisfaction analysis to understand retention after the 2020 surge.
Leverage digital momentum: expand online onboarding, mobile app engagement, and e-KYC services.
Run referral or loyalty programs to maintain acquisition levels and reduce churn.
