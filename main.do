version 18
clear all
set more off
capture log close

* Set ado path to environment
capture adopath - OLDPLACE
capture adopath - PERSONAL
sysdir set PLUS "ado"
adopath ++ PLUS

* Create folders 
local dirs data data/raw data/analysis results results/log results/figures results/tables
foreach dir of local dirs {
	capture mkdir `dir'
}

* Initialize log
log using "results/log/main.log", replace

* Run code
do "code/download_raw_data.do"
do "code/create_analysis_data.do"
do "code/analyze_data.do"

* Close log
log close
