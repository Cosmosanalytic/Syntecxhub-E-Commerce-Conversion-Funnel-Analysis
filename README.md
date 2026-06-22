🛒 E-Commerce Conversion Funnel Analysis
📌 Project Overview
This project analyzes the customer journey through an e-commerce conversion funnel to identify where users drop off before completing a purchase. The analysis focuses on measuring conversion performance across funnel stages, identifying bottlenecks, and providing actionable recommendations to improve customer conversion rates and revenue generation.
The project combines SQL, Excel, Power Query, Power BI, and PowerPoint to deliver a complete business intelligence solution, from data inspection and cleaning to dashboard development and executive-level reporting.
________________________________________
🎯 Business Problem
E-commerce businesses often attract significant website traffic but struggle to convert visitors into paying customers. Understanding where customers abandon the purchase journey is critical for improving user experience, increasing conversion rates, and maximizing revenue.
The objective of this project was to analyze customer behavior throughout the conversion funnel and identify the stages causing the highest user abandonment.
________________________________________
🎯 Project Objectives
•	Define the e-commerce conversion funnel stages.
•	Measure user progression across each funnel stage.
•	Calculate conversion rates between stages.
•	Calculate drop-off rates at each stage.
•	Identify funnel bottlenecks.
•	Analyze revenue performance.
•	Evaluate acquisition channel effectiveness.
•	Analyze device performance.
•	Generate actionable business recommendations.
•	Develop an interactive Power BI dashboard for stakeholders.
________________________________________
❓ Business Questions Answered
Funnel Performance
1.	How many users entered the funnel?
2.	How many users progressed through each funnel stage?
3.	What is the conversion rate between funnel stages?
4.	What is the overall funnel conversion rate?
5.	Where is the highest customer drop-off occurring?
Revenue Analysis
6.	How much revenue was generated?
7.	What is the average order value?
Marketing Performance
8.	Which acquisition channels generate the most purchases?
9.	Which channels generate the highest revenue?
Customer Behavior
10.	Which devices generate the most purchases and revenue?
11.	What is the bounce rate?
12.	Which regions contribute the highest revenue?
________________________________________
📂 Dataset Information
The dataset contains user-level e-commerce event data representing customer interactions throughout the shopping journey.
Dataset Features
Column	Description
User ID	Unique customer identifier
Session ID	Unique browsing session
Event	Funnel activity
Timestamp	Event date and time
Device	User device type
Region	Customer location
Channel	Acquisition source
Product Category	Product category
Revenue	Revenue generated
Bounce Flag	Bounce indicator
________________________________________
🛠️ Tools & Technologies Used
Tool	Purpose
Microsoft Excel	Initial data inspection and exploration
SQL	Data quality assessment and analytical queries
Power Query	Data cleaning and transformation
Power BI	Dashboard development and visualization
PowerPoint	Funnel conversion analysis presentation
GitHub	Documentation and project portfolio
________________________________________
🔍 Project Methodology
1. Data Inspection (Excel)
The dataset was initially reviewed in Excel to:
•	Understand dataset structure.
•	Identify available fields.
•	Verify data consistency.
•	Perform preliminary exploratory analysis.
________________________________________
2. Data Quality Assessment (SQL)
SQL was used to validate data quality.
Checks Performed
Missing Values
•	User_ID
•	Session_ID
•	Event
•	Timestamp
•	Device
•	Region
•	Channel
•	Product_Category
•	Revenue
Result: No missing values found.
Duplicate Records
Duplicate checks were performed using:
SELECT
User_ID,
Session_ID,
Event,
COUNT(*) AS Duplicate_Count
FROM funnel_analysis_data
GROUP BY
User_ID,
Session_ID,
Event
HAVING COUNT(*) > 1;
Result: No duplicate records found.
________________________________________
3. Data Cleaning & Transformation (Power Query)
Power Query was used to:
•	Validate data types.
•	Standardize text fields.
•	Remove unnecessary columns.
•	Format date and time fields.
•	Prepare the dataset for reporting.
________________________________________
4. Funnel Definition
The customer journey was defined as:
Browse
   ↓
Add to Cart
   ↓
Checkout
   ↓
