-CHICAGO BIKE SHARING DATA gathered from dataset link: https://divvy-tripdata.s3.amazonaws.com/index.html

-Unzip the files and create subfolders for the .CSV file and the .XLS or Sheets file so that you have a copy of the original data.

-select all on top left, then auto adjust column width
-freeze top row
-conditional format member/casual color(optional)
-choose to Save As an Excel Workbook file
-create 'month' column, and put formula =MONTH(E2) to extract the month serial number of the rides started_at time. Then format the cell as custom 'mmmm' format to extract the month string coressponding to the serial number.(optional)
-create a column called “ride_length.” ” Calculate the length of each ride by subtracting the column “started_at” from the column “ended_at” (for example, =D2-C2) and format as HH:MM:SS using Format > Cells > Time > 37:30:55.
-create a column 'day_of_week' by formula =C2 to identify the starting day of week and then formatting it as 'dddd' format[to obtain string]. / or formula =WEEKDAY(C2,1) and then format as general can be used directly to extract the weekday serial number.
-repeat for every month.

CLEANING IN EXCEL
-create new ride_id column left of the existing with formula =TRIM(B1) ,ie. remove whitespaces from ride_id and then copy and paste as values. Then delete the previous column.
-remove duplicate rows: data->data cleanup->remove duplicates.
-at end row of spreadsheet formula =COUNTIF(A1:A10393,"") in all attributes, to find the number of empty cells. If any of the main analysis attribute(i.e., ride_id, started_at, ended_at, member_casual) cell values are missing, delete that row.
-format each column to the appropriate data type(can be done further in SQL & Tableau too while importing data).

-select ride_length column values, and name the array 'ride_length', 'member_casual', 'start_station_name', etc. in Excel.
-determine the max, avg of the ride_length array.
-determine the mode of the day_of_weeek and then format it as a 'dddd' format.
-name the member_casual array, and then formula =AVERAGEIF(member_casual,"member"/"casual",ride_length) and then format into h:m:s format, to find the average ride length of member and casual riders.[will do in pivot table too]
-calculate the mode of ride_length, and then for member and casual separately using formula =MODE(IF(member_casual="member"/"casual",ride_length,))
-calculate the mode of start_station_name, and then for member and casual separately using formula =MODE(IF(member_casual="member"/"casual",start_station_name,))

