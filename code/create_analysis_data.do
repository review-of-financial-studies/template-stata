clear all
set more off

use "data/raw/unrate_raw.dta", clear
merge 1:1 date using "data/raw/cpi_raw.dta"
keep if _merge == 3
drop _merge

gen ddate = daily(date,"YMD")
gen mdate = mofd(ddate)
format mdate %tm
drop date ddate
rename mdate date
tsset date, monthly

gen lcpi      = ln(cpi)
gen inflation = (lcpi - L12.lcpi) * 100

drop if missing(inflation, unrate)
keep if date >= tm(1970m1)

label var date     "Month"
label var unrate    "Unemployment rate (%)"
label var inflation "Inflation, CPI y/y (%)"

save "data/analysis/macro_analysis.dta", replace
