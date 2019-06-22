
View(mpg)
install.packages("tidyr")
install.packages("tidyverse")
library(readr)
library(tidyr)
library(tidyverse)
library(dplyr)
library(datasets)
library(nycflights13)
View(mpg)

ggplot(data = mpg) +
  geom_histogram(mapping = aes(x = displ, fill = class)) +
  coord_flip()
head(mpg, 20)

View(mpg)
mpg[10:230, c(1, 3, 5, 8, 9)]
plot()
hist(x = mpg)
head(mpg)
View(cars)
plot(displ, hwy)
plot(cars)
lines(lowess(cars))
View(mtcars)

plot(x = mtcars$wt, y = mtcars$mpg)
plot()

#plot(x = mpg$displ , y = mpg$cty, type = "p", main = " ")
#title(main = list("Histogram of Displacement vs City2"),
#cex.main = 1.2, col.main = 'blue', font.main = 12, xlab = "City", ylab = "Displacement")+
#  labs(x = "City", y)

#xlab(c("City", font.lab = 1, cex.lab = 1, col.lab = 'red'))
#ylab("Displacement", c( font.lab = 2, cex.lab = 2, col.lab = 'red'))


#hist(mpg$displ, col = 'Blue', labels = TRUE, label = 'Displacement')

plot(sin,-pi, 2 * pi) # see ?plot.function

## Discrete Distribution Plot:
plot(
  table(rpois(100, 5)),
  type = "h",
  col = "red",
  lwd = 10,
  main = "rpois(100, lambda = 5)"
)

a <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = cty, y = hwy, color = class),
             show.legend = TRUE)

ggsave("CTY HWY.jpg", width = 7, height = 5)
getwd()

a + geom_vline(aes(xintercept = 25.38))

a + geom_segment(aes(
  y = 5,
  x = 5,
  yend = 29 + 1,
  xend = 20 + 5
))

a + geom_spoke(aes(
  x = 30,
  y = 25,
  angle = 1:234,
  radius = 6
))

a + geom_area(aes(x = 10, y = 1, stat = "bin"))

a + geom_density(aes(x = 10, y = 20, kernel = "gaussian"))

a + geom_dotplot()

head(cars)
dfd <- data.frame(1:4, c('s', 'i', 'm', 'p'))
dfd
vt <- data.frame(1:14)

ab <- ggplot(vt)

ab + geom_dotplot(mapping = aes())
ab + geom_area(stat = "T")
dfd <- read.csv('WWWusage.csv')

View(WWWusage)
ggplot(dfd, aes()) + geom_histogram()

ab <- ggplot(dfd, aes())
ab + geom_freqpoly(mapping = aes(x = 10, bins = 60))

dfd1 <- ggplot(mpg, aes(cty))
dfd1 + geom_histogram(, labels = TRUE)

#one  variable - discrete
ggplot(mpg, aes(drv)) + geom_bar()
ggplot(data = mpg, mapping =  aes(drv)) + geom_bar()

#two variables - continuous x, continuous y
e <- ggplot(mpg, aes(cty, hwy))

e + geom_label(
  aes(label = cty),
  nudge_x = 1,
  nudge_y = 1,
  check_overlap = TRUE
)

e + geom_jitter()

e + geom_point(aes(color = class), size = 5)

e + geom_quantile(aes(color = class), size = 1.5)

e + geom_rug(aes(color = class), size = 5)

e + geom_smooth(size = 3)

e + geom_text(aes(label = cty, color = class))

#two variables, continuous X - discrete Y
f <- ggplot(mpg, aes(class, hwy))
f + geom_col()

#two variables, discrete X - discrete Y
fg <- ggplot(diamonds, aes(cut, color))

fg + geom_count(shape = 21)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,), color = "blue")

#Facets
#two varaibles
ggplot(mpg) +
  geom_point(aes(displ, cty, color = drv), size = 1.5) +
  facet_wrap( ~ class, nrow = 2)

#three variables
ggplot(mpg) +
  geom_raster(aes(displ, hwy, fill = trans)) +
  facet_wrap( ~ class, nrow = 1)


ggplot(mpg) +
  geom_point(aes(displ, cty)) +
  facet_grid(drv ~ cyl, scales = "free")


ggplot(mpg) +
  geom_point(aes(displ, hwy)) +
  facet_grid(class ~ ., labeller = label_bquote(alpha ^ .(class)))


