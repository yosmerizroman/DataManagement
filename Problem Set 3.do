*Problem Set 3
//Yosmeriz Roman
//56:824:718 Data Management
//Stata Version 14.2


/* In order to build upon Problem Set 2, I will merge 4 additional data sets to the County Health Data Set as well as the Rutgers-Camden 2017 scholarship dataset
/*There is a great deal of granular data for students 

***Existing Data: 
//1. 2017 Rutgers University-Camden Scholarships Data: All Students who have received a scholarship in 2017 undergraduate level
//2. NJ County Health Ratings Data- COunty level data of health risk factors


**New Data: From US Department of Agriculture Economic Research and Service: https://www.ers.usda.gov/data-products/county-level-data-sets/county-level-data-sets-download-data/

//3. Unemployment and median household income for the U.S., States, and counties, 2007-16	
//4. Population estimates for the U.S., States, and counties, 2010-16
//5. Poverty estimates for the U.S., States, and counties, 2015
//6. Educational attainment for the U.S., States, and counties, 1970-2015

//*****************Data Set 3: Unemployment and median household income for the U.S., States, and counties, 2007-16	

import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/Unemployment%20and%20household%20income%20Data%20PS3.xls?attredirects=0&d=1", clear

drop in 1/9
rename A FIPStxt
rename B State
drop D E F G H I J K L M N O P Q R S T U V W X Y Z AA AB AC AD AE AF AG AH AI AJ AK AL AM AN AO AP
rename C County
rename AQ CivilianLaborForce
rename AR Employed2016
rename AS Unemployed2016
rename AT Unemploymentrate2016
rename AU MedianIncome2015
rename AV MedianIncomepctstate2015
drop in 1
destring Unemploymentrate2016, replace
destring CivilianLaborForce, replace
destring MedianIncome2015, replace
destring MedianIncomepctstate2015, replace
destring Employed2016, replace
destring Unemployed2016, replace
drop if State!="NJ"
browse
gen county2 = regexs(1) if regexm(County, "([A-Za-z ]*)[,]")
/*replace county2= regexr(trim(county2),"[County]$") 


//*****************Data Set 4: Population estimates for the U.S., States, and counties, 2010-16

import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/PopulationEstimates.xls?attredirects=0&d=1", clear
browse
drop in 1/2
drop D E F G
drop J K L M N O P R S T U V W Y Z AA AB AC AD AF AG AH AI AJ AK AM AN AO AP AQ AR AT AU AV AW AX AY
drop BA BB BC BD BE BF BH BI BJ BK BL BM 
drop BO BP BQ BR BS BT BU BV BW BX BY BZ CA CB CC CD CE CF CG CH CJ CK CL CM CN CP CQ CR CS CT CV CW CX
drop CY CZ
drop DB DC DD DE DF DH DI DJ DK DL
rename A FIPS
rename B State
rename C County
drop H
rename I CENSUS_2010_POP
rename Q POP_ESTIMATE_2016
rename X N_POP_CHG_2016
rename AE Births
rename AL Deaths
rename AS NATURAL_INC
rename AZ INTERNATIONAL_MIG
rename BG DOMESTIC_MIG
rename BN NET_MIG
rename CI R_birth
rename CO R_death
rename CU R_NATURAL
rename DA R_INTERNATIONAL_MIG
rename DG R_DOMESTIC_MIG
rename DM R_NET_MIG
drop in 1
drop if State!="NJ"

destring CENSUS_2010_POP, replace
destring POP_ESTIMATE_2016, replace
destring N_POP_CHG_2016, replace
destring Births, replace
destring Deaths, replace
destring NATURAL_INC, replace
destring INTERNATIONAL_MIG, replace
destring DOMESTIC_MIG, replace
destring NET_MIG, replace
destring R_birth, replace
destring R_death, replace
destring R_NATURAL, replace
destring R_INTERNATIONAL_MIG, replace
destring R_DOMESTIC_MIG, replace
destring R_NET_MIG, replace
 
/*replace county2= regexr(trim(county2),"[County]$")  

//*****************Data Set 5: Poverty estimates for the U.S., States, and counties, 2015

import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/PovertyEstimates.xls?attredirects=0&d=1", clear

drop in 1/3
drop D E F G 
drop L M 
drop O P
drop R S
drop U V
drop X Y
drop AA AB
drop AD
drop AE AG AH 
drop I J
rename H Allpoverty14
rename K pctpoverty15
rename N poverty0to17
rename Q pctpoverty0to17
rename T poverty5to17
rename W pctpoverty5to17
rename Z medianincome
drop AC
drop AF
rename A FIPStxt
rename B State
rename C County
drop in 1
destring Allpoverty14, replace
destring pctpoverty15, replace
destring poverty0to17, replace
destring pctpoverty0to17, replace
destring poverty5to17, replace
destring pctpoverty5to17, replace
destring medianincome, replace
drop if State!="NJ"

/*replace county2= regexr(trim(county2),"[County]$") 

//******************Data Set 6: Educational attainment for the U.S., States, and counties, 1970-2015

import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/Education.xls?attredirects=0&d=1", clear
//cleaned data to includ 2011-2015

drop in 1/6
drop D E F G H I J K L M N O P Q R S T U V W X Y Z AA AB AC AD AE AF AG AH AI AJ AK AL AM
rename A FIPScode
rename B State
rename C County
rename AN lessthanHSdiploma
rename AO HSonly
rename AP somecollege
rename AQ bachelordegree
rename AR pctadultlesshs
rename AS pctadultwithhs
rename AT pctadultsomecollege
rename AU pctadultbachelors
drop in 1
destring lessthanHSdiploma, replace
destring HSonly, replace
destring somecollege, replace
destring bachelordegree, replace
destring pctadultlesshs, replace
destring pctadultwithhs, replace
destring pctadultsomecollege, replace
destring pctadultbachelors, replace
drop if State!="NJ"

/*replace county2= regexr(trim(county2),"[County]$") 


