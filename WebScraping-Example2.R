
library(rvest)
library(tidyverse)
library(stringr)

url_data <- "https://www.eeoc.gov/data/census-2000-special-eeo-file-crosswalk-census-codes-and-2000-soc-codes-eeo-occupational-groups"

## Read URL, and select the node. In this case xpath of table.
url_data2 <- url_data %>%
  read_html() %>% 
  html_nodes(xpath='//*[@id="block-eeoc-uswds-content"]/article/article/section/div/div[1]/div[3]/div/div/div') %>% 
  html_table()

url_data2 <- as.data.frame(url_data2)

# Delete first row. 
url_data2 <- url_data2[-1 , ]

# Clean columns names. Rename
names(url_data2)[1] <- 'Code'
names(url_data2)[2] <- 'Category Title'
names(url_data2)[3] <- '2000 SOC Equivalent Code'
names(url_data2)[4] <- 'EEO-1 Job Catgy (9)'
names(url_data2)[5] <- 'EEO Occ Group (14)'

# Code                     Category Title    2000 SOC Equivalent Code  EEO-1 Job Catgy (9)  EEO Occ Group (14)
# 2  001                    Chief Executives                  11-1011                   1                  1
# 3  002     General and Operations Managers                  11-1021                   1                  1
# 4  003                         Legislators                  11-1031                   1                  1
# 5  004 Advertising and Promotions Managers                  11-2011                   1                  1
# 6  005        Marketing and Sales Managers                  11-2020                   1                  1
# 7  006           Public Relations Managers                  11-2031                   1                  1

# For export csv file:
write.csv(url_data2,"Path to export the DataFrame\\File Name.csv", row.names = FALSE)