clear all
set more off

use "data/raw/unemployment_rate.dta", clear
merge 1:1 date using "data/raw/cpi.dta"
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

label var date     "Month"
label var unemployment_rate    "Unemployment rate (%)"
label var inflation "Inflation, CPI y/y (%)"

save "data/analysis/macro_data.dta", replace
