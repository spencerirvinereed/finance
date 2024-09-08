library(tidyverse)
library(anytime)

df <- read_csv("data/FRB_H6.csv", skip = 5)
df

df$time <- anydate(df$`Time Period`)

df %>% 
  ggplot(aes(time, M1_N.M)) +
  geom_point()

df %>% 
  ggplot(aes(time, M1_N.M)) +
  geom_line()

df %>% 
  ggplot(aes(time, M1_N.M)) +
  geom_smooth()

df %>% 
  ggplot(aes(time, M2_N.M)) +
  geom_point()

df %>% 
  ggplot(aes(time, M2_N.M)) +
  geom_line()

df %>% 
  ggplot(aes(time, M2_N.M)) +
  geom_smooth()

df %>% 
  gather(key, value, -c(1,31)) %>% 
  ggplot(aes(time, value, color=key)) +
  geom_point()

df %>% 
  gather(key, value, -c(1,31)) %>% 
  ggplot(aes(time, value, color=key)) +
  geom_line() +
  theme(legend.position = 'none') +
  facet_wrap(~key, scales = "free")

df <- read_csv("data/FRB_H6.csv")
df <- df[1:5,]
df

df1 <- as.data.frame(t(df))

df1$Description <- row.names(df1)

df1

names(df1) <- df1[1,]

df1

row.names(df1) <- seq(1:nrow(df1))

df1

df1 <- df1[-1,]
df1

library(gt)

names(df1)[5] <- "Series"
names(df1)[6] <- "Description"

df1 %>% 
  select(5:6) %>% 
  gt()
