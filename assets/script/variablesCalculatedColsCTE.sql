/*
1.Define variables
2.create CTE(Common Table Expression)- that rounds avg views per video.
3.select the cols that are required for the analysis
4.Filter the result by the Youtube channels with the highest subscriber bases
5.Order by net_profit (from highest to lowest

*/
--1.---create variables
DECLARE @conversionRate FLOAT = 0.02;---Conversion rate at 2%
DECLARE @ProductCost MONEY = 5.0;---Product cost @ $5
DECLARE @campaignCost MONEY = 50000.0;---- The campaign cost @$50,000
DECLARE @numberOfVideo INT = 11;----The number of videos (11)
--2.
WITH channelData AS (
	SELECT 
	Channel_name,
	total_views,
	total_videos,
	--(total_views / total_videos) AS avg_views_per_video
	ROUND((CAST(total_views as FLOAT) / total_videos), -4) AS rounded_avg_views_per_video ---4 is helping to round up the values to nearest 10 thousands
	FROM youtube_db.dbo.view_uk_youtuber_24
)
--3SELECT * from channelData

---3.
SELECT  
	 Channel_name,
	 rounded_avg_views_per_video,
	 (rounded_avg_views_per_video * @conversionRate) AS Potential_product_Sold_per_video,
	 (rounded_avg_views_per_video * @conversionRate * @ProductCost) As Potential_revenue_per_video,
	 (rounded_avg_views_per_video * @conversionRate * @ProductCost) - @campaignCost AS Net_profit

from channelData

WHERE Channel_name in('NoCopyrightSounds','DanTDM ','Dan Rhodes')