Purchase
________________________________________
📊 Funnel Analysis Results
Users at Each Funnel Stage
Funnel Stage	 Users
Browse	             10,000
Add to Cart	7,059
Checkout	3,524
Purchase	1,080
________________________________________
Conversion Rate Analysis
Formula
Conversion Rate =
(Current Stage Users ÷ Previous Stage Users) × 100
Funnel Stage	Conversion Rate
Browse → Add to Cart	70.59%
Add to Cart → Checkout	49.92%
Checkout → Purchase	30.65%
________________________________________
Drop-Off Analysis
Formula
Drop-Off Rate =
100 − Conversion Rate
Funnel Stage	Drop-Off Rate
Browse → Add to Cart	29.41%
Add to Cart → Checkout	50.08%
Checkout → Purchase	69.35%
________________________________________
Overall Funnel Conversion Rate
Formula
Purchase Users ÷ Browse Users × 100
1,080 ÷ 10,000 × 100
Result
Overall Conversion Rate: 10.80%
________________________________________
💰 Revenue Analysis
Total Revenue
$1,176,405.78
________________________________________
Average Order Value (AOV)
Formula
Total Revenue ÷ Total Purchases
Result
$1,089.26
________________________________________
📱 Device Performance Analysis
Device	       Purchases	   Revenue
Tablet	383	            $415,491.96
Mobile	369	$403,652.25
Desktop	328	$357,261.57
Insight
Tablet users generated the highest revenue, contributing approximately 35.3% of total revenue.
________________________________________
📢 Marketing Channel Performance
Channel	    Purchases	Revenue
Email	      279	            $308,902.10
Google Ads	279	$305,053.00
Social Media	265	$292,971.23
Organic Search	257	$269,479.45
Insight
Email Marketing and Google Ads generated the highest purchase volume and revenue contribution.
________________________________________
📈 Key Findings
1. Strong Top-of-Funnel Engagement
A total of 10,000 users entered the funnel, indicating strong traffic acquisition performance.
2. Low Overall Conversion Rate
Only 1,080 users completed a purchase, resulting in an overall conversion rate of 10.80%.
3. Major Checkout Bottleneck
The largest customer abandonment occurred between Checkout and Purchase, with a drop-off rate of 69.35%.
4. High Revenue Contribution from Tablet Users
Tablet users generated the highest revenue among all device categories.
5. Effective Email Marketing Performance
Email campaigns delivered the highest purchase volume and revenue contribution.
________________________________________
📌 Recommendations
1. Optimize Checkout Experience
The checkout stage represents the most significant revenue leakage point.
Recommended Actions
•	Simplify checkout steps.
•	Implement one-page checkout.
•	Enable guest checkout.
•	Reduce form complexity.
________________________________________
2. Improve Payment Flexibility
Introduce additional payment options such as:
•	PayPal
•	Apple Pay
•	Google Pay
•	Local payment gateways
________________________________________
3. Launch Cart Recovery Campaigns
Implement:
•	Abandoned cart email reminders.
•	SMS recovery campaigns.
•	Exit-intent offers.
________________________________________
4. Scale High-Performing Marketing Channels
Increase investment in:
•	Email Marketing
•	Google Ads
These channels demonstrated the highest conversion effectiveness.
________________________________________
5. Improve Mobile & Tablet Experience
Optimize:
•	Mobile responsiveness.
•	Checkout performance.
•	Page loading speed.
•	Payment usability.
________________________________________
📊 Dashboard Features
The Power BI dashboard includes:
•	KPI Cards
•	Funnel Chart
•	Conversion Rate Analysis
•	Drop-Off Analysis
•	Revenue Analysis
•	Device Performance
•	Marketing Channel Performance
•	Regional Revenue Analysis
•	Product Category Performance
________________________________________
🚀 Business Impact
This analysis provides stakeholders with a clear understanding of customer behavior throughout the purchasing journey and identifies opportunities to improve conversion performance without increasing customer acquisition costs.
By addressing checkout abandonment and strengthening high-performing marketing channels, the business can significantly increase revenue and customer retention.
________________________________________
📁 Repository Structure
Ecommerce-Conversion-Funnel-Analysis
│
├── Data
│   └── funnel analysis data.csv
│
├── SQL
│   └── Funnel Analysis.sql
│
├── Power BI Dashboard
│   └── Ecommerce Funnel Analysis.pbix
│
├── Presentation
│   └── Funnel Analysis Presentation.pptx
│
├── Images
│   └── Dashboard Screenshot.png
│
├── README.md
│
└── LICENSE
________________________________________
👨‍💻 Author
Cosmos Isuru
Data Analyst | Business Intelligence Analyst | Safety & Health Analyst


