library(tidyverse)
# read in data
data1 <- read_lines(file = "Day01_input.txt")
# create identical copies
dataA <- data1
dataB <- data1
# create df of all possible combinations
df1 <- crossing(dataA, dataB)
# change data type
df1$dataA <- as.numeric(df1$dataA)
df1$dataB <- as.numeric(df1$dataB)
# perform sum and multiply, then filter for 2020
df2 <- df1 %>%
  mutate(tot = dataA + dataB,
         mul = dataA * dataB) %>%
  filter(tot == 2020)
# view result
df2
