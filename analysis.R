#1
user_type_stat <- tripdata_2021 %>%
	group_by(member_casual) %>%
	summarise(ride_cnt = n(), mean_distance = mean(!is.na(ride_distance)), mean_time = mean(ride_length)) %>%
	arrange(member_casual)

View(user_type_mean)

library(ggplot2)
num_rides <- ggplot(user_type_stat) +
		geom_col(mapping = aes(x = member_casual, y = ride_cnt, fill = member_casual), show.legend = FALSE) +
		labs(title = "Number of rides by User Type", x = "User Type", y = "Number of rides")

library(lubridate)
mean_time_plot <- ggplot(user_type_stat) + 
                geom_col(mapping = aes(x = member_casual, y = hms::hms(seconds_to_period(mean_time)), fill = member_casual), show.legend = FALSE) + 
                labs(title = "Mean travel time by User type", x = "User Type", y = "Mean time in sec")

mean_distance_plot <- ggplot(user_type_stat) + 
                    geom_col(mapping = aes(x = member_casual, y = as.numeric(mean_distance), fill = member_casual), show.legend = FALSE) +
                    labs(title = "Mean travel distance by User type", x = "User Type", y = "Mean distance In km")

install.packages("gridExtra")
library(gridExtra)
grid.arrange(num_rides, mean_time_plot, mean_distance_plot, ncol = 3)

#2
usertype_month_stat <- tripdata_2021 %>%
	mutate(month_num = format(as.Date(started_at), "%m")) %>%
	group_by(month_num, member_casual) %>%
	summarise(ride_cnt = n(), mean_distance = mean(!is.na(ride_distance)), mean_time = mean(ride_length), .groups = "drop") %>%
	arrange(month_num , member_casual)

View(usertype_month_stat)

num_rides <- ggplot(data = usertype_month_stat, mapping = aes(x = month_num, y = ride_cnt, fill = member_casual)) +
		geom_col(position = "dodge", show.legend = FALSE) +
		labs(title = "Number of rides by User Type", x = "Month", y = "Number of rides")

mean_time_plot <- ggplot(data = usertype_month_stat, mapping = aes(x = month_num, y = hms::hms(seconds_to_period(mean_time)), fill = member_casual)) + 
                geom_col(position = "dodge", show.legend = FALSE) + 
                labs(title = "Mean travel time by User type", x = "Month", y = "Mean time in sec")

mean_distance_plot <- ggplot(data = usertype_month_stat, mapping = aes(x = month_num, y = as.numeric(mean_distance), fill = member_casual)) + 
                    geom_col(position = "dodge") +
                    labs(title = "Mean travel distance by User type", x = "Month", y = "Mean distance In km")

grid.arrange(num_rides, mean_time_plot, mean_distance_plot, nrow = 3)

#3
usertype_weekday_stat <- tripdata_2021 %>%
	mutate(day_week = wday(started_at)) %>% 
	group_by(day_week, member_casual) %>%
	summarise(ride_cnt = n(), mean_distance = mean(!is.na(ride_distance)), mean_time = mean(ride_length), .groups = "drop") %>%
	arrange(day_week , member_casual)

View(usertype_weekday_stat)

num_rides <- ggplot(data = usertype_weekday_stat, mapping = aes(x = day_week, y = ride_cnt, fill = member_casual)) +
		geom_col(position = "dodge", show.legend = FALSE) +
		labs(title = "Number of rides by User Type", x = "Days [Sunday=1]", y = "Number of rides")

mean_time_plot <- ggplot(data = usertype_weekday_stat, mapping = aes(x = day_week, y = hms::hms(seconds_to_period(mean_time)), fill = member_casual)) + 
                geom_col(position = "dodge", show.legend = FALSE) + 
                labs(title = "Mean travel time by User type", x = "Days", y = "Mean time in sec")

mean_distance_plot <- ggplot(data = usertype_weekday_stat, mapping = aes(x = day_week, y = as.numeric(mean_distance), fill = member_casual)) + 
                    geom_col(position = "dodge") +
                    labs(title = "Mean travel distance by User type", x = "Days", y = "Mean distance In km")

grid.arrange(num_rides, mean_time_plot, mean_distance_plot, ncol = 3)

#4
bike_type_stat <- tripdata_2021 %>%
			group_by(member_casual,rideable_type) %>%
    			summarise(total_rides = n(), .groups = "drop")  %>%
			ggplot()+
    			geom_col(aes(x = member_casual,y = total_rides, fill = rideable_type), position = "dodge") + 
    			labs(title = "Bike type by user type",x="User type",y=NULL, fill="Bike type") +
    			theme(legend.position="top")
bike_type_stat

#5
weekday_biketype_stat <- tripdata_2021 %>%
				filter(!rideable_type=="docked_bike") %>%
				mutate(weekday = wday(started_at, label = TRUE)) %>% 
    				group_by(member_casual,rideable_type,weekday) %>%
    				summarise(totals=n(), .groups="drop") %>%
				ggplot(aes(x=weekday,y=totals, fill=rideable_type)) +
  				geom_col(position = "dodge") + 
  				facet_wrap(~member_casual) +
  				labs(title = "Bike type by user type during a week",x="User type",y=NULL, fill="Bike Type") +
  				theme(legend.position="right")
weekday_biketype_stat

#6
coordinates_table <- tripdata_2021 %>%
			drop_na(start_lng, start_lat, end_lng, end_lat) %>%
			filter(start_lng != end_lng & start_lat != end_lat) %>%
			group_by(start_lng, start_lat, end_lng, end_lat, member_casual, rideable_type) %>%
			summarise(total = n(), .groups = "drop") %>%
			filter(total > 250)

casual_coord <- coordinates_table %>% filter(member_casual == "casual")
member_coord <- coordinates_table %>% filter(member_casual == "member")

chicago_box <- c(left = -87.812691, bottom = 41.780273, right = -87.541122, top = 41.983994)

install.packages("ggmap")
library(ggmap)
chicago_stamenmap <- get_stamenmap(bbox = chicago_box, zoom = 12, maptype = "terrain")

casual_map <- ggmap(chicago_stamenmap, darken = c(0.4, "white")) +
   		geom_curve(casual_coord, mapping = aes(x = start_lng, y = start_lat, xend = end_lng, yend = end_lat, color=rideable_type), size = 0.5, curvature = .2,arrow = arrow(length=unit(0.2,"cm"), ends="first", type = "closed")) +
		coord_cartesian() +
    		labs(title = "Most popular routes by casual users",x = NULL,y = NULL, color="User type") +
    		theme(legend.position="none")

member_map <- ggmap(chicago_stamenmap, darken = c(0.4, "white")) +
    		geom_curve(member_coord, mapping = aes(x = start_lng, y = start_lat, xend = end_lng, yend = end_lat, color=rideable_type), size = 0.5, curvature = .2,arrow = arrow(length=unit(0.2,"cm"), ends="first", type = "closed")) +  
    		coord_cartesian() +
    		labs(title = "Most popular routes by annual members",x = NULL,y = NULL) +
    		theme(legend.position="none")

library(gridExtra)
grid.arrange(casual_map, member_map, ncol=2)