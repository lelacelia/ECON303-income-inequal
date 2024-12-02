** Econometrics Assignment 4 
* Linh Anh Le
* 10/28/2019

*I created a folder on my desktop called Original Data folder for all the excel file I need to use

*DATA CLEANING FOR GINI COEFF
*import the data set for GNI coefficient from EHII
	import excel "C:\Users\LabUser\Desktop\Original Data folder\EHII GNI.xlsx", sheet("gini") firstrow
*select only 31 countries (low and midincome level) to be in the data set
*generate a new column code1 selected countries = 1, other countries = 0
	generate code1 = 0
	replace code1 = 1 if (code == "BGD"|code == "BOL"|code == "MMR"|code == "KHM"|code == "CMR"|code == "COG"|code == "GHA"|code == "HND"|code == "IND"|code == "IDN"|code == "CIV"|code == "KEN"|code == "KGZ"|code == "LSO"|code == "MNG"|code == "MDA"|code == "MAR"|code == "NIC"| code == "PAK"|code == "PNG"|code == "PHL"|code == "SEN"|code == "VNM"|code == "ZWE"|code == "SDN"|code == "TUN"|code == "UKR"|code == "EGY"|code == "ZMB")
*delete other countries not got selected
	keep if code1 == 1
*drop the extra columns not needed
	drop code1
	drop country countryname
*drop not necessary years
drop y1963 y1964 y1965 y1966 y1967 y1968 y1969 y1970 y1971 y1972 y1973 y1974 y1976 y1977 y1978 y1979 y1981 y1982 y1983 y1984 y1986 y1987 y1988 y1989 y1991 y1992 y1993 y1994 y1996 y1997 y1998 y1999 y2001 y2002 y2003 y2004 y2006 y2007 y2008 y2009 y2011 y2012 y2013 y2014 y2015 
*reshape the dataset from wide to long
	reshape long y, i(code) j(year)
*rename y to GINI_IDX
	rename y GNI_IDX
*save cleaned data set
	save "C:\Users\LabUser\Desktop\Original Data folder\GINI INDEX.dta"
	clear

*DATA CLEANG FOR FDI
*import file
	import excel "C:\Users\LabUser\Desktop\Original Data folder\FDI.xls", sheet("Data") firstrow
*rename variable CountryCode
	rename CountryCode code
*generate a new column code1 selected countries = 1, other countries = 0
	generate code1 = 0
	
	replace code1 = 1 if (code == "BGD"|code == "BOL"|code == "MMR"|code == "KHM"|code == "CMR"|code == "COG"|code == "GHA"|code == "HND"|code == "IND"|code == "IDN"|code == "CIV"|code == "KEN"|code == "KGZ"|code == "LSO"|code == "MNG"|code == "MDA"|code == "MAR"|code == "NIC"| code == "PAK"|code == "PNG"|code == "PHL"|code == "SEN"|code == "VNM"|code == "ZWE"|code == "SDN"|code == "TUN"|code == "UKR"|code == "EGY"|code == "ZMB")
*delete other countries not got selected
	keep if code1 == 1
*drop not needed variables
	drop code1
	drop CountryName IndicatorName IndicatorCode
*drop not necessary years
drop y1960 y1961 y1962 y1963 y1964 y1965 y1966 y1967 y1968 y1969 y1970 y1971 y1972 y1973 y1974 y1976 y1977 y1978 y1979 y1981 y1982 y1983 y1984 y1986 y1987 y1988 y1989 y1991 y1992 y1993 y1994 y1996 y1997 y1998 y1999 y2001 y2002 y2003 y2004 y2006 y2007 y2008 y2009 y2011 y2012 y2013 y2014 y2015 y2016 y2017 y2018 y2019
*reshape data set from wide to long
	reshape long y, i(code) j(year)
*rename y to FDI
	rename y FDI
*save cleaned data set
	save "C:\Users\LabUser\Desktop\Original Data folder\FDI.dta"
	clear
*DATA CLEANING FOR RURAL POPULATION
*import file
	import excel "C:\Users\LabUser\Desktop\Original Data folder\rural population.xls", sheet("Data") firstrow
*rename variable CountryCode
	rename CountryCode code
*generate a new column code1 selected countries = 1, other countries = 0
	generate code1 = 0
	
	replace code1 = 1 if (code == "BGD"|code == "BOL"|code == "MMR"|code == "KHM"|code == "CMR"|code == "COG"|code == "GHA"|code == "HND"|code == "IND"|code == "IDN"|code == "CIV"|code == "KEN"|code == "KGZ"|code == "LSO"|code == "MNG"|code == "MDA"|code == "MAR"|code == "NIC"| code == "PAK"|code == "PNG"|code == "PHL"|code == "SEN"|code == "VNM"|code == "ZWE"|code == "SDN"|code == "TUN"|code == "UKR"|code == "EGY"|code == "ZMB")
