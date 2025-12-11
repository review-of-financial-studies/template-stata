clear all
set more off

pq use "data/raw/unemployment_rate.parquet", clear
pq merge 1:1 date using "data/raw/cpi.parquet"
keep if _merge == 3
drop _merge

gen date_daily = daily(date,"YMD")
gen date_monthly = mofd(date_daily)
format date_monthly %tm
drop date date_daily
rename date_monthly date
tsset date, monthly

gen inflation = (cpi - L12.cpi) / L12.cpi * 100
drop if missing(inflation, unemployment_rate)
keep if date >= tm(1970m1)

pq save "data/analysis/macro_data.parquet", replace
