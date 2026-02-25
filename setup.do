* Create directory for environment
* NOTE: most packages install into PLUS, some into PERSONAL
capture mkdir ado
sysdir set PLUS "ado"
sysdir set PERSONAL "ado"
adopath - OLDPLACE
adopath ++ PLUS

* Install required packages into environment
* NOTE: installed packages from the environment can be shipped with the package
ssc install pq, replace
ssc install estout, replace