*delete other countries not got selected
	keep if code1 == 1
*drop not needed variables
	drop code1
	drop CountryName IndicatorName IndicatorCode
*drop not necessary years
drop y1960 y1961 y1962 y1963 y1964 y1965 y1966 y1967 y1968 y1969 y1970 y1971 y1972 y1973 y1974 y1976 y1977 y1978 y1979 y1981 y1982 y1983 y1984 y1986 y1987 y1988 y1989 y1991 y1992 y1993 y1994 y1996 y1997 y1998 y1999 y2001 y2002 y2003 y2004 y2006 y2007 y2008 y2009 y2011 y2012 y2013 y2014 y2015 y2016 y2017 y2018 y2019
*reshape data set from wide to long
	reshape long y, i(code) j(year)
*rename variable y to Rur_Pop	
	rename y Rur_Pop
*save cleaned data set
	save "C:\Users\LabUser\Desktop\Original Data folder\Rural Population.dta"
	clear
*DATA CLEANING FOR URBAN POPULATION
*import data set
	import excel "C:\Users\LabUser\Desktop\Original Data folder\urban population.xls", sheet("Data") firstrow
*rename variable CountryCode
	rename CountryCode code
*generate a new column code1 selected countries = 1, other countries = 0
	generate code1 = 0
	
	replace code1 = 1 if (code == "BGD"|code == "BOL"|code == "MMR"|code == "KHM"|code == "CMR"|code == "COG"|code == "GHA"|code == "HND"|code == "IND"|code == "IDN"|code == "CIV"|code == "KEN"|code == "KGZ"|code == "LSO"|code == "MNG"|code == "MDA"|code == "MAR"|code == "NIC"| code == "PAK"|code == "PNG"|code == "PHL"|code == "SEN"|code == "VNM"|code == "ZWE"|code == "SDN"|code == "TUN"|code == "UKR"|code == "EGY"|code == "ZMB")
*delete other countries not got selected
	keep if code1 == 1
*drop not needed variables
	drop code1
	drop CountryName IndicatorName IndicatorCode
*drop not necessary years
drop y1960 y1961 y1962 y1963 y1964 y1965 y1966 y1967 y1968 y1969 y1970 y1971 y1972 y1973 y1974 y1976 y1977 y1978 y1979 y1981 y1982 y1983 y1984 y1986 y1987 y1988 y1989 y1991 y1992 y1993 y1994 y1996 y1997 y1998 y1999 y2001 y2002 y2003 y2004 y2006 y2007 y2008 y2009 y2011 y2012 y2013 y2014 y2015 y2016 y2017 y2018 y2019
*reshape data set from wide to long
	reshape long y, i(code) j(year)
*rename y to urban variable
	rename y Urb_Pop
*save cleaned data set
	save "C:\Users\LabUser\Desktop\Original Data folder\Urban Population.dta"
	clear
	
*DATA CLEANING FOR GDP GROWTH RATE
*import data set
	import excel "C:\Users\LabUser\Desktop\Original Data folder\urban population.xls", sheet("Data") firstrow
*rename variable CountryCode to code
	rename CountryCode code
*generate a new column code1 selected countries = 1, other countries = 0
	generate code1 = 0
	
	replace code1 = 1 if (code == "BGD"|code == "BOL"|code == "MMR"|code == "KHM"|code == "CMR"|code == "COG"|code == "GHA"|code == "HND"|code == "IND"|code == "IDN"|code == "CIV"|code == "KEN"|code == "KGZ"|code == "LSO"|code == "MNG"|code == "MDA"|code == "MAR"|code == "NIC"| code == "PAK"|code == "PNG"|code == "PHL"|code == "SEN"|code == "VNM"|code == "ZWE"|code == "SDN"|code == "TUN"|code == "UKR"|code == "EGY"|code == "ZMB")
*delete other countries not got selected
	keep if code1 == 1
*drop not needed variables
	drop code1
	drop CountryName IndicatorName IndicatorCode
*drop not necessary years
drop y1960 y1961 y1962 y1963 y1964 y1965 y1966 y1967 y1968 y1969 y1970 y1971 y1972 y1973 y1974 y1976 y1977 y1978 y1979 y1981 y1982 y1983 y1984 y1986 y1987 y1988 y1989 y1991 y1992 y1993 y1994 y1996 y1997 y1998 y1999 y2001 y2002 y2003 y2004 y2006 y2007 y2008 y2009 y2011 y2012 y2013 y2014 y2015 y2016 y2017 y2018 y2019
*reshape data set from wide to long
	reshape long y, i(code) j(year)
*rename y to GDP growth rate
	rename y GDP_gr_rate