ggplot(mpg) +
  geom_point(aes(displ, hwy)) +
  facet_grid(. ~ cty)

view(mpg)

#3.6 Geometric objects
ggplot(data = mpg) +
  geom_smooth(aes(displ, hwy, linetype = drv, color = drv)) +
  geom_point(aes(displ, hwy, color = drv))

ggplot(data = mpg) +
  geom_smooth(aes(displ, cty, linetype = drv, color = drv)) +
  geom_smooth(aes(displ, hwy, linetype = drv),  color = "blue")

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "compact"))

#Excerize
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy, size = 2),
    show.legend = FALSE
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(
      x = displ,
      y = hwy,
      group = drv,
      size = 1
    ),
    show.legend = FALSE,
    se = FALSE
  )


ggplot(mpg) +
  geom_point(aes(displ, hwy , color = drv)) +
  geom_smooth(aes(displ, hwy, group = drv, color = drv), se = FALSE)


ggplot(mpg) +
  geom_point(aes(displ, hwy , color = drv)) +
  geom_smooth(aes(displ, hwy), se = FALSE)

#3.7 Statistical transformations

ggplot(diamonds) +
  geom_bar(aes(cut, fill = cut))

ggplot(diamonds) +
  stat_count(aes(x = cut))

#using stat
ggplot(diamonds) +
  stat_summary(
    aes(cut, depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = mean
  )

#using coresponding geom to stat_summary
ggplot(data = diamonds) +
  geom_pointrange(
    aes(cut, depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = mean,
    stat = "summary"
  )

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.. , group = 1))

#no meaning
ggplot(diamonds) +
  geom_bar(aes(cut, y = ..prop.., color = "smooth"))

#3.8 Position adjustments
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(diamonds, aes(cut)) +
  geom_bar() +
  facet_grid(. ~ clarity)


ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +
  geom_bar(fill = NA, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge") +
  facet_grid(clarity ~ .)

View(flights)


ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot(color = class)


##chapter 5 Data transformation
#5.2 Filter rows with filter()

(ch2df <- filter(flights, month == 1, day == 2))
View(ch2df)

#5.2.1 Comparisons
near(sqrt(9), 3)

filter(flights, month == 11 | month == 12)

(filter(flights, arr_delay <= 0, dep_delay <= 0))

#Exercise

(filter(flights, dest == "IAH" | dest == "HOU"))

(filter(flights, carrier == "American" | carrier == "Delta"))

#Filter()
ggplot(data = filter(mpg, displ > 3),
       x = drv,
       y = hwy) +
  geom_point(aes(
    x = cty,
    y = hwy,
    color = class,
    alpha = drv
  ),
  size = 5,
  position = "jitter")

ggt <- arrange(flights, air_time)
View(ggt)

(select(mpg, manufacturer, ends_with("l")))

(select(mpg, manufacturer, matches("cy")))

ggplot(select(mpg, manufacturer, cty, hwy, num_range("displ", 4:6))) +
  geom_point(aes(cty, hwy, color = class))

select(flights, year, month, day, arr_time, year)

? one_of

select(flights, contains("Time", ignore.case = FALSE))

sqll <-
  select(flights, year:day, ends_with("delay"), air_time, distance)
sqll2 <-
  mutate(
    sqll,
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    is.na = TRUE
  )
ggplot(sqll2, aes(speed, gain, color = year)) +
  geom_point()

#14/3 5.4 Select columns with select()

(summaris(mpg))

(count(mpg))

fff <- mpg +
  group_by(cyl) +
  ggplot(aes (displ, cty)) +
  geom_point()

mpg %>% group_by(cyl, drv)

distinct(flights, keep_all = FALSE)

sample_frac(mpg, size = 0.1, replace = FALSE)

top_n(mpg, 5, displ)

sample_n(mpg, 20, replace = TRUE)

View(arrange(mpg, desc(displ)))

by_day <- group_by(flights, year, month, day)
View(summarise(
  by_day,
  delay = mean(dep_delay, na.rm = TRUE),
  max_delay = max(arr_time, na.rm = TRUE)
))

by_dest <- group_by(flights, dest)
by_dest2 <-
  summarise(
    by_dest,
    count = n(),
    delay = mean(arr_delay, na.rm = TRUE),
    dist = mean(distance, na.rm = TRUE)
  )
ggplot(by_dest2, aes(dist, delay)) +
  geom_smooth(se = FALSE) +
  geom_point(aes(size = count), alpha = 1 / 3)



delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    delay = mean(arr_delay, na.rm = TRUE),
    dist = mean(distance, na.rm = TRUE)
  ) %>%
  ggplot(aes(dist, delay)) %>%
  geom_smooth(se = TRUE) %>%
  geom_point(aes(size = 3), alpha = 1/3)