PIVOT TABLE(for month data)
-convert the dataset into a table.
-Rows=member_casual,rideable_type; Values=Count of ride_id,Sum of ride_length{format it into dd hh:mm:ss format}[show values as 5 of grand total],Average of ride_length{format as mm:ss}; Columns=Values(automatically created)----> to summarize the time spent on bike types by both casuals and members.
-Rows=member_casual,ride_length; Values=Count of ride_id; then create a PivotChart of the same and add a Moving Average trendline with high period. Modes of the member and casual rider length can be seen easily.
-Rows:member_casual,day_of_week; Values=Count of ride_id,Sum of ride_length{format it into dd hh:mm:ss format}[for both attributes, show the values as percentages of grand total],Average of ride_length{format in mm:ss}[show value by no calcualtion]; Columns=Values(automatically created); then create a PivotChart line type to summarize the number of rides and the total time spent on a daily trend.
-Rows=start_station_name; Columns=member_casual; Values=Count of ride_id; Filter=start_station_id[to remove all the blank station names, as the station and id are missing for the same row values]; then sort either the member or casual elements(sort sheet by casual in this case); then make a line chart---->to find the most used stations
-Rows=started_at{days,hours,minutes created automatically}; Columns=member_casual,Values{created automatically}; Values=Count of ride_id, Sum of ride_length[both are show values as % of grand total], Average of ride_length[format set as mm:ss]; then a PivotChart creted, and add a trend line to members and casuals's average ride lengths----> to understand the daily trends of rides over the month.
-Rows=Hours,Minutes,started_at[minutes and started_at are optional, as they don't do anything]; Columns=member_casual; Values=Count of ride_length; and then create a PivotChart with trendlines on both meber and casual----> to understand the hourly commute patterns on an average day.

-Pivot Table and Charts are made for the months: January, March, June & September.
-These plots are saved in a folder by: Copying the Excel plots; Pasting as a picture in Word; Save the plot as a picture in a plots folder.

SUMMARY POINTS: (January)
-The average ride length is 15:16. Members take 81.29% of all the rides with an avg ride length is 12:52, while for casuals it is a longer 25:41.
-Of the total 96834 trips, members took 78717 trips, while casuals took much lower 18117 trips.
-The ride_length v/s ride_count follows roughly a Poisson distribution. Most of the members take ~6:00 rides, while most of the casuals take longer ~7:30 rides.[ride length v/s ride count, i.e. mode]
-The member distribution is much narrower(lower lambda) meaning less variation than the mode, while the casual distribution is much wider which implies that they take much longer average rides than the mode.
-Classic_bike are most popular among the riders with a share of 63.72%.
-For members: classic bikes are twice as much used as the electric bikes, but the average ride length on both are almost the same. Docked bikes are not liked by the members.
-For casuals classic bikes are used as much as the electric bikes, but the average ride length is greater for the classic bikes. While the average ride length is highest for the docked bikes, even though they are lesser used.
-The station-wise ride count between members and casuals shows little to no correlation, i.e., popular member station may or may not be popular with the casuals.
-The daily trend of rides of members and casuals show:
-Members have taken more trips than the casuals, and the ride lengths of the casuals is more than the member(after taking account of the per capita riders)
-The daily average ride length of the members stay consistent throughout the month with slight increases on weekends (12:52 +- 2:00), implying the a large share of members could be the working class/students.
-The daily average ride length of casuals is high as compared to the monthly average on the weekends, implying that the riders use bikes for leisure, and for longer.
-The average week in the month shows daily trends that imply the same as the month's analysis. The ride length of members stay constitent all week, while the casual ride lengths and number of rides increase on weekends.
-The hourly trend on a average day from the month, shows the following:
-For members, the number of rides taken have two 'local peaks': 8-9am and 5-6pm. The 5pm peak is much more than the 8 am local peak, showing that many members would commute to work and back with a bike, some prefer to use a bike only to return home. This strongly suggests a large percentage of members are working class/students.
-For casuals, the peak occurs at 3-4pm, with no indication to work ending hours.

SUMMARY POINTS: (Month-wise)
-March:
 	Average ride_length=22:52, members take 63.22% of all rides, but their avg ride is less than the overall average at 13:58, while casuals have an avg of 38:10.
	The classic_bike is used in 66.76% of all rides.
	Total 228497 trips were taken in March.
-June:
	Average ride_length=26:05, members take 49.19% of all rides, with an avg ride of 14:41, while casual & their rides increasing a significant number, have an avg of 37:07.
	The classic bike is used in 59.62% of all rides.
	Total 729595 trips were taken in June.
-September:
	Average ride_length=20:31, members take 51.88% of all rides, with an avg ride of 13:44, while casuals have a significant lower avg rides (as compared to previous months) at 27:49.
	The classic bike is used in 61.14% of all rides.
	Total 756147 trips were taken in September.

-It is evident that the average ride lengths have a peak in the middle of the year (inspect normal distribution around July).
-The number of rides increases throughout the year, with a plateauing towards September (inspect log dist).
-Both member and casual rides increase, but percentage-wise casual rides significantly increase towards September. (inspect member %s throughout year).
-The classic_bike remains the most popular throughout year and fairly constant %s of rides are riden in them despite the increasing ride numbers: that could hint towards constant riders taking more trips through the year rather than all new rides coming from new riders.
-(from ride_length dist plots)--- 6/8; 10/7; 11/9; 10/7: approx modes for casual/member throughout months---> as evident in the middle of the year, riders prefer to take longer rides, which could be due to members and casuals taking leisure rides due to the middle year breaks.
-(from rideable type plots)--- Little to no docked bikes were used by members in the following months. More classic and docked bike rides were taken by casuals as compared to electric bikes, with a peak in middle of the year.
-(from station ride_count plots)--- The correlation between casual/member popularity of stations kept increasing and had a peak around the middle of the year, suggesting that the mid-year breaks attracted many members to the same stations as casuals started due to the specific leisure routes,etc.
-(from avg_day plots)--- For members, the trend for all months is same as January. For casuals, the peak has shifted towards the 5-6pm evening time.
-(from avg_week plots)--- The avg week shows the same trend as January across all months. The casual rides increase on weekends, while member average rides are constant across the week.
-More member rides are taken in the middle of the week (in the subsequent months to January), but keep the average ride length constant, suggesting that work going/students are more confident to take a bike in the middle of the week.
-(from avg_month)--- The avg month shows almost the same trend as January across all months. The average member ride_lengths remains constants with slight increases on weekends due to slightly longer rides taken(while the number of rides almost remain constant), while casual average ride_lengths & number of rides hugely increase on weekends.

