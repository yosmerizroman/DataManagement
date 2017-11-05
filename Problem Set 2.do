* Problem Set 1 Data Formats and Conversions*
//Yosmeriz Roman
//56:824:718 Data Management
//Stata Version 14.2

*------Problem Set Re-done to be consistent with Data Files used for subsequent Problem Sets-----*

// A Rutgers University-Camden Data Set was used containing data for all students admitted to Rutgers-Camden for Fall 2017. 
// Data was accessed 

//Using this data I hope to analyze what the parameters are for students getting scholarships at Rutgers Camden and hope to merge with Census data on Zip code to determine whether location has an effect on what types of students get scholarships at Rutgers-Camden
//In the future, I would like to add information about health, and trulia information about cost of living in those zip codes

/*Some potential Research Questions I am exploring with these data include: if start a comment like this 

dont need to comment out stuff inside bc everything that follows that is a comment

Does Zip Code affect receiving a scholarship at Rutgers-Camden?
Does the zip code you are from and health, affect receiving scholarships?
Does having access to a good neighborhood impact your ability to get a scholarship?
Do international students or Domestic students receive more scholarships?

untill here:
*/ //then has to end like this!! abd this ends the comment block

********************Manipulating Data and Merging*********************

*******Step 1 Cleaning Data Set 1******

import excel "https://sites.google.com/a/scarletmail.rutgers.edu/yosmeriz-datman/admitted-students/2017_All_Scholarship%20Recipients.xlsx?attredirects=0&d=1", clear
describe
browse
//Rename all variable columns

//again can use option 'firstr' to get first row as names easily

rename A UniqueID //Created number by me to identify them as distinct students
rename B Camdenschool //School they were admitted to 
rename C FYorTR //Applied as a first-year or transfer student
rename D AwardName //Name of the scholarship
rename E AwardAmount //Amount they received
rename F Major //What major they applied to
rename G Decision //Admit, Admit Withdraw, or Admit Not Coming
rename H AdmitDate //Date Admitted
rename I CommitDate //Date they confirmed admissiona and said they were coming to RUC
rename J City //City of home address
rename K State //state of home address
rename L Zip //zip of home address

//these comments you put here, should be var names like:
la var Zip "zip of home address"
//etc

//Can also use renvars to do all at once

drop in 1 // Yay I found out how to drop the first row! This row had the titles still

//AdmitDate may come in handy later in analysis
//Recode is the code for creating new variables in this case will not use because data is relatively clean. Not sure yet if anything will need to be dropped.

******************
//ADAM*** I want to Generate "International" in the Zip column if no Zip Code is there. How do I do this? I tried the below:

*generate Zip=International
*replace Zip=International if Zip= " "

//can first have a look like this
ta Zip, mi //and see there are some super long ones
count if Zip==""
count if Zip==" "
so gen intl=0
replace intl=1 if Zip==" "
//or perhaps better:
gen intlAlt=0
replace intlAlt=1 if length(Zip)!=5 //this would also make it intl for all cases where length is not 5--guess these longweird zips were intl

******************

//***************THINGS I DID NOT USE BUT GOOD FOR REFERENCE**********************//
//encode is designed for situations in which you have a string variable, typically containing meaningful nonnumeric text (e.g., male, female), and wish to have the equivalent information as a numeric variable with labels. This goes way back in Stata history.
//destring is designed for situations in which you have a string variable, typically containing meaningful numeric text (e.g., 1, 2), which you wish to convert to the numeric variable it should properly be. Usually, that variable is now string because of some mistake. Perhaps the mistake was yours, because what you initially typed in Stata's Data Editor was nonnumeric. Or, perhaps the numeric text is contaminated by nonnumeric text from some earlier operation (e.g., in a spreadsheet), and Stata spotted that.

*****Step 2 Cleaning Data Set 2***********



