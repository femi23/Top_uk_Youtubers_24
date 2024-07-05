/*
#Data cleaning
1.remove all unneccesary columns by only selecting the ones we need 
2.Extract youtube channel names from the first columns.
3.Rename the columns name 

*/

select 
	NOMBRE,
	total_subscribers,
	total_views,
	total_videos
from [youtube_db].[dbo].[top_uk_youtuber_2024]
		
--CHARINDEX FUNC(Allow you to find the starting position of one string inside another string)
---extracting the position of @ in the cols
--select CHARINDEX('@',NOMBRE), NOMBRE from [youtube_db].[dbo].[top_uk_youtuber_2024]
---extracting data from each of the cells
---Use SUBSTRING
--select SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE) ) from [youtube_db].[dbo].[top_uk_youtuber_2024]
---use -1 to remove the @
--select SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE)-1 ) from [youtube_db].[dbo].[top_uk_youtuber_2024]
---confirm the col only take in string, use cast i.e. casting col to string type, restricting it to 100 char

CREATE VIEW view_uk_youtuber_24 AS
select 
	CAST(SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE)-1 )as VARCHAR(100))as Channel_name,
	total_subscribers,
	total_views,
	total_videos
from youtube_db.dbo.top_uk_youtuber_2024

--create a sql view so we only show data we want power BI to see and relevant to our project.