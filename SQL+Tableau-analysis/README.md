# bike-sharing-analysis with SQL and Tableau
- Use the SQL scripts for the following steps in **MySQL**.
- Also, **Tableau Desktop** was used for creating visulizations. The workbooks are on [***Tableau Public***](https://public.tableau.com/app/profile/avneesh.) and in [***Tableau_proj***](https://github.com/av-neesh/chicago-bikes-analysis/tree/main/SQL%2BTableau-analysis/Tableau_proj) folder as .twb files.


**LOADING AND PROCESSING DATA**:

- Open MySQL Workbench, and make a connection to the MySQL server.
- USe the SQL script **'file_path'**:

		SHOW VARIABLES LIKE "secure_file_priv"
	
 	,and the results are shown, and a path is shown in the result.
- Copy all the csv files to the path mentioned in the 'Value' field.
- Create a new schema(database), and select it.

- Then run the **'create'** SQL script that creates and loads monthly data into the schema.

[***create.sql***](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/SQL_scripts/create.sql) :
* Create Table forms a structure to the table by providing the right data types and appropriate names.
* Load Data mentions the path of the csv file to be copied into the table.
* Fields Terminated shows that each field is terminated and separated by a comma(hence comma-separated values[csv]).
* The first header row is omitted from copying.
* A set statement handles all the invalid null values of double-type coordianates by assigning them NULL.
* This is done for all the 12 month data.

- Then the **'union'** script is run, that makes a 12 month compiled data with extra month, weekday and ride length columns in appropraite order.

[***union.sql***](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/SQL_scripts/union.sql) :
* First the create table command sets the general structure of the compiles 2021 data(optional).
* The innermost subquery returns all the union data of the year after combining monthly data end to end. This has an alibi of union
-table.
* The outer subquery returns the extracted month, the number of weekday, and the ride length of the union data, along with all the other tables in the right order.
* The ride length attribute/column is maintained within the truncated limits using only the subtraction of time values. [Note here negative values will be returned for trips contuining after midnight into the new da. This will be tackled by udating the table.]
* This all is selected and moved to the permanent table 2021 compiled tripdata.

- The [**'update_ride_length'**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/SQL_scripts/update_ride_lengths.sql) SQL script will add 24 hrs to the negative ride_length to correct the ride_lengths.

- Now the tripdata is ready to be *cleaned* and *analyzed*.


**DATA CLEANING**:
- A select distinct count of primary key *'ride_id'* compared to the select count of the same, shows how many duplicate ride_id's occur. (can be eliminated in analysis by using distinct):

		SELECT COUNT(DISTINCT ride_id)
	
- The length of the ride_id if fixed can be checked for consistency.
- The member_casual or any other column can be used for analysis by trimming any extra whitespace(if any), as it can provide inconsistent results.

		SELECT TRIM(member_casual)

- The data entries/rows having null values in the core analysis columns like: *ride_id*, *started_at*, *ended_at*, *member_casual* are eliminated by using:

		WHERE column = NOT NULL
		HAVING column = NOT NULL /*use when GROUP BY is already used before]*/
	
- COALESCE/CASE/SET/NULLIF: For replacing null values that may be truncated for the data-type can be replaced by:
	
		SELECT COALESCE(ride_length,'00:00:00') AS ride_length_new 					-or-
		SELECT CASE WHEN ride_length IS NULL THEN '00:00:00' ELSE ride_length END AS ride_length_new 	-or-
		SELECT NULLIF(ride_length,'00:00:00') AS ride_length_new 					-or-
		UPDATE TABLE table_name SET ride_length= NULLIF(@vride_length,'')				-or-
		(@vride_length) SET ride_length= NULLIF(@vride_length,'')
		
(The first 3 are while running an analysis query or creating table from query results(as already done in 'union' script), while the last two are done while updating table or creating table respectively(as already done in the 'create' script).)


**ANALYSIS**:
- Open **Tableau Desktop**.
- Two ways exist to produce viz in Tableau:
		
		1) The results of the SQL script are used as 'dimension' values to create the viz.
		2) The whole dataset is loaded as the data source and 'measure' values such as count, sum, etc. are used to create viz [like in PivotCharts in Excel].
		
(We follow the first as it is faster and SQL is used to write queries to the server data.)

- Connect to the server **'MySQL'**.
- Sign in to the **localhost** server as the **root** user, and chose the schema created in MySQL as the database. Thus all the tables are available now to access and run queries in Tableau.
- The data source is the MySQL server and the database is chosen as the created schema.
- Use the option: *New Custom SQL* to run the SQL analysis scripts and automically load the results into the BI Sheet to visualize.


**TABLEAU VIZ's + SQL SCRIPTS and ANALYSIS**:

