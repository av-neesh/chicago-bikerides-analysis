# chicago-bikes-analysis with **R**
- The Chicago bike data seems to be in good condition and contains lots of entries and with lots of useful data. The data used is from *January 2021* up to *December 2021*.
- All combined R file is [**'chicago-bikeshare-analysis.R'**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/chicago-bikeshare-analysis.r).
- Open the [**Kaggle Markdown**](https://www.kaggle.com/code/avneeshsingh19/chicago-bikeshare-analysis/notebook) or the [**.ipynb notebook**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/chicago-bikeshare-analysis.ipynb) in this directory for more interactive code and viz's.

*Steps:*
- Open RStudio/R-GUI.
- Install the tidyverse package(if not already installed)
- Then call the tidyverse, dplyr for data manipulation, ggplot2 for visualizations, lubridate for date functions, tidyr for data cleaning functions. [although all are already included in the tidyverse, its good practice to call the libraries.]

**DATA LOADING**: Use the [**'load_data.R'**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/load_data.R) script. Then the data is loaded into RStudio as dataframes for further steps.
* Create a datasets folder in the RStudio project.
* Upload the zipped 12 csv files into the folder.
* Read all months csv/excel from local computer folder into datframe with the read_csv/read_excel function with the path set to the project dataset folder that was created.
* Bind all the datframes into a single one for compiled 2021 yearly data.

**DATA PREPARATION & CLEANUP**: Use the [**'prep_data.R'**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/prep_data.R) script.
* Drop the NA values from all the important anlysis columns that are: ride_id, started_at, ended_at, member_casual.
* New column values can be inserted into the dataframe by two main methods: simple column assignment and mutate() function.
* A month column is added by simple assignment. The format function changes the date format into the month string.
* A weekday column is added by simple column assignment. The format function extracts the weekday string from the date.
* A pipeline with the mutate function creates a new ride_length column. The timediff() function returns the ride length in number of seconds (i.e, as drtn interval datatype).
* By simple column calcualtion, the ride_length column is updated to time datatype by seconds_to_period() function.
* All the negative ride_lengths rows(if any) are deleted from the table.
* The geosphere library is installed(if not already installed). And then the package is loaded.
* [Complex]: A new column ride_distance is addd by computing the geographical distances in metres from start point to end point(determined by latitude and longitude).
* This distance is converted to km by dividing by 1000.
* A ride_speed column is added by dividing the ride_distance by the ride_length(converted to number of hours).

**DESCRIPTIVE ANALYSIS**: Use the [**'analysis.R'**](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/analysis.R) script.

**1)** ***Over year user-type stats***:
* A pipeline is created to sumaarize the avg ride length, distance and the number of rides taken by members and casuals over the year.
* The n() function counts the number of entries and register sit as the ride count.
* The mean distance is calculated by omiting all NA values to avoid NaN values in the average calculated.
* The average ride length are calculated by summarizing the mean of the grouped member_casual column.
* Each of the stats are visualized by the ggplot2 library.
* The package gridExtra is installed as it contains the grid.arrange function, that places different plot objects in a grid specified by either the number of rows or/and columns.
![year_ridetype](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/R_Plots/year_ridetype.png)

-> **Conclusions** :
* It seems that the casual users travel the same average distance than the member users, but they have much longer rides, that would indicate a more leisure oriented usage vs a more "public transport" or pragmatic use of the bikes by the annual members.

**2)** ***Over months user-type stats***:
* A pipeline is created to summarize the avg ride length, distance and the number of rides taken by members and casuals over the year.
* The months field previously created is in string 'mmmm'('%B') format, but for orderly printing in viz, a number format is needed, thus a pipeline is created with the mutate function creating the '%m' numeric format month.
* The ride count, avg ride distance and avergae ride length all are created with the same consideration as in the previous stat.
* The results are then arranged first by the numeric format month and then by user type.
* The individual plots for each summarized value is in a side-by-side column graph [i.e, a dodged position, instead of the default stacked position.]
* The viz's are displayed in a row-wise grid with the grid.arrnage function.
![month_usertype](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/R_Plots/month_usertype.png)

-> **Conclusions** :
* The same observations about the ride distance can be made.
* The viz's have the same conclusions as that made from the Tableau plots of the number of rides and the avg ride length of user types over months of year.

**3)** ***Over weekdays user-type stats***:
* A pipeline is for the same three summarized observations from data.
* For the same string arranging discrepancies, the numeric weekday umber column is added via the pipeline by the mutate function.
* Individual plots are created and the arranging of the plot objects is done side-by-side in 3 columns.
![weekday_usertype](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/R_Plots/weekday_usertype.png)

-> **Conclusions** :
* This idea of public transport v/s leisure usage is reinforced by the fact that annual users(i.e, members) have a very stable use of the service during the week, but the casual users are more of a weekend user.

**4)** ***Over year ride-type stats***:
* The whole pipeline visualizes the total rides taken by each ride type and each by the user type.
![year_ridetype](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/R_Plots/year_ridetype.png)

-> **Conclusions** :
* Here we can see that the casual users use both types of bikes for their rides, but the annual members show a clear preference for the classic bikes, which makes sense given the short duration of their rides.
* Both users use classic bike more than the electric bike, and the docked bike is just used by casual users.

**5)** ***Over week ride-type stats***:
* As the docked bikes are not used by the members and casuals use them very less, they are filtered out from the pipe.
* Number of each bike type ride grouped the user type over the average week is calculated and visualized by the pipe.
![weekday_ridetype](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/R_Plots/weekday_ridetype.png)

-> **Conclusions** :
* Over the week we can see that for the annual members there is a small difference of usage between the start of the week, where they prefer the classic bike and the end of the week, where they use more electric bikes.
* For the casual users we see in general the same pattern of usage from the previous weekly charts, preferring the electric vs the classic bikes and having a weekend usage of the service.

**6)** ***Most popular staion and rides by user-type on map***:
* First all the null coordiantes are dropped.
* Then round trip routes are ommited from the analysis [although we know from SQL analysis that they form the majority of popular casual routes] as they are hard to visualize on map.
* Total 250 top routes are selected for viz.
* Chicago bbox are selected as per the half of the screen ratio from bboxfinder.com.
* A Chicago statenmap of terrain type is made, and then the casual and meber maps are created on top of it.
* Both of the plots are placed side-by-side with the grid.arrange function.
![pop_routes_usertype](https://github.com/av-neesh/chicago-bikes-analysis/blob/main/R-analysis/R_Plots/pop_routes_usertype.png)

-> **Conclusions** :
* The coordinates data resulted to be very interesting, as we can clearly see the casual is usually located around the center of the town, with all their trips located around that area which makes sense given that they have a more relaxed leisure rides, on weekends probably also tourist or sightseeing related rides, that naturally focus more on the downtown area where most of the interest points are.
* This contrasts heavily with the longer range of the annual users that connect the downtown with the outskirts of the city, that would suggest they are mostly people that live outside the downtown and use the service to commute everyday to their works in the city.
* For members, there is a particular area with dense rides, and that is the university, which shows that a large proportion of members are university students. Here, the amount of electric bikes used are comparable to that of classic bikes, as most of the trips are very short.
* Also, for casual riders, docked bikes are mostly used while around Chicago harbour.
