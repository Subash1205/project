# IMPORTING LIBRARIES
library(rvest)
library(dplyr)
library(stringr)
library(robotstxt)

url <- "https://en.volleyballworld.com/volleyball/competitions/vnl-2022/statistics/men/best-attackers/"

path = paths_allowed(url)

web <- read_html (url)
View(web)

playernames <- web %>% html_nodes(".vbw-mu__player") %>% html_text()
View(playernames)

teams <- web %>% html_nodes(".vbw-o-table__cell.federation") %>% html_text()
View(teams)

points <- web %>% html_nodes(".vbw-o-table__cell.attacks") %>% html_text()
View(points)

attemps <- web %>% html_nodes(".vbw-o-table__cell.faults") %>% html_text()
View(attemps)

success <- web %>% html_nodes(".vbw-o-table__cell.success-perc") %>% html_text()
View(success)

total <- web %>% html_nodes(".vbw-o-table__cell.total-attempts") %>% html_text()
View(total)

volleyball = data.frame(playernames, teams, points, attemps,success, total)
View(volleyball )

write.csv(volleyball,"volleyball.csv")

str(volleyball)