glimpse(flights)


##############################
delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delayw = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")

ggplot(delays, aes(dist, delayw)) +
  geom_point(aes(size = count), alpha = 1 / 3) +
  geom_smooth(se = FALSE)

##############################
delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)  
  )

ggplot(delays, aes(delay)) + 
  geom_freqpoly(binwidth = 10)

#################### working
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )

ggplot(data = delays, mapping = aes(x = delay)) + 
  geom_freqpoly(binwidth = 10)

###################
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)
            n = n())

ggplot(delays, aes(n, delay)) +
  geom_point(alpha = 1/10)
###############

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE),
            n = n()) #%>% 
#  filter(n>100)

ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1 / 10)

###############
glimpse(not_cancelled %>% 
  group_by(year, month, day) %>% 
  mutate(r = min_rank(desc(dep_time))) %>% 
  filter(r %in% range(r)))

##################
View(not_cancelled %>% 
  group_by(year, month, day) %>% 
  arrange(year, month, day))
############
not_cancelled %>% 
  group_by(dest) %>% 
  summarise(n = n_distinct(carrier)) %>% 
  arrange(desc(n))

###########
daily <- group_by(flights, year, month, day)
(per_day <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, count = sum(flights)))
(per_year <- summarise(per_month, count = n()))
distinct(flights, year)

###########
smaller <- diamonds %>%
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

ggplot(smaller, aes(carat, colour = cut)) +
  geom_freqpoly(binwidth = 0.1)

############

