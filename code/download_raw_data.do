clear all
set more off

import delimited using ///
    "https://fred.stlouisfed.org/graph/fredgraph.csv?id=UNRATE", ///
    varnames(1) stringcols(1) clear

rename (observation_date unrate) (date unrate)
drop if missing(date)
duplicates drop date, force
sort date

save "data/raw/unrate_raw.dta", replace

clear
import delimited using ///
    "https://fred.stlouisfed.org/graph/fredgraph.csv?id=CPIAUCSL", ///
    varnames(1) stringcols(1) clear

rename (observation_date cpiaucsl) (date cpi)
drop if missing(date)
duplicates drop date, force
sort date

save "data/raw/cpi_raw.dta", replace
