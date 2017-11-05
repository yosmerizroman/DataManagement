* Problem Set 1 Data Formats and Conversions*
//Yosmeriz Roman
//56:824:718 Data Management
//Stata Version 14.2

/* general comments

ok, great, very happy to see more code;
when i put
http://docs.google.com/uc?id=1gTwpzoNl4umzVY4eeJ-EHRYkwSWZ65wh0p33xE3G3os&export=download
im getting
Not Found
Error 404
so you're doing someting wrong there--again see instructions in
http://aok.mooo.com/datman-1/ps1.pdf

or just use google sites, not google drive; like you did earlier in your code
import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/2017_All_Scholarship%20Recipients.xlsx?attredirects=0&d=1", clear //using the comma clear clears out anything that was there previously

and it worked

or use dropbox or wordpress or sth like

and from your text i see that
*Link on Google Drive can be found at: https://drive.google.com/open?id=1gTwpzoNl4umzVY4eeJ-EHRYkwSWZ65wh0p33xE3G3os

and this works


*/





*------Problem Set Re-done to be consistent with Data Files used for subsequent Problem Sets-----*

// A Rutgers University-Camden Data Set was used containing data for all students admitted to Rutgers-Camden for Fall 2017. 
// Scholarships are only offered for Fall and not Spring. All Spring Data ommited
// Data cleaned before uploading in order to deidentify students. Variables ommited include: First_Name, Last_Name, and RUID. 
// The RUID column re-purposed to attach an identifier. Identifiers selected as a unique number between 100 and 5082. 
// A total number of 4983 variables being analyzed. 
//**** For all data always remember that the units of analysis are in rows and variables in the column! Mixing this up can cause problems in analysis

*Link on Google Sites can be found at: https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/2017_All_Scholarship%20Recipients.xlsx?attredirects=0&d=1
*Link on Google Drive can be found at: https://drive.google.com/open?id=1gTwpzoNl4umzVY4eeJ-EHRYkwSWZ65wh0p33xE3G3os
*Link on Desktop 

//File will be uploaded from each of the 3 locations to learn each

*-------------------------------------------------------------------------------------------------*


*------------------------------Import 1--------------------------------------*
********************Import the file using Sites****************
//In order to use sites, go to sites.google.com on the left panel select create. Follow the instrucions in order to create a basic site. 
//Once the site is created, the key will be to make it public this way you can import things directly from there.
//On the top right, select the settings icon, click 'sharing and permissions' and then under private click on change
//Select 'public on the web'. This way Stata can find it
//On the left hand panel, select attachments then upload on the top panel and upload the file. 
//Once uploaded, right click on 'download' and then 'copy link' 

import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/2017_All_Scholarship%20Recipients.xlsx?attredirects=0&d=1", clear firstr //using the comma clear clears out anything that was there previously
describe//This revealed that I have 4,984 observations. I know there should be 4,983 and now know I will need to remove the first row because that is the titles for each column
browse//Allows me to see all the data I just imported. Some of the international students do not have city and country was not in the original data. For next problem set, I know I should drop this
save "Scholarships1.dta", replace// This saves the file I just uploaded as a stata file 
clear all
//ADAM- HOW DO I REMOVE THE FIRST ROW and identify it as a title row???????????????????????? When I am using this method?
//just added firstr above

*------------------------------Import 2--------------------------------------*
******************Import the file using Google Drive*******************
//In order to drive.google.com 
//Select New on the left to upload your file
//Once uploaded, click on 'Share' then 'Advanced' on the bottom right and click 'change...' and click on 'On-Public on the Web' and click 'Save' then 'Done'
//Once that is done, right click on the file and select "Get shareable link"
//The link will look like this: https://drive.google.com/open?id=1gTwpzoNl4umzVY4eeJ-EHRYkwSWZ65wh0p33xE3G3os
//The link SHOULD look like this: http://docs.google.com/uc?id=FILE_ID&export=download


import excel "http://docs.google.com/uc?id=1gTwpzoNl4umzVY4eeJ-EHRYkwSWZ65wh0p33xE3G3os&export=download"
//so i just downloaded from https://drive.google.com/open?id=1gTwpzoNl4umzVY4eeJ-EHRYkwSWZ65wh0p33xE3G3os
//and put on my goog: my steps
// NEW-file upload-right click-share-advanced-change from private to on public on the web--save--done
//right click get shareable link and it is for me https://drive.google.com/open?id=1P2NzPZtjNOb8-WKkojhGULxJEtkCYuMm
//so 
import excel "https://docs.google.com/uc?id=1P2NzPZtjNOb8-WKkojhGULxJEtkCYuMm&export=download",clear
//note that i have https not http, but again you must have made some mistake with sharing 

//ADAM- WHat am I doing wrong here?!Why do I always have issues with this one?! HELP. THey are public on my drive
describe// Described the number of variables, etc.
browse// Alows me to get a snapshot of what I just imported
save "Scholarships1.dta"
clear all

*------------------------------Import 3--------------------------------------*
//This is my favorite and the easiest, but know that you're uploading the file directly from your computer, so it will be difficult for others to access the actual data unless they are on your computer!!

//Go to file then import then you can select the file from your desktop
//When it comes up, you can select 'Import first row as variable names'

//yeah, this needs to be online!!

import excel "/Users/yosmerizroman/Downloads/2017_All_Scholarship Recipients.xlsx", sheet("Worksheet1") firstrow
describe
browse
clear all