expl <- diamonds %>% 
  filter((x > 0.5 & y > 0.5) %>% 
  select(price, x, y z) %>% 
  arrange(y)
  expl
  #######
  unusual <- diamonds %>% 
    filter(y < 3 | y > 20) %>% 
    select(price, x, y, z) %>%
    arrange(y)
  
  unusual
  #####
  unusual <- diamonds %>%
  # filter(y > 3 & x > 3) %>%
  select(price, x, y, z) %>%
  arrange(y)
  ggplot(unusual, aes(y/x/z, price))+
  geom_point(na.rm =  TRUE)+
  coord_cartesian(xlim =c(0.1,0.4))
  
  
  unusual <- diamonds %>%
  #filter(y > 3 & x > 3) %>%
  select(price, x, y, z) %>%
  arrange(y)
  ggplot(unusual, aes(x/z, price))+
  geom_point()
  ###########
  prices <- diamonds %>%
  select(price, carat, cut)

  ggplot(prices, aes(price)) +
  geom_freqpoly(binwidth = 100, aes(color  = cut), size = carat) +
  coord_cartesian(xlim = c(0, 7000))
  
  diamonds %>% 
    group_by(carat) %>% 
    filter(carat == 1) %>% 
    #summarise(tcount = n()) %>% 
    select(carat, cut)
  ggplot(diamonds, aes(cut, fill = color))+
    geom_bar()
  #################
  
  
  
  fff <-   nycflights13::flights %>%
    mutate(
      cancelled = is.na(dep_time),
      sched_hour = sched_dep_time %/% 100,
      sched_minute = sched_dep_time %% 100,
      sched_dep_time = sched_hour + sched_minute / 30
    ) %>%
    
    ggplot(aes(sched_dep_time)) +
    geom_freqpoly(binwidth = 1 / 2)
  
  flights
  
  diamonds %>%
    mutate(emptycarat = is.na(carat)) %>%
    ggplot(aes(emptycarat)) +
    geom_bar()
  
   
  tibble(
    a = lubridate::now() + runif(1e3) * 86400,
    b = lubridate::today() + runif(1e3) * 30,
    c = 1:1e3,
    d = runif(1e3),
    e = sample(letters, 1e3, replace = TRUE)
  )
  ddd <- mpg %>% 
    print(n = 8, width = 8)
  print(as.data.frame(mpg))
  
  
  df <- data.frame(abc = 1, xyz = "a")
  df$x
  df[, "xyz"]
  df[, c("abc", "xyz")]
  
  tbb <- tibble(
    `abc` = 1,
    `xzy` = "a"
  )
  
  tbb$abc
  tbb$xzy
  
  ?tibble::enframe
  ?option
  ?runif
  runif(1)
  set.seed(2)
  runif(1)
  runif(1e3)
  lubridate::now()
  lubridate::today()
  f = 1:1e3
  
  tibble(
    a = lubridate::now(),# + runif(1e3) * 86400,
    b = lubridate::today(),# + runif(1e3) * 30,
    c = 1:1e3,
    d = runif(1e3) * 10,
    e = sample(letters, 1e3, replace = TRUE)
  )
  tibble(
    a = lubridate::now() + runif(1e3) * 86400,
    b = lubridate::today() + runif(1e3) * 30,
    c = 1:1e3,
    d = runif(1e3),
    e = sample(letters, 1e3, replace = TRUE)
  )
  
  
  
  read_csv("h,w,g
           1,2,3
           4,5,6")
  
  read_csv("1,2,3\n4,5,6")
  
  read.csv("h,w,g
           1,2,3
           4,5,6") 
  
  read_csv("h,w,g
           1,2,3
           4,5,6")
  
  read_csv("h,w,q
           1,2,3
           4,5,6")
  
  read_csv("the first lin
  to the csv fine
           a,b,c
           1,2,3
           4,5,6", skip = 2)
  
  
  
  read_csv("The first line of metadata
           The second line of metadata
           x,y,z
           1,2,3",
           skip = 2)
  
  read_csv("The first line of metadata
           The second line of metadata
           x,y,z
           1,2,3",
           skip = 2)
  
  
  read_csv("# A comment I want to skip
           x,y,z
           1,2,3", comment = "#")
  
  read_csv("# A comment I want to skip
           x,y,z
           1,2,3", comment = "#")
  
  ?read_fwf
  ?read_delim
  
  
  
  read_delim(delim = ",",file = "x,y\n1,'a,b'")
  
  read_csv("a,b\n1,2,3\n4,5,6")
  
  read_csv("a,b,c\n1,2\n1,2,3,4")
  
  read_csv("a,b\n\"1")
  
  read_csv("a,b\n1,2\na,b")
  
  read_csv("a;b, c;d\n1:3\n4:6")
  
  x <- parse_integer(c("123", "345", "abc", "123.45"))
  x
  
  
  tribble(
    ~x, ~y, ~z,
    "a", 2, 3.6,
    "b", 1, 8.4
  )
  
  tribble(
    ~x, ~y, ~f,
    3, "d", 12,
    8, 5, 22
  )
  
  nycflights13::flights %>% 
    print(n = 12, width = Inf)
  
  daa <- tibble(
    X = runif(5),
    Y = runif(5) 
  )
  
  daa$X
  daa %>% .$X
  daa[["X"]]
  daa[[2]]
  
  fruit <- c("apple", "banana")
  parse_factor(c("apple", "banana", "bananana"), levels = fruit)
  
  charToRaw("Yusuf")
  ?locale()
  ?data_format
  ?parse_date
  parse_number("123,456,789.123", locale = locale( grouping_mark  = ",", decimal_mark = "."))
  
  
  parse_number("123,456,789,923", locale = locale(grouping_mark =  "."))
  
  parse_number("123.456.789.923", locale = locale(decimal_mark =  ","))
  
  d1 <- "January 1, 2010"
  d2 <- "2015-Mar-07"
  d3 <- "06-Jun-2017"
  d4 <- c("August 19 (2015)", "July 1 (2015)")
  
  d5 <- "12/30/14" # Dec 30, 2014
  t1 <- "1705"
  t2 <- "11:15:10.12 PM"
  parse_date(d1, "%B %d, %Y")
  parse_date(d4, "%B %d (%Y)")
  
  parse_date(d5, "%m/%d/%y")
  
  library(hms)
  parse_date("January 1, 2010", "%d %B %y", locale = locale(date_names = "en"))
  
  parse_date("2015-Mar-07", "%Y-%b-%d")
  
  parse_date("01/02/15", "%m/%d/%y")
  
  library(haven)
  ?haven
  table4a
  gather(table4a, '1999', '2000', key = "Year", value = "cases")
  
  table2
  spread(table2, year, count)
  spread(table2, country, year)
  
  spread(table2, year, count)
  table4b
  
  table1
  ?count
  table1 %>% 
    count(year)
  
  ggplot(table1, aes(year, cases))+
    geom_line(aes(group = country), color = "Grey50")+
    geom_point(aes(color = country))
  
  table2
  table4a
  table4b
  
  table2 %>% 
    filter(type == "cases") %>% 
    mutate(rate = type / population * 10000)
  --------------------
    
    t2_cases <- filter(table2, type == "cases") %>%
    rename(cases = count) %>%
    arrange(country, year)
  
  t2_population <- filter(table2, type == "population") %>%
    rename(population = count) %>%
    arrange(country, year)
  
  
  
  t2_cases_per_cap <- tibble(
    year = t2_cases$year,
    country = t2_cases$country,
    cases = t2_cases$cases,
    population = t2_population$population
    
  ) %>%
    mutate(cases_per_cap = cases / population * 10000) %>%
    arrange(country, year, rate_per_cap)
  
  
  t2_cases_per_cap <- t2_cases_per_cap %>%
    mutate(type = "cases_per_cap") %>%
    rename(count = cases_per_cap)
  
  bind_rows(table2, t2_cases_per_cap) %>% 
    arrange(country, year, cases, population)
  
  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  =

    table4a
  table4b
  
  
  
  
  table4c <- tibble(
    country = table4a$country, 
    `1999` = table4a[["1999"]] / table4b[["1999"]] *10000,
    `2000` = table4a[["2000"]] / table4b[["2000"]] *10000,
  )
    table4c
    
    table2
    table55 <- filter(table2, type == "cases")
    ggplot(table55, aes(cases, year))+
      geom_line(aes(group = country))+
      geom_point(aes(color = country))
    table1
    table4a <- table4a %>% 
      gather(`1999`, `2000`, key = year, value = cases)
    table4b <- table4b %>% 
      gather(`1999`, `2000`, key = year, value = population)
    left_join(table4a, table4b)
    table1
    right_join(table4a, table4b)
    
    spread(table2, key = type, value = count)
    stocks <- tibble(
      year   = c(2015, 2015, 2016, 2016),
      half  = c(   1,    2,     1,    2),
      return = c(1.88, 0.59, 0.92, 0.17)
    )
    
    stocks %>%
      spread(year, return)
    stocks %>%
      gather("year", "return", key = `2015`, value = `2016`)
    
    stocks %>% 
      spread(year, return) %>% 
      gather(`2015`, `2016`, key = year, value = return)
      
      table4a %>% 
        spread(year, cases)
      
      people <- tribble(
        ~name,             ~key,    ~value,
        #-----------------|--------|------
        "Phillip Woods",   "age",       45,
        "Phillip Woods",   "height",   186,
        "Phillip Woods",   "age",       50,
        "Jessica Cordero", "age",       37,
        "Jessica Cordero", "height",   156
      ) 
      people %>% 
        rename(key = factor)
      
      people %>% 
        spread(key = key, value = value)
      
      glimpse(people)
  spread(people, key, value)
  
  people2 <- people %>%
    group_by(name, key) %>%
    mutate(obs = row_number())
  people2
  
  
  
  table3 %>%
    separate(rate, into = c("cases", "population"), sep = "/")
  table3 %>%
    separate(rate, into = c("cases", "population"), sep = "/")
  
  stocks %>% 
    complete(year, half)
  
  stock <- tibble(
    year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
    qtr    = c(   1,    2,    3,    4,    2,    3,    4),
    return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
  )
  stock %>% 
    spread(year, return)
  who1 <-  who %>% 
    gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)

    who2 <- who1 %>% 
    mutate(Key = stringr::str_replace(key, "newrel", "new_rel"))
    
    who3 <- who2 %>% 
      separate(key, into = c("new", "typt", "sexage"), sep = "_")
    
    who4 <- who3 %>% 
      select(-iso2, -iso3, -new)
    
    who5 <- who4 %>% 
      separate(sexage, into = c("sex", "age"), sep = 1)
    
    who5 %>% select(-Key)
    who
    
    whox <-  who %>% 
      gather(key, value, new_sp_m014:newrel_f65) %>%
     # mutate(key = stringr::str_replace(key, "newrel_f65", "new_rel")) %>% 
      separate(key, into = c("new", "var", "sexage")) %>% 
      select(-new, -iso2, -iso3) %>% 
      separate(sexage, into = c("sex", "age"), sep = 1)
    
    View(whox)
    
    whox %>%
      count(NA)
    
    whox1  <- whox %>%  
      group_by(country) %>% 
      count()
    ggplot(whox, aes(country))+
      geom_bar()+
      coord_flip()
    
    whox %>% 
      
       
        ccvv <- group_by(whox, country, year, sex) %>% 
        summarise(count = n())
      
        ggplot(ccvv, aes(year, country))+
          geom_point(alpha  = 1/10)
      
library(lahman)        
        Lahman::Batting,
        babynames::babynames
        nasaweather::amtos
        fueleconomy::vehicles
        ggplot2::diamonds
        View(flights)
        
        flights %>% 
          count(year, month, day, tailnum) %>% 
          filter(n > 1)
        
airlines

flights2 <- nycflights13::flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)
        
flights2 %>% 
  select(-dest, -origin) %>% 
  left_join(airlines, by = "carrier")

flights2 %>% 
  left_join(airports, c("dest" = "faa"))

#join
  airports %>%
  semi_join(flights2, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()
  planes
  
  kl <- flights2 %>% 
    group_by(dest)%>%
    summarise(avg_delay = mean(flights2$arr_delay)) %>% 
    ggplot(aes(flight, avg_delay))+
    geom_freqpoly()
    
    
    airports %>%
    semi_join(flights2, c("faa" = "dest")) %>%
      mutate(lon, lat) %>% 
    ggplot(aes(lon, lat)) +
    borders("state") +
    geom_point() +
    coord_quickmap()
    
    
    
    
    
    flights3 <- nycflights13::flights
    
    flights3 %>%
      group_by(dest) %>%
      rename(fyear = year) %>% 
      select(fyear:day, origin, dest, tailnum, arr_delay) %>% 
      left_join(planes, by = "tailnum") %>%
      ggplot(aes(year, arr_delay)) +
      geom_point(aes( color = manufacturer, alpha = 1/4 ),na.rm = TRUE)
    
    flights3
    weather
    
    
    flights3 %>%
      left_join(weather) %>%
    #  mutate(lon, lat) %>%
      select(year, month, day, time_hour, arr_delay, temp, humid, wind_speed) %>% 
      ggplot(aes(temp, arr_delay)) +
      geom_point() 
    
    
    
    flights3 %>%
      inner_join(weather) %>%
      #  mutate(lon, lat) %>%
      select(year, month, day, time_hour, arr_delay, temp, humid, wind_speed) %>% 
      ggplot(aes(wind_speed, arr_delay)) +
      geom_point() 
    
    
    flights3 %>%
      inner_join(weather) %>%
      #  mutate(lon, lat) %>%
      select(year, month, day, time_hour, arr_delay, temp, humid, wind_speed) %>% 
      ggplot(aes(humid, arr_delay)) +
      geom_point() 
    
    
    flights3 %>%
      inner_join(weather) %>%
      #  mutate(lon, lat) %>%
      select(year, month, day, time_hour, arr_delay, temp, humid, wind_speed) %>% 
      ggplot(aes(humid,  wind_speed)) +
      geom_tile(aes(fill = arr_delay), width = 2) 
    
    
    
    flights3 %>%
      semi_join(airports, by = c( "dest" = "faa")) %>%
      mutate(airports$lon, airports$lat) %>% 
      select(year, month, day, arr_delay, lon, lat) %>%
      filter(year = 2013, month = 6, day = 13) %>% 
      ggplot(aes(lon, lat)) +
      borders("state") +
      geom_point(size = arr_dealy) +
      coord_quickmap()
    
    airports
    weather
    
    ?inner_join
    
    top_flight <- flights2 %>% 
      count(dest, sort = TRUE) %>% 
      head(10)
    top_flight
    
    flights2 %>% 
      filter(dest %in% top_flight$dest)
    
    flights2 %>% 
      semi_join(top_flight)
    
    flights2 %>% 
      anti_join(planes, by = "tailnum") %>% 
      count(tailnum, sort = TRUE)
    
    flights2 %>% 
      anti_join(planes, by = "tailnum") %>% 
      count(carrier, sort = TRUE)
    
    
    fflights <- flights2 %>%
      group_by(tailnum) %>% 
      count(tailnum > 100)
    
    ffy <- flights2 %>%
      group_by(tailnum) %>%
      count() %>%
      filter(n > 100)
     
     flights2 %>% 
       semi_join(ffy, by = "tailnum")

     fueleconomy::vehicles
     nycflights13::flights