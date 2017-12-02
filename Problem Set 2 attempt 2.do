* Problem Set 1 Data Formats and Conversions*
//Yosmeriz Roman
//56:824:718 Data Management
//Stata Version 14.2

*------Problem Set Re-done to be consistent with Data Files used for subsequent Problem Sets-----*

// A Rutgers University-Camden Data Set was used containing data for all students admitted to Rutgers-Camden for Fall 2017 who received a scholarship. 
// Data was accessed 

//Using this data I hope to analyze what the parameters are for students getting scholarships at Rutgers Camden and hope to merge with Census data on Zip code to determine whether location has an effect on what types of students get scholarships at Rutgers-Camden
//In the future, I would like to add information about health, and trulia information about cost of living in those zip codes

/**Some potential Research Questions I am exploring with these data include:

//Does where you live affect receiving a scholarship at Rutgers-Camden?
//Does where you are from and health, affect receiving scholarships?
//Does having access to a good neighborhood impact your ability to get a scholarship?
//Do international students or Domestic students receive more scholarships?

DATA SET Updated to produce county codes
********************Manipulating Data and Merging*********************

***CLEAN VERSION DataSet1**
clear
import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/Fall%202017%20Scholarships.xlsx?attredirects=0&d=1", clear
drop B 
rename A UniqueID 
rename C Camdenschool 
rename D FYorTR 
rename E AwardName 
rename F AwardAmount 
rename G Major 
rename H Decision 
rename I AdmitDate 
rename J CommitDate 
rename K City 
rename M State 
rename N Zip 
rename L CountyCode
drop in 1
ta Zip, mi
browse if length(Zip) !=5
browse
count if length(Zip) !=5
replace Zip="INTL" if Zip==""
replace State="INTL" if State==""
gen OOS
generate OOS= "OOS" if State !="NJ"
replace OOS= "in-state" if State =="NJ"
tab State
generate Region=0
generate Region=1
replace Region=0 if State=="NJ"
replace Region=1 if State=="INTL"
replace Region=1 if OOS=="OOS"
count if OOS == "OOS"
count if OOS =="in-state"
destring AwardAmount, replace
egen av_scholarship=mean(AwardAmount)
move AwardAmount av_scholarship
sd AwardAmount
median AwardAmount
egen avgaward=mean(AwardAmount)
replace CommitDate="NotComing" if CommitDate==""
ta CountyCode
gen County
generate County= "Atlantic" if CountyCode=="AT"
move County CountyCode
replace County= "Bergen" if CountyCode=="BE"
replace County= "Burlington" if CountyCode=="BU"
replace County= "Camden" if CountyCode=="CA"
replace County= "Cape May" if CountyCode=="CM"
replace County= "Cumberland" if CountyCode=="CU"
replace County= "Essex" if CountyCode=="EX"
replace County= "Gloucester" if CountyCode=="GL"
replace County= "Hudson" if CountyCode=="HD"
replace County= "Hunterdon" if CountyCode=="HN"
replace County= "Mercer" if CountyCode=="ME"
replace County= "Middlesex" if CountyCode=="MI"
replace County= "Monmouth" if CountyCode=="MO"
replace County= "Morris" if CountyCode=="MR"
replace County= "Ocean" if CountyCode=="OC"
replace County= "Passaic" if CountyCode=="PA"
replace County= "Salem" if CountyCode=="SA"
replace County= "Somerset" if CountyCode=="SO"
replace County= "Sussex" if CountyCode=="SX"
replace County= "Union" if CountyCode=="UN"
replace County= "Warren" if CountyCode=="WA"
save Problemset2data1scholarship

**End Clean Version DataSet1**


*****Step 2 Cleaning Data Set 2***********

//** Data Set two is retrieved from NJ County Health Rankings Data: http://www.countyhealthrankings.org/rankings/data/nj) and data from the New Jersey Behavioral Risk Factor Survey in 2016
//* Health rankings based on county data
//file here: "https://drive.google.com/open?id=1tCJxM4DkV3nwYB-EuEvGi1vINK0ISbrK"

clear
import excel "https://docs.google.com/uc?id=1tCJxM4DkV3nwYB-EuEvGi1vINK0ISbrK&export=download"
browse 

rename A County 
rename B deaths 
rename C yearslost 
rename F zyearslost
rename G perfairpoorhealth
rename J zfairpoor
rename K puhdays
rename N zpuhdays
rename O muhdays
rename R zmuhdays
rename T lowbirth
rename U livebirth
rename V perlowbirth
rename Z persmoke
rename AC zsmoke 
rename AD perobese 
rename AG zobese 
rename AH foodindex
rename AI zfood
rename AJ perinactive
rename AM zinactive
rename AN perwaccess
rename AO zwaccess
rename AP perdrink
rename AS zdrink
rename AT aldrivedeath
rename AV peraldrivedeath
rename BC teenbirth
rename BD teenpop
rename BE teenbirthrate
rename BI uninsured
rename BJ peruninsured 
rename BM zuninsured 
rename BN PCP
rename BO PCPrate
rename BP zPCP
rename BQ dentist
rename BR dentistrate
rename BS zdentist 
rename BT MHproviders
rename BU MHPrate
rename BY medicaidenrolled
rename BZ prevhosprate
rename CC zprevhosprate
rename CD diabetics
rename CI zmedicareenrolled
rename CN cohortsize
rename CO gradrate
rename CP zgradrate
rename CQ somecollege
rename CR population 
rename CS persomecollege
rename CV zsomecollege
rename CW unemployed
rename CX laborforce 
rename CY perunemployed 
rename DA childpov
rename DB perchildpov
rename DE zchildpov
rename DF eightyincome
rename DG twentyincome
rename DH incomeratio
rename DI zincome 
rename DJ singleparent
rename DK households
rename DL persingleparent
rename DO zhouseholds
rename DP associations
rename DQ associationrate
rename DR zassociations 
rename DT violentcrimerate
rename DU zviolentcrime
rename DS violentcrime 
rename DV injurydeath
rename DW injurydeathrate
rename DZ zinjurydeath
rename EC violation
rename ED zviolation
rename EE severeproblems
rename EF persevereproblems
rename EI zsevereproblems 
rename AU drivingdeath

drop D H L P W AA AE BF BK CA CF CK CT DC DM DC EG EM ER E I M Q S X AB AK AL AF AX AQ AW BF BG BK BL CA CB CF CG CK CM CT CU D
drop EH
drop EJ-ET
drop in 1/2
drop in 22/23
drop zfairpoor
drop zpuhdays zmuhdays Y zsmoke zobese zfood zinactive zwaccess AR zdrink AY zuninsured zPCP zdentist BX 
drop AZ-BB
drop BH
drop BV BW CE CH zmedicareenrolled CJ CL zgradrate zsomecollege CZ zchildpov
drop zsevereproblems
drop zinjurydeath EA EB DX DY zassociations zhousehold zincome DD
drop zyearslost
egen avgdeaths=mean(deaths)

save Problemset2data22health

//County Added to original data set for purposes of this study.

//***MERGING THE TWO DATA SETS***//

clear 
use Problemset2data1scholarship
merge m:1 County using Problemset2data22health
save problemset2final

