
library(rvest)
library(tidyverse)
library(stringr)

### Load the URL

url_data <- "https://www.immd.gov.hk/eng/stat_20220901.html"

## Read URL, and select the node. In this case xpath of table.
url_data2 <- url_data %>%
  read_html() %>% 
  html_nodes(xpath=' /html/body/section[2]/div/div/div/div/table/tbody') %>% 
  html_table()

url_data2 <- url_data2[[1]]

# for select the specify columns, because show many not necesary.
url_data2 <- url_data2[ , -c(1:3, 5, 10)]

# Change the names of columns variables
names(url_data2)[1] <- 'Variables'
names(url_data2)[2] <- 'A_Hong_Kong_Residents'
names(url_data2)[3] <- 'A_Mainland_Visitors'
names(url_data2)[4] <- 'A_Other_Visitors'
names(url_data2)[5] <- 'A_Total'
names(url_data2)[6] <- 'D_Hong_Kong_Residents'
names(url_data2)[7] <- 'D_Mainland_Visitors'
names(url_data2)[8] <- 'D_Other_Visitors'
names(url_data2)[9] <- 'D_Total'

View(url_data2)

# # A tibble: 16 x 9
# Variables       A_Hong_Kong_Res~ A_Mainland_Visi~ A_Other_Visitors A_Total D_Hong_Kong_Res~ D_Mainland_Visi~ D_Other_Visitors D_Total
# <chr>           <chr>            <chr>                       <int> <chr>   <chr>            <chr>                       <int> <chr>  
# 1 Airport         4,258            1,488                         422 6,168   3,775            1,154                         315 5,244  
# 2 Express Rail L~ 0                0                               0 0       0                0                               0 0      
# 3 Hung Hom        0                0                               0 0       0                0                               0 0      
# 4 Lo Wu           0                0                               0 0       0                0                               0 0      
# 5 Lok Ma Chau Sp~ 0                0                               0 0       0                0                               0 0      
# 6 Heung Yuen Wai  0                0                               0 0       0                0                               0 0      
# 7 Hong Kong-Zhuh~ 333              28                             39 400     243              194                            15 452    
# 8 Lok Ma Chau     0                0                               0 0       0                0                               0 0      
# 9 Man Kam To      0                0                               0 0       0                0                               0 0      
# 10 Sha Tau Kok     0                0                               0 0       0                0                               0 0      
# 11 Shenzhen Bay    3,404            348                            37 3,789   1,301            524                            28 1,853  
# 12 China Ferry Te~ 0                0                               0 0       0                0                               0 0      
# 13 Harbour Control 0                0                               0 0       0                0                               0 0      
# 14 Kai Tak Cruise~ 0                0                               0 0       0                0                               0 0      
# 15 Macau Ferry Te~ 0                0                               0 0       0                0                               0 0      
# 16 Total           7,995            1,864                         498 10,357  5,319            1,872                         358 7,549  