*save cleaned data set
	save "C:\Users\LabUser\Desktop\Original Data folder\GDP growth rate.dta"
	clear
	
*DATA CLEANING FOR INFLATION RATE, CONSUMER PRICE
*import data set
	import excel "C:\Users\LabUser\Desktop\Original Data folder\inflation rate.xls", sheet("Data") firstrow
*rename variable CountryCode
	rename CountryCode code
*generate a new column code1 selected countries = 1, other countries = 0
	generate code1 = 0
	
	replace code1 = 1 if (code == "BGD"|code == "BOL"|code == "MMR"|code == "KHM"|code == "CMR"|code == "COG"|code == "GHA"|code == "HND"|code == "IND"|code == "IDN"|code == "CIV"|code == "KEN"|code == "KGZ"|code == "LSO"|code == "MNG"|code == "MDA"|code == "MAR"|code == "NIC"| code == "PAK"|code == "PNG"|code == "PHL"|code == "SEN"|code == "VNM"|code == "ZWE"|code == "SDN"|code == "TUN"|code == "UKR"|code == "EGY"|code == "ZMB")
*delete other countries not got selected
	keep if code1 == 1
*drop not needed variables
	drop code1
	drop CountryName IndicatorName IndicatorCode
*drop not necessary years
drop y1960 y1961 y1962 y1963 y1964 y1965 y1966 y1967 y1968 y1969 y1970 y1971 y1972 y1973 y1974 y1976 y1977 y1978 y1979 y1981 y1982 y1983 y1984 y1986 y1987 y1988 y1989 y1991 y1992 y1993 y1994 y1996 y1997 y1998 y1999 y2001 y2002 y2003 y2004 y2006 y2007 y2008 y2009 y2011 y2012 y2013 y2014 y2015 y2016 y2017 y2018 y2019
*reshape data set from wide to long
	reshape long y, i(code) j(year)
*rename y to inflation
	rename y inflation
*save cleaned data set
	save "C:\Users\LabUser\Desktop\Original Data folder\inflation rate.dta"
	clear
	
*DATA CLEANING FOR TERTIARY EDUCATION AND POPULATION
*import the dataset
import excel "C:\Users\LabUser\Desktop\Original Data folder\TertiaryEduc&Population.xls", sheet("Popu&Educ") firstrow
*generate a new column code1 selected countries = 1, other countries = 0
	generate code1 = 0
	replace code1 = 1 if (code == "BGD"|code == "BOL"|code == "KHM"|code == "CMR"|code == "COG"|code == "GHA"|code == "HND"|code == "IND"|code == "IDN"|code == "CIV"|code == "KEN"|code == "KGZ"|code == "LSO"|code == "MNG"|code == "MDA"|code == "MAR"|code == "NIC"| code == "PAK"|code == "PNG"|code == "PHL"|code == "SEN"|code == "VNM"|code == "ZWE"|code == "SDN"|code == "TUN"|code == "UKR"|code == "EGY"|code == "ZMB")
*delete other countries not got selected
	keep if code1 == 1
*drop not needed name column
	drop Country
	drop code1
*save cleaned data set
	save "C:\Users\LabUser\Desktop\Original Data folder\TertiaryEduc&Population.dta"
	clear
	
*DATA MERGING
*combine gini, tertiary education, population using excel and import back to STATA
	import excel "C:\Users\LabUser\Desktop\Original Data folder\Gini,Tertiary Educ, Population_done.xls", sheet("Sheet1") firstrow
	drop Concatenate
	save "C:\Users\LabUser\Desktop\Original Data folder\Gini,Tertiary Educ, Population.dta"
*merge data by country code and year
*import the stata file of GINI, tertiary education and population
	use "C:\Users\LabUser\Desktop\Original Data folder\Gini,Tertiary Educ, Population.dta", clear
*merge FDI in using _merge
	merge 1:1 code year using "C:\Users\LabUser\Desktop\Original Data folder\FDI.dta"
*merge GDP growth rate in using _merge1	
	merge 1:1 code year using "C:\Users\LabUser\Desktop\Original Data folder\GDP growth rate.dta", generate(_merge1)
*merge inflation rate in using _merge2	
	merge 1:1 code year using "C:\Users\LabUser\Desktop\Original Data folder\inflation rate.dta", generate(_merge2)
*merge urban population in using _merge3	
	merge 1:1 code year using "C:\Users\LabUser\Desktop\Original Data folder\Urban Population.dta", generate(_merge4)
*merge rural population in using _merge4
	merge 1:1 code  year using "C:\Users\LabUser\Desktop\Original Data folder\Rural Population.dta", generate(_merge3)
*drop the variable use to merge data set
	drop _merge _merge1 _merge2 _merge4 _merge3
*save final work
	save "C:\Users\LabUser\Desktop\Original Data folder\Complete data set.dta"
	
	

