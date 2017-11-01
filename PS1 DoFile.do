
************************TRIAL 1************************


*______________________________________________________________________
* PS1 dofile
*Yosmeriz Roman
*Revised:September 19, 2017
*----------------------------
  
* notes :  The data set used in this assignment is a temporary data set which denotes all students admitted to graduate school at Rutgers-Camden in 2016.

*----------------------------


//---------------------------data mgmt----------------------------------------------
  

//import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/2016%20Admits.xlsx?attredirects=0&d=1"


//no just dump that, that is not stata code
//the below is from GitHub, but I dont think it'll work since the file is not loading
echo "# DataManagementClass" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/yroman4/DataManagementClass.git
git push -u origin master
//This is as far as I can go :(

import excel  "https://docs.google.com/uc?id=0BwFOfelysEbBbVhYV3FJTUlnQWc&export=download" 

https://drive.google.com/open?id=0BwFOfelysEbBbVhYV3FJTUlnQWc//





**********************TRIAL 2****************************





//*______________________________________________________________________
* PS1 dofile
*Yosmeriz Roman
*Revised:October 19, 2017
*----------------------------
  
* notes :  New Data Set Used from Social Enterprise and ACS Data

*----------------------------


//---------------------------data mgmt----------------------------------------------
  
//notes on ps1 confusing!!! DO NOT USE GOOGLE DRIVE 
//import excel "https://drive.google.com/open?id=0B1Z8bNB7tmGsb1N4NkkxUDVYNU0 

use https://docs.google.com/uc?id=0B1Z8bNB7tmGsb1N4NkkxUDVYNU0&export=download
use https://docs.google.com/a/scarletmail.rutgers.edu/viewer?a=v&pid=sites&srcid=c2NhcmxldG1haWwucnV0Z2Vycy5lZHV8eW9zbWVyaXotZGF0bWFufGd4OjY5YzIzNTE4OGYwNmNhMDA



                              //***START HERE START HERE START HERE***//


//**______________________________________________________________________________________


*PS1 dofile
*Yosmeriz Roman 
*Revised October 25, 2017

*Notes: Data file for ACS Data imported to sites and exported to use in stata


  
clear         
set matsize 800  /* What happens if I dont set matsize?*/
version 14
set more off
cap log close  //capture suppresses error
set logtype text


//This is the file: https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/R11501441.xlsx?attredirects=0&d=1
//ok then just say:
import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/R11501441.xlsx?attredirects=0&d=1",sheet("Sheet1") firstrow clear



import excel "/Volumes/NO NAME/Data Management Course/R11501441.xlsx", sheet("Sheet1") firstrow clear
describe
list
summarize

