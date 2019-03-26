# install.packages("wbstats")
library(wbstats)

query_pop = wbsearch("population")
View(query_pop)

# kod sumy ludności
"SP.POP.TOTL" 

# pobranie populacji Polski od 1996 do 2018
df = wb(country = "POL", 
        indicator = "SP.POP.TOTL",
        startdate = 1996, 
        enddate = 2018)
df

# wykres
library(ggplot2)
ggplot(df, aes(as.numeric(date), value)) +
  geom_line() +
  labs(x = "Rok", y = "Liczba ludności", title = "Polska", subtitle = "Dane pobrane z banku światowego..." ) +
  theme_classic()

# kilka krajów
df2 = wb(country = c("POL", "DEU", "RUS"),
        indicator = "SP.POP.TOTL",
        startdate = 1996, 
        enddate = 2018)
df2

# wykres
ggplot(df2, aes(as.numeric(date), value, color = country)) +
  geom_line() +
  labs(x = "Rok", y = "Liczba ludności", title = "Tytuł", subtitle = "Dane pobrane z banku światowego..." ) +
  facet_wrap(~country, scales = "free_y")

# kilka krajów
df3 = wb(country = "countries_only",
         indicator = "SP.POP.TOTL",
         startdate = 1996, 
         enddate = 2018)

# wykres
ggplot(df3, aes(as.numeric(date), value, color = country)) +
  geom_line() +
  labs(x = "Rok", y = "Liczba ludności", title = "Tytuł", subtitle = "Dane pobrane z banku światowego..." )
