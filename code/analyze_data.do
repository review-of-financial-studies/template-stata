clear all
set more off

use "data/analysis/macro_analysis.dta", clear

twoway ///
    (scatter unrate inflation, msymbol(circle) msize(small) mcolor(blue)) ///
    (lfit unrate inflation, lcolor(red) lwidth(medium)), ///
    ytitle("Unemployment rate (%)") ///
    xtitle("Inflation, y/y (%)") ///
    title("Scatterplot of Unemployment vs. Inflation with Fitted Line") ///
    legend(order(1 "Data" 2 "Linear fit")) ///
    graphregion(color(white))

graph export "output/figures/unemployment_inflation.png", ///
    replace width(1400)

reg unrate inflation

esttab using "output/tables/phillips_regression.txt", ///
    replace se label ///
    title("Regression of unemployment on inflation") ///
    b(%6.3f) se(%6.3f)
