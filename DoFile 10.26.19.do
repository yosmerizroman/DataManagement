*Final Dataset for Dissertation. Last Update 8.30.19
/*The purpose of this study is to determine if college retention rates (from first year to second year and from second year to third year)
differed among first generation Latino students in the Educational Opportunity Fund (EOF) program, 
and first generation Latino students who are not in the EOF program. In order to be in the EOF program, students must apply and be admitted
to the program based on academic and financial need. This study is done at Ruters, The State University of New Jersey's three campuses--
Rutgers University-New Brunswick, Rutgers University-Newark, and Rutgers University-Camden. The research question is: How does the
Educational Opportunity Fund program at Rutgers, The State University of New Jersey impact first generation latino student retention?*/

//ok but whats the hypothesis?? can you express it in measurable variables? whats the model?

//If not using my personal computer use below
import excel "https://docs.google.com/uc?id=1xILLWJ5fy_8VxENiQK2yscbGBUFBlsY8&export=download", firstrow clear
//If using my personal computer use below
import excel "/Users/yosmerizroman/Downloads/Dissertation Dataset 8.19.19.xlsx", sheet("Dissertation Dataset 8.19.19") firstrow clear


//DATA CLEANUP AND RECODES
gen EOF_IND=.
replace EOF_IND=1 if EOF_CODES=="C"
replace EOF_IND=0 if inlist(EOF_CODES, "$" ,"G", "N",".", "P")
replace EOF_IND=0 if inlist(EOF_CODES, "R", "T", "U", "V", "W")
/*label EOF_IND==1 as "IN EOF" EOF_IND==0 as "No_EOF" */
tab EOF_IND, mi


tab EOF_IND EOF_CODES, mi //always after recoding double check whether stata did what you think it did!
tab  EOF_CODES EOF_IND, mi //better see flip this way
//is empty "" on the original variable coded right? should it be missing on new var?

tab EOF_IND GENDER, mi
tab EOF_IND REGION_CD, mi
tab EOF_IND HIGH_DITRESS_MNCPLTY, mi
replace DFG_SCHOOL="0" if DFG_SCHOOL=="" //sure about that? ,maybe we simply dont know and should be missing
replace DFG_SCHOOL="1" if DFG_SCHOOL=="D"
/*Need to appropriately label below */ //see class on labelling!
label 1 "DFG_SCH" 0 "NO_DFG"
tab DFG_SCHOOL, mi
tab EOF_IND DFG_SCHOOL, mi
destring FATHER_EDU, replace
destring MOTHER_EDU, replace
recode FATHER_EDU (0 1 2=0 "Not_Attended") (3 4=1 "Attended"), gen(FATHER_COLLEGE)
recode MOTHER_EDU (0 1 2=0 "Not_Attended") (3 4=1 "Attended"), gen(MOTHER_COLLEGE)
destring YR, replace

//you're destringing a bunch, so just do it at onse
destring *, replace

