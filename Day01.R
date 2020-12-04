library(tidyverse)
# read in data
data1 <- read_lines(file = "Day01_input.txt")

# PART1
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

# PART2
# create another dataframe with three data vars
dataC <- data1
df1 <- crossing(dataA, dataB, dataC)
# change data type
df1$dataA <- as.numeric(df1$dataA)
df1$dataB <- as.numeric(df1$dataB)
df1$dataC <- as.numeric(df1$dataC)

# perform sum and multiply, then filter for 2020
df2 <- df1 %>%
  mutate(tot = dataA + dataB + dataC,
         mul = dataA * dataB * dataC) %>%
  filter(tot == 2020)
# view result
df2
