library(tidyverse)

# read in data
data1 <- read_delim(file = "Day02_input.txt",
                    col_names = c("count", "letter", "pw"),
                    delim = " ")

# PART 1
# Strip count col into min and max, then keep only first char of letter
data1 <- data1 %>%
  mutate(minC = as.numeric(str_match(count, "[^-]+")),
         maxC = as.numeric(str_match(count, "[^.-]*$")),
         letter2 = str_match(letter, "[^:]+"),
         letterCount = str_count(pw, pattern = letter2),
         valid = ifelse(letterCount >= minC & letterCount <= maxC, 1, 0))

sprintf("No. of valid pw = %s", sum(data1$valid))


# PART 2
# create new vars and check if letter2 is equal to either pos1 or pos2

data1 <- data1 %>%
  mutate(pos1 = as.numeric(str_match(count, "[^-]+")),
         pos2 = as.numeric(str_match(count, "[^.-]*$")),
         letter2 = str_match(letter, "[^:]+"),
         p1valid = ifelse(str_sub(pw, pos1, pos1) == letter2, 1, 0),
         p2valid = ifelse(str_sub(pw, pos2, pos2) == letter2, 1, 0),
         bothValid = ifelse(p1valid == 1 & p2valid == 1, 1, 0)) %>%
  filter(p1valid ==1 | p2valid == 1, bothValid == 0)

sprintf("No. of valid pw = %s", nrow(data1))
