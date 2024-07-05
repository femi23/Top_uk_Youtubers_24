/*
#Data quality tests
1.The data needs to be 100 records of youtube channels (row count test) -----passed!!!
2.The data needs 4 fields(cols count test)---Passed!!!
3.The channel name col must be string format, and other cols must be numerical data types(data type check) Passed!!!
4. Each record must be unique in the dataset (duplicate count check) passed !!!

row count - 100
col count - 4

Data types
channel_name = VARCHAR
total_subscribers - integer
total_views - integer
total_videos - integer

Duplicate count = 0
*/

--row count check
select count(*) as no_of_rows
from youtube_db.dbo.view_uk_youtuber_24

--cols count check
--INFORMATION_SCHEMA -- knows information about tables cols, row, and any object within your database
select count(*) as column_count
from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_uk_youtuber_24'

---Data type check
select 
	COLUMN_NAME, DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_uk_youtuber_24'

---Duplicate records check
select channel_name,
COUNT(*) as Duplicate_count
from youtube_db.dbo.view_uk_youtuber_24
GROUP BY channel_name
Having COUNT(*) > 1;
--using having is for filtering records that appeared more then once 