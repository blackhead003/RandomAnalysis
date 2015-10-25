library("ggplot2")
library("reshape2")

ns <- read.csv("NS.csv")  # Reading the CSV

# Computing Days with Number of News Pages

newsPages <- data.frame(ns$Date, ns$Full.Page.Ads, I(ns$Total.Pages - ns$Full.Page.Ads))
newsHeading <- c("Date", "FullPageAds", "NewsPages")  # Renaming the columns
names(newsPages) <- newsHeading
newsPages2 <- melt(newsPages)
ggplot(data = newsPages2, aes(x = Date, y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  coord_flip()

# Companies mostly taking the front page

companies <- ns$Front.Page.Ad.By
companies <- strsplit(companies, ",")[[1]]
