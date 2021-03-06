
library(gsheet)

url <- 'https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco <- as.data.frame(gsheet2tbl(url))
str(denco)
head(denco)

#loyal customer
denco %>% group_by(custname) %>% summarise(n=n()) %>% arrange(desc(n))
denco %>% count(custname,sort = T)

# revenue generated by part numbers
denco %>% group_by(partnum) %>% summarise(sum = sum(revenue)) %>% arrange(desc(sum))
