* Create directory for environment
capture mkdir ado
sysdir set PLUS "ado"
adopath - OLDPLACE
adopath - PERSONAL
adopath ++ PLUS

* Install required packages into environment
* NOTE: installed packages from the environment can be shipped with the package
ssc install estout, replace
