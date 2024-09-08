library(tidyverse)
library(anytime)

df <- read_csv("~/Downloads/FRB_H10 (3).csv", 
            skip = 5)
tail(df)
df
df$time <- anydate(df$`Time Period`)

df %>% 
  gather(key, value, -c(1,25)) %>% 
  ggplot(aes(time, value, color=key)) +
  geom_point()

df %>% 
  gather(key, value, -c(1,25)) %>% 
  ggplot(aes(time, value, color=key)) +
  geom_point() +
  facet_wrap(~key, scales = 'free') +
  theme(legend.position = 'none')

df %>% 
  gather(key, value, -c(1,25)) %>% 
  ggplot(aes(time, value, color=key)) +
  geom_line() +
  facet_wrap(~key, scales = 'free') +
  theme(legend.position = 'none')

df %>% 
  gather(key, value, -c(1,25)) %>% 
  ggplot(aes(time, value, color=key)) +
  geom_smooth() +
  facet_wrap(~key, scales = 'free') +
  theme(legend.position = 'none')

df <- read_csv("~/Downloads/FRB_H10 (3).csv")
df <- df[1:5,]
df

df1 <- as.data.frame(t(df))

df1$Description <- row.names(df1)

tail(df1)

names(df1) <- df1[1,]

df1

row.names(df1) <- seq(1:nrow(df1))

df1

df1 <- df1[-1,]
df1

library(gt)

df1 <- df1[5:6]

df1 %>% 
  gt()
