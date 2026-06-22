Select *
From dbo.[Funnel Analysis Data]

	--Row Count
Select count(*) total_rows
From dbo.[Funnel Analysis Data] --(21663 Rows)
	--Columns Count
Select COUNT(*) AS total_columns
From Information_Schema.Columns
Where Table_Schema = 'dbo'
And Table_name = 'Funnel Analysis Data';--(10 Columns)

--Data Quality Assessment:
Select *
From dbo.[Funnel Analysis Data]
Where User_ID is Null
Or Session_ID is Null
Or Event is null
Or Timestamp is Null
Or Device is Null
Or Region is Null
Or Channel is Null
Or Product_Category is Null
Or Revenue is Null
or Bounce_Flag is Null; --(No Missing value)

	--Funnel Stages Definition:

--Browse-> Add to Cart -> Checkout -> Purchase

	--Funnel Count:
Select Event, COUNT(*) AS users
From dbo.[Funnel Analysis Data]
Group By Event
Order By users DESC; 

	--Conversion Rate Calculation:

Select
    100.0 * COUNT(Case When Event = 'Add to Cart' Then 1 End)
    / NULLIF(COUNT(Case When Event = 'Browse' Then 1 End), 0) AS Browse_to_Add_to_Cart_Conversion_Rate,

    100.0 * COUNT(Case When Event = 'Checkout' Then 1 End)
    / NULLIF(COUNT(Case When Event = 'Add to Cart' Then 1 End), 0) AS Add_to_Cart_to_Checkout_Conversion_Rate,

    100.0 * COUNT(Case When Event = 'Purchase' THEN 1 END)
    / NULLIF(COUNT(Case When Event = 'Checkout' Then 1 End), 0) AS Checkout_to_Purchase_Conversion_Rate,

    100.0 * COUNT(Case When Event = 'Purchase' Then 1 End)
    / NULLIF(COUNT(Case When Event = 'Browse' Then 1 End), 0) AS Overall_Conversion_Rate
From dbo.[Funnel Analysis Data];

		--Dropoff Analysis:

With funnel_counts AS (
    Select
        SUM(Case When Event = 'Browse' Then 1 Else 0 End) AS browse_count,
        SUM(Case When Event = 'Add to Cart' Then 1 Else 0 End) AS add_to_cart_count,
        SUM(Case When Event = 'Checkout' Then 1 Else 0 End) AS checkout_count,
        SUM(Case When Event = 'Purchase' Then 1 Else 0 End) AS purchase_count
    From dbo.[Funnel Analysis Data]
)
Select
    'Browse' AS funnel_stage,
    browse_count AS users,
    NULL AS dropoff_rate
From funnel_counts

Union All

Select
    'Add to Cart',
    add_to_cart_count,
    100.0 - (100.0 * add_to_cart_count / NULLIF(browse_count, 0))
From funnel_counts

Union All

Select
    'Checkout',
    checkout_count,
    100.0 - (100.0 * checkout_count / NULLIF(add_to_cart_count, 0))
From funnel_counts

Union All

Select
    'Purchase',
    purchase_count,
    100.0 - (100.0 * purchase_count / NULLIF(checkout_count, 0))
From funnel_counts;

--Revenue Analysis:

            Select SUM(Revenue) AS Total_Revenue
            From dbo.[Funnel Analysis Data]
            Where Event = 'Purchase';

--Average Order Value (AOV) Calculation:

            Select AVG(Revenue) AS Average_Order_Value
            From dbo.[Funnel Analysis Data]
            Where Event = 'Purchase';
        
--Purchase Count by Product Category:

            Select Product_Category, COUNT(*) AS Purchase_Count
            From dbo.[Funnel Analysis Data]
            Where Event = 'Purchase'
            Group By Product_Category
            Order By Purchase_Count DESC;

---Purchase Count by Device Type:

            Select Device, COUNT(*) AS Purchase_Count
            From dbo.[Funnel Analysis Data]
            Where Event = 'Purchase'
            Group By Device
            Order By Purchase_Count DESC;

--Purchase Count by Region:

            Select Region, COUNT(*) AS Purchase_Count
            From dbo.[Funnel Analysis Data]
            Where Event = 'Purchase'
            Group By Region
            Order By Purchase_Count DESC;

--Total Purchase Count

            Select COUNT(*) AS Total_Purchases
            From dbo.[Funnel Analysis Data]
            Where Event = 'Purchase';

           ---Device PerformanceAnalysis:
            Select Device,
                100.0 * COUNT(Case When Event = 'Purchase' Then 1 End)
                / NULLIF(COUNT(Case When Event = 'Browse' Then 1 End), 0) AS Device_Conversion_Rate
            From dbo.[Funnel Analysis Data]
            Group By Device
            Order By Device_Conversion_Rate DESC;  
            
                  ---Revenue by Device Type:

                           Select Device,
                           Count(*) As purchase,
                           Sum(Revenue) As Revenue 
                           From dbo.[Funnel Analysis Data]
                           Where Event = 'Purchase'
                           Group By Device
                           Order By Revenue DESC;

        --Marketing Channel Performance Analysis:

            Select Channel,
                100.0 * COUNT(Case When Event = 'Purchase' Then 1 End)
                / NULLIF(COUNT(Case When Event = 'Browse' Then 1 End), 0) AS Channel_Conversion_Rate
            From dbo.[Funnel Analysis Data]
            Group By Channel
            Order By Channel_Conversion_Rate DESC;  
            
                  ---Revenue by Marketing Channel:

                           Select Channel,
                           Count(*) As purchase,
                           Sum(Revenue) As Revenue 
                           From dbo.[Funnel Analysis Data]
                           Where Event = 'Purchase'
                           Group By Channel
                           Order By Revenue DESC;


                           --Bounce Rate Analysis:

                    SELECT
                        ROUND(
                            SUM(CASE WHEN Bounce_Flag = 1 THEN 1.0 ELSE 0.0 END) * 100.0
                            / NULLIF(COUNT(*), 0),
                            2
                        ) AS Bounce_Rate
                    FROM dbo.[Funnel Analysis Data];  --80.06% Bounce Rate