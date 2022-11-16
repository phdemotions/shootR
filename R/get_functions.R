Sys.setenv(VROOM_CONNECTION_SIZE=500072)
library(nbastatR)
library(magrittr)
library(dplyr)
library(here)
library(readr)

## get NBA.com player dictionary
get_nbastatR_players <- function(){
nbastatR::assign_nba_players()

df <- df_dict_nba_players %>%
  dplyr::select(namePlayer, idPlayer, yearSeasonFirst, yearSeasonLast, urlPlayerStats) %>% 
  dplyr::rename(idPlayer_nbacom = idPlayer,
                urlPlayerStats_nbacom = urlPlayerStats,
                seasonFirst_nbacom= yearSeasonFirst, 
                seasonLast_nbacom= yearSeasonLast)

readr::write_csv(df, here::here("data/players_nbastatR.csv"))
saveRDS(df, here::here("data/players_nbastatR.rds"))

# rm(df, df_dict_nba_players)  
}

get_nbastatR_players()
