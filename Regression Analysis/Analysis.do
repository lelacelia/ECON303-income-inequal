*Linh Anh Le
*12/3/2019
*Assignment 6 

***REGRESSION MODEL WITH SWIID GINI INDEX (gini_disp)	
*Generate numeric code for country name called code1
	gen code1 = 0
	replace code1 = 1 if code =="ISL"
	replace code1 = 2 if code =="NLD"
	replace code1 = 3 if code =="FRA"
	replace code1 = 4 if code =="SVN"
	replace code1 = 5 if code =="IRL"
	replace code1 = 6 if code =="GRC"
	replace code1 = 7 if code =="ISR"
	replace code1 = 8 if code =="EST"
	replace code1 = 9 if code =="ESP"
	replace code1 = 10 if code =="SVK"
	replace code1 = 11 if code =="POL"
	replace code1 = 12 if code =="AUT"
	replace code1 = 13 if code =="HUN"
	replace code1 = 14 if code =="DNK"
	replace code1 = 15 if code =="DEU"
	replace code1 = 16 if code =="CHE"
	replace code1 = 17 if code =="TUR"
	replace code1 = 18 if code =="CZE"
	replace code1 = 19 if code =="CAN"
	replace code1 = 20 if code =="NZL"
	replace code1 = 21 if code =="AUS"
	replace code1 = 22 if code =="KOR"
	replace code1 = 23 if code =="LUX"
	replace code1 = 24 if code =="MEX"
	replace code1 = 25 if code =="GBR"
	replace code1 = 26 if code =="ITA"
	replace code1 = 27 if code =="NOR"
	replace code1 = 28 if code =="CHL"
	replace code1 = 29 if code =="BEL"
	replace code1 = 30 if code =="USA"
	replace code1 = 31 if code =="JPN"
	replace code1 = 32 if code =="PRT"
	replace code1 = 33 if code =="FIN"
	replace code1 = 34 if code =="SWE"
*Setting panel data, code1 denotes the number assigned for each country, there are 34 countries so code1 ranges from 1 to 34
	xtset code1 year
*OLS	
	reg gini_disp FDI terEduc crisis GDP_gr inflation rurate tpop imgr , robust
	outreg2 using myreg.doc, replace ctitle(OLS)

*FIXED EFFECTS 
*Fixed effect using Rural Population rate and total population	
	xtreg gini_disp FDI terEduc crisis GDP_gr inflation rurate tpop imgr, fe robust
	outreg2 using myreg.doc, append ctitle(Fixed Effects) addtext(Country FE, YES)
*Fixed effect using Rural Population
	xtreg gini_disp FDI terEduc crisis GDP_gr inflation Rur_Pop imgr, fe robust
	outreg2 using myreg.doc, append ctitle(Fixed Effects) addtext(Country FE, YES)

*FIXED EFFECTS WITH YEARS
*Fixed effect with years using Rural Population rate and total population	
	xtreg gini_disp FDI terEduc crisis GDP_gr inflation rurate tpop imgr  i.year, fe robust
	outreg2 using myreg.doc, append ctitle(Fixed Effects) keep(FDI terEduc crisis GDP_gr rurate inflation tpop imgr ) addtext(Country FE, YES, Year FE, YES)
*Fixed effect with years using Rural Population
	xtreg gini_disp FDI terEduc crisis GDP_gr inflation Rur_Pop imgr  i.year, fe robust
	outreg2 using myreg.doc, append ctitle(Fixed Effects) keep(FDI terEduc crisis GDP_gr inflation Rur_Pop imgr ) addtext(Country FE, YES, Year FE, YES)
