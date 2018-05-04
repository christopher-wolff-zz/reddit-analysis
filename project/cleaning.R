library(tidyverse)
library(lubridate)

posts_00 <- read_csv('data/raw/posts-00.csv')
posts_01 <- read_csv('data/raw/posts-01.csv')
posts_02 <- read_csv('data/raw/posts-02.csv')
posts_03 <- read_csv('data/raw/posts-03.csv')
posts_04 <- read_csv('data/raw/posts-04.csv')
posts_05 <- read_csv('data/raw/posts-05.csv')
posts_06 <- read_csv('data/raw/posts-06.csv')
posts_07 <- read_csv('data/raw/posts-07.csv')
posts_08 <- read_csv('data/raw/posts-08.csv')
posts_09 <- read_csv('data/raw/posts-09.csv')
posts_10 <- read_csv('data/raw/posts-10.csv')
posts_11 <- read_csv('data/raw/posts-11.csv')
posts_12 <- read_csv('data/raw/posts-12.csv')
posts_13 <- read_csv('data/raw/posts-13.csv')
posts_14 <- read_csv('data/raw/posts-14.csv')
posts_15 <- read_csv('data/raw/posts-15.csv')
posts_16 <- read_csv('data/raw/posts-16.csv')
posts_17 <- read_csv('data/raw/posts-17.csv')

posts <- rbind(
  posts_00, posts_01, posts_02, posts_03, posts_04,  posts_05,
  posts_06, posts_07, posts_08, posts_09, posts_10, posts_11,
  posts_12, posts_13, posts_14, posts_15, posts_16, posts_17
)

rm(
  posts_00, posts_01, posts_02, posts_03, posts_04,  posts_05,
  posts_06, posts_07, posts_08, posts_09, posts_10, posts_11,
  posts_12, posts_13, posts_14, posts_15, posts_16, posts_17
)

posts <- mutate(
  posts,
  created_date = as.POSIXct(created_utc, origin = "1970-01-01") + 5 * 60 * 60,
  created_month = month(created_date),
  created_day = day(created_date),
  created_hour = hour(created_date),
  created_minute = minute(created_date),
  retrieved_date = as.POSIXct(retrieved_on, origin = "1970-01-01") + 5 * 60 * 60,
  retrieved_month = month(retrieved_date),
  retrieved_day = day(retrieved_date),
  retrieved_hour = hour(retrieved_date),
  retrieved_minute = minute(retrieved_date)
)

write_csv(posts, 'data/reddit-posts.csv')

christmas_posts <- filter(
  posts,
  created_month == 12,
  created_day == 24 | created_day == 25
)

write_csv(christmas_posts, 'data/reddit-posts-christmas.csv')