//CATEGORICAL VARIABLES
tab FATHER_COLLEGE, mi
tab MOTHER_COLLEGE, mi
tab EOF_IND FATHER_COLLEGE, mi
tab EOF_IND MOTHER_COLLEGE, mi
replace NAT_SCH_LUNCH="0" if inlist (NAT_SCH_LUNCH, "", "N")
replace NAT_SCH_LUNCH="1" if NAT_SCH_LUNCH=="Y"
tab EOF_IND NAT_SCH_LUNCH
replace EOF_SIBLING="Y" if EOF_SIBLING=="C" //shouldn't tyhois be =="Y"
replace EOF_SIBLING="1" if EOF_SIBLING=="Y"
replace EOF_SIBLING="0" if EOF_SIBLING=="N"
tab EOF_IND EOF_SIBLING, mi
replace COLLEGE_PREP_PROG="0" if COLLEGE_PREP_PROG inlist (COLLEGE_PREP_PROG, "" "N")
replace COLLEGE_PREP_PROG="1" if COLLEGE_PREP_PROG inlist (COLLEGE_PREP_PROG, "C" "Y")
tab EOF_IND COLL_PREP_PROG, mi
/*Need to appropriately label below */
label REGION_CD 1 "New Brunswick" 2 "Newark" 3 "Camden"
tab REGION_CD EOF_IND
//CONTINUOUS VARIABLES //may want to use table or tabstat and especially graphs, see class materials
misstable summarize
su HOUSEHOLDAGI if HOUSEHOLDAGI !=.
su HOUSEHOLDAGI if EOF_INDICATOR=="EOF"
su HOUSEHOLDAGI if EOF_INDICATOR=="NON-EOF"
su EFC if EFC !=.
su EFC if EOF_INDICATOR=="EOF"
su EFC if EOF_INDICATOR=="NON-EOF"
su SATSCORE if SATSCORE !=.
su SATSCORE if EOF_INDICATOR=="EOF"
su SATSCORE if EOF_INDICATOR=="NON-EOF"
su HS_GPA if HS_GPA !=.
su HS_GPA if EOF_INDICATOR=="EOF"
su HS_GPA if EOF_INDICATOR=="NON-EOF"
su HS_PCTILE_RANK if HS_PCTILE_RANK !=.
su HS_PCTILE_RANK if EOF_INDICATOR=="EOF"
su HS_PCTILE_RANK if EOF_INDICATOR=="NON-EOF"
su ACT_COMP if ACT_COMP !=.
su ACT_COMP if EOF_INDICATOR=="EOF"
su ACT_COMP if EOF_INDICATOR=="NON-EOF"
su AGE_AT_START if AGE_AT_START !=.
su AGE_AT_START if EOF_INDICATOR=="EOF"
su AGE_AT_START if EOF_INDICATOR=="NON-EOF"
su T1_GPA_TERM if T1_GPA_TERM !=.
su T1_GPA_TERM if EOF_INDICATOR=="EOF"
su T1_GPA_TERM if EOF_INDICATOR=="NON-EOF"
su SP1_GPA_TERM if SP1_GPA_TERM !=.
su SP1_GPA_TERM if EOF_INDICATOR=="EOF"
su SP1_GPA_TERM if EOF_INDICATOR=="NON-EOF"
su SP1_GPA_CUM if SP1_GPA_CUM !=.
su SP1_GPA_CUM if EOF_INDICATOR=="EOF"
su SP1_GPA_CUM if EOF_INDICATOR=="NON-EOF"
su T2_GPA_TERM if T2_GPA_TERM !=.
su T2_GPA_TERM if EOF_INDICATOR=="EOF"
su T2_GPA_TERM if EOF_INDICATOR=="NON-EOF"
su T2_GPA_CUM if T2_GPA_CUM !=.
su T2_GPA_CUM if EOF_INDICATOR=="EOF"
su T2_GPA_CUM if EOF_INDICATOR=="NON-EOF"
//DEPENDENT VARIABLES-RETENTION
tab SEC_FALL_RET if EOF_INDICATOR=="EOF"
tab SEC_FALL_RET if EOF_INDICATOR=="NON-EOF"
tab THRD_FALL_RET if EOF_INDICATOR=="EOF"
tab THRD_FALL_RET if EOF_INDICATOR=="NON-EOF"
//CROSSSTABULATIONS FY TO SO
tab GENDER SEC_FALL_RET, col row
tab GENDER SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab GENDER SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab UNIT SEC_FALL_RET, col row
tab UNIT SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab UNIT SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab REGION_CD SEC_FALL_RET, col row
tab REGION_CD SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab REGION_CD SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab DFG_SCHOOL SEC_FALL_RET, col row
tab DFG_SCHOOL SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab DFG_SCHOOL SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
/* POCKET OF POVERTY SAME AS HIGH DISTRESS MUNICIPALITY IN HOW ITS CODED*/
replace HIGH_DITRESS_MNCPLTY="HIGH DISTRESS MUNICIPALITY" if HIGH_DITRESS_MNCPLTY=="POCKET OF POVERTY"
tab HIGH_DITRESS_MNCPLTY
tab HIGH_DITRESS_MNCPLTY SEC_FALL_RET, col row
tab HIGH_DITRESS_MNCPLTY SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab HIGH_DITRESS_MNCPLTY SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab FATHER_COLLEGE SEC_FALL_RET, col row
tab FATHER_COLLEGE SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab FATHER_COLLEGE SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab MOTHER_COLLEGE SEC_FALL_RET, col row
tab MOTHER_COLLEGE SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab MOTHER_COLLEGE SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
//generating variable for parent combinations //this should probably go earlier when you did other recoding
gen FATHER_MOTHER_ATTEND=MOTHER_COLLEGE /*BOTH PARENTS ATTENDED*/
replace FATHER_MOTHER_ATTEND="1" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="1"
replace FATHER_MOTHER_ATTEND="0" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="0"
replace FATHER_MOTHER_ATTEND="0" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="0"
replace FATHER_MOTHER_ATTEND="0" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="1"
tab FATHER_MOTHER_ATTEND
gen FATHER_MOTHER_NOT_ATTEND=FATHER_MOTHER_ATTEND /*NEITHER PARENTS ATTENDED*/
replace FATHER_MOTHER_NOT_ATTEND="1" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="0"
replace FATHER_MOTHER_NOT_ATTEND="0" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="1"
replace FATHER_MOTHER_NOT_ATTEND="0" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="0"
replace FATHER_MOTHER_NOT_ATTEND="0" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="1"
tab FATHER_MOTHER_NOT_ATTEND
gen FATHER_Y_NO_MOM=FATHER_MOTHER_ATTEND /*FATHER ATTENDED NOT MOTHER*/
replace FATHER_Y_NO_MOM="1" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="0"
replace FATHER_Y_NO_MOM="0" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="1"
replace FATHER_Y_NO_MOM="0" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="0"
replace FATHER_Y_NO_MOM="0" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="1"
tab FATHER_Y_NO_MOM
gen MOTHER_Y_NO_FAT=FATHER_Y_NO_MOM /*MOTHER ATTENDED NOT FATHER*/
replace MOTHER_Y_NO_FAT="1" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="1"
replace MOTHER_Y_NO_FAT="0" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="1"
replace MOTHER_Y_NO_FAT="0" if FATHER_COLLEGE=="0" & MOTHER_COLLEGE=="0"
replace MOTHER_Y_NO_FAT="0" if FATHER_COLLEGE=="1" & MOTHER_COLLEGE=="0"
tab MOTHER_Y_NO_FAT
//
tab FATHER_MOTHER_ATTEND SEC_FALL_RET, col row
tab FATHER_MOTHER_ATTEND SEC_FALL_RET if EOF_INDICATOR=="EOF", col row //do make a comment--what this all means, whats the bottomline!
tab FATHER_MOTHER_ATTEND SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab FATHER_MOTHER_NOT_ATTEND SEC_FALL_RET, col row
tab FATHER_MOTHER_NOT_ATTEND SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab FATHER_MOTHER_NOT_ATTEND SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab FATHER_Y_NO_MOM SEC_FALL_RET, col row
tab FATHER_Y_NO_MOM SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab FATHER_Y_NO_MOM SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab MOTHER_Y_NO_FAT SEC_FALL_RET, col row
tab MOTHER_Y_NO_FAT SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab MOTHER_Y_NO_FAT SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab EOF_SIBLING SEC_FALL_RET, col row
tab EOF_SIBLING SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab EOF_SIBLING SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab NAT_SCH_LUNCH SEC_FALL_RET, col row
tab NAT_SCH_LUNCH SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab NAT_SCH_LUNCH SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab COLL_PREP_PROG SEC_FALL_RET, col row
tab COLL_PREP_PROG SEC_FALL_RET if EOF_INDICATOR=="EOF", col row
tab COLL_PREP_PROG SEC_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
//CROSSSTABULATIONS SO TO JR
tab GENDER THRD_FALL_RET, col row
tab GENDER THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab GENDER THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab UNIT THRD_FALL_RET, col row
tab UNIT THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab UNIT THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab REGION_CD THRD_FALL_RET, col row
tab REGION_CD THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab REGION_CD THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab DFG_SCHOOL THRD_FALL_RET, col row
tab DFG_SCHOOL THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab DFG_SCHOOL THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab HIGH_DITRESS_MNCPLTY THRD_FALL_RET, col row
tab HIGH_DITRESS_MNCPLTY THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab HIGH_DITRESS_MNCPLTY THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab FATHER_COLLEGE THRD_FALL_RET, col row
tab FATHER_COLLEGE THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab FATHER_COLLEGE THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab MOTHER_COLLEGE THRD_FALL_RET, col row
tab MOTHER_COLLEGE THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab MOTHER_COLLEGE THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab EOF_SIBLING THRD_FALL_RET, col row
tab EOF_SIBLING THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab EOF_SIBLING THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab NAT_SCH_LUNCH THRD_FALL_RET, col row
tab NAT_SCH_LUNCH THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab NAT_SCH_LUNCH THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab COLL_PREP_PROG THRD_FALL_RET, col row
tab COLL_PREP_PROG THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab COLL_PREP_PROG THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
//
tab FATHER_MOTHER_ATTEND THRD_FALL_RET, col row
tab FATHER_MOTHER_ATTEND THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab FATHER_MOTHER_ATTEND THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab FATHER_MOTHER_NOT_ATTEND THRD_FALL_RET, col row
tab FATHER_MOTHER_NOT_ATTEND THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab FATHER_MOTHER_NOT_ATTEND THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab FATHER_Y_NO_MOM THRD_FALL_RET, col row
tab FATHER_Y_NO_MOM THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab FATHER_Y_NO_MOM THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
tab MOTHER_Y_NO_FAT THRD_FALL_RET, col row
tab MOTHER_Y_NO_FAT THRD_FALL_RET if EOF_INDICATOR=="EOF", col row
tab MOTHER_Y_NO_FAT THRD_FALL_RET if EOF_INDICATOR=="NON-EOF", col row
//
//TO GENERATE INDICATORS FOR REMEDIAL COURSEWORK //again probably should go earlier together with other recoding; 
//in general keep chunks of code about the same thing together
gen REMEDIAL_MATH=GRADE640041
replace REMEDIAL_MATH="1" if REMEDIAL_MATH=="PA"
replace REMEDIAL_MATH="1" if REMEDIAL_MATH=="S"
replace REMEDIAL_MATH="1" if REMEDIAL_MATH=="U"
replace REMEDIAL_MATH="1" if REMEDIAL_MATH=="W"
replace REMEDIAL_MATH="1" if REMEDIAL_MATH=="Z"
replace REMEDIAL_MATH="1" if GRADE640042=="S"
replace REMEDIAL_MATH="1" if GRADE640042=="U"
replace REMEDIAL_MATH="1" if GRADE640042=="W"
replace REMEDIAL_MATH="1" if GRADE640042=="Z"
replace REMEDIAL_MATH="0" if REMEDIAL_MATH==""
/*Need to Check if GRADE640043 is remedial or equivalent to 640ECM*/
gen REMEDIAL_ENG=GRADE350100
replace REMEDIAL_ENG="Y" if GRADE350100=="A"
replace REMEDIAL_ENG="Y" if GRADE350100=="B"
replace REMEDIAL_ENG="Y" if GRADE350100=="B+"
replace REMEDIAL_ENG="Y" if GRADE350100=="C"
replace REMEDIAL_ENG="Y" if GRADE350100=="C+"
replace REMEDIAL_ENG="Y" if GRADE350100=="D"
replace REMEDIAL_ENG="Y" if GRADE350100=="F"
replace REMEDIAL_ENG="Y" if GRADE350100=="W"
replace REMEDIAL_ENG="Y" if GRADE350100=="Z"

