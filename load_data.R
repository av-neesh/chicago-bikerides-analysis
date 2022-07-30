install.packages("tidyverse")

library(tidyverse)
library(tidyr)

library(readr)
tripdata_202112 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202112-divvy-tripdata.csv")
tripdata_202111 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202111-divvy-tripdata.csv")
tripdata_202110 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202110-divvy-tripdata.csv")
tripdata_202109 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202109-divvy-tripdata.csv")
tripdata_202108 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202108-divvy-tripdata.csv")
tripdata_202107 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202107-divvy-tripdata.csv")
tripdata_202106 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202106-divvy-tripdata.csv")
tripdata_202105 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202105-divvy-tripdata.csv")
tripdata_202104 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202104-divvy-tripdata.csv")
tripdata_202103 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202103-divvy-tripdata.csv")
tripdata_202102 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202102-divvy-tripdata.csv")
tripdata_202101 <- read_csv("E:/AVNEESH/Projects/DA/case_studies/cyclisist/compiled/2021/202101-divvy-tripdata.csv")

library(dplyr)
tripdata_2021 <- bind_rows(tripdata_202101, tripdata_202102, tripdata_202103, tripdata_202104, tripdata_202105, tripdata_202106, tripdata_202107, tripdata_202108, tripdata_202109, tripdata_202110, tripdata_202111, tripdata_202112)

glimpse(tripdata_2021)