[**WORKBOOK 1**](https://public.tableau.com/app/profile/avneesh./viz/avg_month_analysis/Dashboard1): Created for avg ride lengths and number of trips over months of years using the [***'analysis.sql'***](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/SQL_scripts/analysis.sql) script.

*SHEET1*--> Columns: month_of_year; Rows: SECOND(avg_ride_length) {Note: it is important to keep both as 'continuous' values for easier axis editing]; Color: member_casual {Assign as discrete value}; Graph type: Line.

*SHEET2*--> Columns: month_of_year; Rows: no_of_trips; Color: member_casual, Graph Type: Line.

*DASHBOARD*--> Add a floating member casual color legend and both sheets to the dashboard in an up&down format.
- Format each axis for month from 0 to 6, and for other y-axis in both sheets to start from 0.
![Dashboard 1](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/Tableau_proj/Tableau_Plots/Dashboard%201.png)

***Conclusions*** :
* The no of trips taken across the year by both members and casuals has a peak in the middle of the year, ie, summers. While the trips drastically decrese during the winter months. This confirms the hypothesis that summers have  more number of riders and trips due to the breaks going in the period and also due to the fact it is a much more milder weather to usea  bike.
* The casuals are more likely to take longer trips than members all throughout the year. Also, the average ride lengths of members are somewhat constant throughout the year, and can be highly likely due to the working and studying people availing membership. While the ride lengths of the casuals has a high during February and keeps decreasing further into year (even through summer). Thus this could be due to the reason more and more casual riders are already opting to avail membership, thus the average ride length is coming down through 2021.

[**WORKBOOK 2**](https://public.tableau.com/app/profile/avneesh./viz/weekdays_analysis/Dashboard1): Created for avg ride length and ride count over days of week.

*SHEET1*--> Columns: day_of_week; Rows: SECOND(avg_ride_lengthh) {Keep both continuous}; Color: member_casual {keep 'discrete'}; Graph-type: Line.

*SHEET2*--> Columns: day_of_week; Rows: ride_cnt; Color: member_casual; Graph-type: Line.

*DASHBOARD*: Add a floating member casual color legend and both sheets to the dashboard in an up&down format.
* Format each axis for month from 0 to 6, and for other y-axis in both sheets to start from 0.
![Dashboard 2](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/Tableau_proj/Tableau_Plots/Dashboard%202.png)

***Conclusions*** :
* The number of rides taken by mbers have a overall constant trend throughout the week, with some dip on the weekends, showing the high percentage of students and working people. While for casual riders, Saturdays are the highest rides taken. The weekend(+Friday) trend shows significant increase from the weekdays, thus the tourist/leisure percentage of casual riders.
* For members the avg ride length is almost constant with very slight increase on weekends, which could suggest that some members may find the bikes easier to commute the city for leisure purposes on weekends. While the average casual rides have a obvious rise on weekends and a dip on Wednesday and Thursday.

[**WORKBOOK 3**](https://public.tableau.com/app/profile/avneesh./viz/most_pop_stations/Dashboard1): Shows the most used stations using the 'analysis' script.
* The script orders the ride stations as per where the longest rides take place.
* Give the lat and lng 'geographical roles' of latitude and longitude. And use graph type as 'Map'.

*SHEET1* --> Detail: start_lat, start_lng {latitude and longitude will be genertated}, Color: member_casual with sorted acsending.

*SHEET2*--> Detail: start_lat, start_lng {latitude and longitude will be genertated}, Color: member_casual with sorted decsending.

*SHEET3*--> Detail: end_lat, end_lng {latitude and longitude will be genertated}, Color: member_casual with sorted acsending.

*SHEET4*--> Detail: end_lat, end_lng {latitude and longitude will be genertated}, Color: member_casual with sorted decsending.

*DASHBOARD*--> stations side by side and start and end up & down, with flaoting color legend.
![Dashboard 3](https://user-images.githubusercontent.com/110298158/182018392-e1cfe933-42bb-4af7-8678-0faf4af93e76.png)

***Conclusions*** :
* The visualization suggests that most of the members start and end their rides in the urban areas of the cities, not going far from the main city. While for casuals, most of rides though they start from the inner city, the rides are likely to end at suburban and outer parts of the city.

[**SQL SCRIPT**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/SQL_scripts/analysis.sql) We also run a SQL query to find out the most popular bike ride routes for both casuals and members. Here are the results:

**Members**: [CSV Table](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/SQL_scripts/Tables/member_pop_routes.csv)
	
		ride_count, 	avg_ride, 	member_casual, 	route
		221070, 	00:20:55, 	member,  	to 
		4082,		00:10:06, 	member, 	Ellis Ave & 60th St to Ellis Ave & 55th St
		3652, 		00:09:51, 	member, 	Ellis Ave & 55th St to Ellis Ave & 60th St
		3109, 		00:09:53, 	member, 	Ellis Ave & 60th St to University Ave & 57th St
		3010, 		00:08:43, 	member, 	University Ave & 57th St to Ellis Ave & 60th St
		1989, 		00:06:27, 	member, 	Calumet Ave & 33rd St to State St & 33rd St
		1962, 		00:29:29, 	member, 	University Ave & 57th St to 
		1954, 		00:07:15, 	member, 	State St & 33rd St to Calumet Ave & 33rd St
		1860, 		00:08:48, 	member, 	Loomis St & Lexington St to Morgan St & Polk St
		1809, 		00:15:10, 	member, 	Ellis Ave & 60th St to 

**Casuals**: [CSV Table](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/SQL_scripts/Tables/casual_pop_routes.csv)

		ride_count, 	avg_ride, 	member_casual, 	route
		202148, 	00:34:12, 	casual,  	to 
		11683, 		01:47:09, 	casual, 	Streeter Dr & Grand Ave to Streeter Dr & Grand Ave
		6111, 		01:46:29, 	casual, 	Millennium Park to Millennium Park
		5900, 		02:00:39, 	casual, 	Michigan Ave & Oak St to Michigan Ave & Oak St
		4669, 		01:34:21, 	casual, 	Lake Shore Dr & Monroe St to Lake Shore Dr & Monroe St
		3445, 		02:07:18, 	casual, 	Buckingham Fountain to Buckingham Fountain
		3309, 		01:07:36, 	casual, 	Streeter Dr & Grand Ave to Millennium Park
		3219, 		01:53:20, 	casual, 	Theater on the Lake to Theater on the Lake
		3116, 		01:26:25, 	casual, 	DuSable Lake Shore Dr & Monroe St to DuSable Lake Shore Dr & Monroe St
		3028, 		02:11:14, 	casual, 	Montrose Harbor to Montrose Harbor

{Ignore the null station_values this are tackled with [**R analysis**](https://github.com/av-neesh/chicago-bikes-analysis/tree/main/R-analysis)}

***Conclusions*** :
* The top most popular routes taken by members are short(as compared to the casual riders), and reciprocals(ie, the end point of one route is the starting point of another route and vice versa). Also most of the most popular routes are between residential areas and universities/work hubs of the city.
* The top most popular routes for casual riders are quite long and also between various tourists spots in Chicago. Also some of the top 10 popular routes are complete round trips(ie, the starting points are also the ending points, showing that the trips were ended from where they started after a long trip).

[**WORKBOOK 4**](https://public.tableau.com/app/profile/avneesh./viz/route_distribution/Dashboard1): Shows the distribution of casual and member most popular routes.

*SHEET1*--> Columns: route {Sort route By Field in a descending order by Count of ride_count}; Rows: SECOND(avg_ride_l), ride_count {keep both continuous}; Color: member_casual; Filter: route {remove null station values}, member_casual {in this sheet keep member}

*SHEET2*--> Duplicate the sheet1 and change the filter to casual only.

*DASHBOARD*--> Make a side-by-side of both sheets without the legends or filter.
![Dashboard 4](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/Tableau_proj/Tableau_Plots/Dashboard%204.png)

***Conclusions :***
* It is evident that the casual avg rides of popular routes is greater than that of members. Also the distribution for casuals is much flatter, which means there is less difference between the popularity of routes, whereas the member popular routes are much more few and prominent.

[**WORKBOOK 5**](https://public.tableau.com/app/profile/avneesh./viz/popular_routes_path/Dashboard1): Aims to describe the paths of the most popular routes.
* Run the custom SQL script in Tableau. This script is similar as that of the 3rd workbook created, but the complete round trips are omited by the WHERE condition. Also the results are limited to 250 rows only to avoid the intensive process.
* Create a **'Calculated Field'** by right-clicking any field in the query result schema preview.
* The formula using the spatial functions to form the calculated fields will be:

		1. MAKEPOINT([start_lat],[start_lng]) as the 'start_point';
		2. MAKEPOINT([end_lat],[end_lng]) as the 'end_point'.
		3. MAKELINE([start_point],[end_point]) as the 'route_line'.

*SHEET*--> Drag and drop the line onto the sheet. Also drop the start and end points onto the sheet as a **'Marks'** layer. Colour: member_casual.
![Dashboard 5 casual](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/Tableau_proj/Tableau_Plots/Dashboard%205%20casual.png)![Dashboard 5 member](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/SQL%2BTableau-analysis/Tableau_proj/Tableau_Plots/Dashboard%205%20member.png)

***Conclusions :***
* It is not very evident as only top 250 rides were taken into account. Most of the rides are concentrated on the harbor.
* This problem is in [**R analysis**](https://github.com/av-neesh/chicago-bikes-analysis/tree/main/R-analysis), where [**ggmap viz's**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/R_Plots/pop_routes_usertype.png) can be created very effectively.
