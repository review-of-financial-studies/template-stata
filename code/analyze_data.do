clear all
set more off

pq use "data/analysis/macro_data.parquet", clear

label var date "Month"
label var unemployment_rate "Unemployment rate (%)"
label var inflation "Inflation, CPI y/y (%)"

twoway ///
    (scatter unemployment_rate inflation, msymbol(circle) msize(small) mcolor(blue)) ///
    (lfit unemployment_rate inflation, lcolor(red) lwidth(medium)), ///
    ytitle("Unemployment rate (%)") ///
    xtitle("Inflation, y/y (%)") ///
    title("Scatterplot of Unemployment vs. Inflation with Fitted Line") ///
    legend(order(1 "Data" 2 "Linear fit")) ///
    graphregion(color(white))

graph export "results/figures/unemployment_inflation.png", ///
    replace width(1400)

reg unemployment_rate inflation

esttab using "results/tables/phillips_regression.txt", ///
    replace se label ///
    title("Regression of unemployment on inflation") ///
    b(%6.3f) se(%6.3f)
