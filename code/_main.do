version 18
clear all
set more off

capture log close

local dirs "data" "data/raw" "data/analysis" "results" "results/figures" "results/tables" "output" "output/log" "code"
foreach dir of local dirs {
    capture mkdir "`dir'"
}

log using "output/log/_main.log", replace

do "code/download_raw_data.do"
do "code/create_analysis_data.do"
do "code/analyze_data.do"

log close
