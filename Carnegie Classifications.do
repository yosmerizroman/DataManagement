
****************************************************************************
* Yosmeriz Roman
* File Name: Carnegie Classification Labels.do
* Purpose: To affix labels from the Carnegie public file to stata file
*			named "CCIHE2015.dta" 
****************************************************************************

* get the file from http://carnegieclassifications.iu.edu/downloads/CCIHE2015-PublicDataFile.xlsx

local carnegieweb "http://carnegieclassifications.iu.edu/downloads/"

import excel "`carnegieweb'CCIHE2015-PublicDataFile.xlsx", ///
		sheet("Data") firstrow clear

#delimit ;
label var 	CC2000		"2000 Carnegie Classification (historical - not updated)"
;
label def	CC2000
-3	"Not classified, not in classification universe"
15	"Doctoral/Research Universities—Extensive"
16	"Doctoral/Research Universities—Intensive"
21	"Master's Colleges and Universities I"
22	"Master's Colleges and Universities II"
31	"Baccalaureate Colleges—Liberal Arts"
32	"Baccalaureate Colleges—General"
33	"Baccalaureate/Associate's Colleges"
40	"Associate's Colleges"
51	"Specialized Institutions—Theological seminaries and other specialized faith-related institutions"
52	"Specialized Institutions—Medical schools and medical centers"
53	"Specialized Institutions—Other separate health profession schools"
54	"Specialized Institutions—Schools of engineering and technology"
55	"Specialized Institutions—Schools of business and management"
56	"Specialized Institutions—Schools of art, music, and design"
57	"Specialized Institutions—Schools of law"
58	"Specialized Institutions—Teachers colleges"
59	"Specialized Institutions—Other specialized institutions"
60	"Tribal colleges and universities"
;
label val 	CC2000 CC2000
;


label var	BASIC2005 	"2005 Basic Classification (historical - not updated)"
;
label def	BASIC0510
-3	"Not classified, not in classification universe"
1	"Assoc/Pub-R-S: Associate's--Public Rural-serving Small"
2	"Assoc/Pub-R-M: Associate's--Public Rural-serving Medium"
3	"Assoc/Pub-R-L: Associate's--Public Rural-serving Large"
4	"Assoc/Pub-S-SC: Associate's--Public Suburban-serving Single Campus"
5	"Assoc/Pub-S-MC: Associate's--Public Suburban-serving Multicampus"
6	"Assoc/Pub-U-SC: Associate's--Public Urban-serving Single Campus"
7	"Assoc/Pub-U-MC: Associate's--Public Urban-serving Multicampus"
8	"Assoc/Pub-Spec: Associate's--Public Special Use"
9	"Assoc/PrivNFP: Associate's--Private Not-for-profit"
10	"Assoc/PrivFP: Associate's--Private For-profit"
11	"Assoc/Pub2in4: Associate's--Public 2-year colleges under 4-year universities"
12	"Assoc/Pub4: Associate's--Public 4-year Primarily Associate's"
13	"Assoc/PrivNFP4: Associate's--Private Not-for-profit 4-year Primarily Associate's"
14	"Assoc/PrivFP4: Associate's--Private For-profit 4-year Primarily Associate's"
15	"RU/VH: Research Universities (very high research activity)"
16	"RU/H: Research Universities (high research activity)"
17	"DRU: Doctoral/Research Universities"
18	"Master's L: Master's Colleges and Universities (larger programs)"
19	"Master's M: Master's Colleges and Universities (medium programs)"
20	"Master's S: Master's Colleges and Universities (smaller programs)"
21	"Bac/A&S: Baccalaureate Colleges--Arts & Sciences"
22	"Bac/Diverse: Baccalaureate Colleges--Diverse Fields"
23	"Bac/Assoc: Baccalaureate/Associate's Colleges"
24	"Spec/Faith: Special Focus Institutions--Theological seminaries, Bible colleges, and other faith-related institutions"
25	"Spec/Med: Special Focus Institutions--Medical schools and medical centers"
26	"Spec/Health: Special Focus Institutions--Other health professions schools"
27	"Spec/Engg: Special Focus Institutions--Schools of engineering"
28	"Spec/Tech: Special Focus Institutions--Other technology-related schools"
29	"Spec/Bus: Special Focus Institutions--Schools of business and management"
30	"Spec/Arts: Special Focus Institutions--Schools of art, music, and design"
31	"Spec/Law: Special Focus Institutions--Schools of law"
32	"Spec/Other: Special Focus Institutions--Other special-focus institutions"
33	"Tribal: Tribal Colleges"
;
label var	BASIC2010 	"2010 Basic Classification (historical - not updated)"
;
label val BASIC2005 BASIC2010 BASIC0510
;
label def	BASIC2015
0	"(Not classified)"
1	"Associate's Colleges: High Transfer-High Traditional"
2	"Associate's Colleges: High Transfer-Mixed Traditional/Nontraditional"
3	"Associate's Colleges: High Transfer-High Nontraditional"
4	"Associate's Colleges: Mixed Transfer/Career & Technical-High Traditional"
5	"Associate's Colleges: Mixed Transfer/Career & Technical-Mixed Traditional/Nontraditional"
6	"Associate's Colleges: Mixed Transfer/Career & Technical-High Nontraditional"
7	"Associate's Colleges: High Career & Technical-High Traditional"
8	"Associate's Colleges: High Career & Technical-Mixed Traditional/Nontraditional"
9	"Associate's Colleges: High Career & Technical-High Nontraditional"
10	"Special Focus Two-Year: Health Professions"
11	"Special Focus Two-Year: Technical Professions"
12	"Special Focus Two-Year: Arts & Design"
13	"Special Focus Two-Year: Other Fields"
14	"Baccalaureate/Associate's Colleges: Associate's Dominant"
15	"Doctoral Universities: Highest Research Activity"
16	"Doctoral Universities: Higher Research Activity"
17	"Doctoral Universities: Moderate Research Activity"
18	"Master's Colleges & Universities: Larger Programs"
19	"Master's Colleges & Universities: Medium Programs"
20	"Master's Colleges & Universities: Small Programs"
21	"Baccalaureate Colleges: Arts & Sciences Focus"
22	"Baccalaureate Colleges: Diverse Fields"
23	"Baccalaureate/Associate's Colleges: Mixed Baccalaureate/Associate's"
24	"Special Focus Four-Year: Faith-Related Institutions"
25	"Special Focus Four-Year: Medical Schools & Centers"
26	"Special Focus Four-Year: Other Health Professions Schools"
27	"Special Focus Four-Year: Engineering Schools"
28	"Special Focus Four-Year: Other Technology-Related Schools"
29	"Special Focus Four-Year: Business & Management Schools"
30	"Special Focus Four-Year: Arts, Music & Design Schools"
31	"Special Focus Four-Year: Law Schools"
32	"Special Focus Four-Year: Other Special Focus Institutions"
33	"Tribal Colleges"
;
label var	BASIC2015 	"2015 Carnegie Basic Classification"
;
label val	BASIC2015	 BASIC2015
;
label def	IPUG2015
0	"Not Classified (Exclusively Graduate Programs)"
1	"Associate's Colleges: High Transfer"
2	"Associate's Colleges: Mixed Transfer/Career & Technical"
3	"Associate's Colleges: High Career & Technical"
4	"Special Focus: Two-Year Institution"
5	"Baccalaureate/Associates Colleges"
6	"Arts & sciences focus, no graduate coexistence"
7	"Arts & sciences focus, some graduate coexistence"
8	"Arts & sciences focus, high graduate coexistence"
9	"Arts & sciences plus professions, no graduate coexistence"
10	"Arts & sciences plus professions, some graduate coexistence"
11	"Arts & sciences plus professions, high graduate coexistence"
12	"Balanced arts & sciences/professions, no graduate coexistence"
13	"Balanced arts & sciences/professions, some graduate coexistence"
14	"Balanced arts & sciences/professions, high graduate coexistence"
15	"Professions plus arts & sciences, no graduate coexistence"
16	"Professions plus arts & sciences, some graduate coexistence"
17	"Professions plus arts & sciences, high graduate coexistence"
18	"Professions focus, no graduate coexistence"
19	"Professions focus, some graduate coexistence"
20	"Professions focus, high graduate coexistence"
;
label var	IPUG2015 	"2015 Undergraduate Instructional Program Classification"
;
label val	IPUG2015 	IPUG2015
;
label def	IPGRAD2015
0	"Not classified (Exclusively Undergraduate)	"
1	"Postbaccalaureate: Single program-Education	"
2	"Postbaccalaureate: Single program-Business	"
3	"Postbaccalaureate: Single program-Other	"
4	"Postbaccalaureate: Comprehensive programs	"
5	"Postbaccalaureate: Arts & sciences-dominant	"
6	"Postbaccalaureate: Education-dominant, with Arts & Sciences	"
7	"Postbaccalaureate: Business-dominant, with Arts & Sciences	"
8	"Postbaccalaureate: Other-dominant, with Arts & Sciences	"
9	"Postbaccalaureate: Education-dominant, with other professional programs	"
10	"Postbaccalaureate: Business-dominant, with other professional programs	"
11	"Postbaccalaureate: Other-dominant, with other professional programs	"
12	"Research Doctoral: Single program-Education	"
13	"Research Doctoral: Single program-Other	"
14	"Research Doctoral: Comprehensive programs, with medical/veterinary school	"
15	"Research Doctoral: Comprehensive programs, no medical/veterinary school	"
16	"Research Doctoral: Humanities/social sciences-dominant	"
17	"Research Doctoral: STEM-dominant	"
18	"Research Doctoral: Professional-dominant	"
;
label var	IPGRAD2015	"2015 Graduate Instructional Program Classification"
;
label val	IPGRAD2015	IPGRAD2015
;
label def	UGPROFILE2015
0	"Not classified (Exclusively Graduate)"
1	"Two-year, higher part-time"
2	"Two-year, mixed part/full-time"
3	"Two-year, medium full-time"
4	"Two-year, higher full-time"
5	"Four-year, higher part-time"
6	"Four-year, medium full-time, inclusive, lower transfer-in"
7	"Four-year, medium full-time, inclusive, higher transfer-in"
8	"Four-year, medium full-time, selective, lower transfer-in"
9	"Four-year, medium full-time , selective, higher transfer-in"
10	"Four-year, full-time, inclusive, lower transfer-in"
11	"Four-year, full-time, inclusive, higher transfer-in"
12	"Four-year, full-time, selective, lower transfer-in"
13	"Four-year, full-time, selective, higher transfer-in"
14	"Four-year, full-time, more selective, lower transfer-in"
15	"Four-year, full-time, more selective, higher transfer-in"
;
label var	UGPROFILE2015	"2015 Undergraduate Profile Classification"
;
label val	IPGRAD2015 IPGRAD2015
;
label def	ENRPROFILE2015
0	"(Not classified)"
1	"Exclusively undergraduate two-year"
2	"Exclusively undergraduate four-year"
3	"Very high undergraduate"
4	"High undergraduate"
5	"Majority undergraduate"
6	"Majority graduate"
7	"Exclusively graduate"
;
label var	ENRPROFILE2015	"2015 Enrollment Profile Classification"
;
label val 	ENRPROFILE2015 ENRPROFILE2015
;
label def	SIZESET2015
0	"(Not classified)"
1	"Two-year, very small"
2	"Two-year, small"
3	"Two-year, medium"
4	"Two-year, large"
5	"Two-year, very large"
6	"Four-year, very small, primarily nonresidential"
7	"Four-year, very small, primarily residential"
8	"Four-year, very small, highly residential"
9	"Four-year, small, primarily nonresidential"
10	"Four-year, small, primarily residential"
11	"Four-year, small, highly residential"
12	"Four-year, medium, primarily nonresidential"
13	"Four-year, medium, primarily residential"
14	"Four-year, medium, highly residential"
15	"Four-year, large, primarily nonresidential"
16	"Four-year, large, primarily residential"
17	"Four-year, large, highly residential"
18	"Exclusively graduate/professional"
;
label var	SIZESET2015	"2015 Size and Setting Classification"
;
label val	SIZESET2015	SIZESET2015
;
label def	CCE2015
0	"Not Classified"
1	"Classified"
;
label var	CCE2015		"2015 Carnegie Community Engagement Elective Classification"
;
label val	CCE2015 	CCE2015
;
label def	SECTOR
1	"Public, 4-year or above"
2	"Private not-for-profit, 4-year or above"
3	"Private for-profit, 4-year or above"
4	"Public, 2-year"
5	"Private not-for-profit, 2-year"
6	"Private for-profit, 2-year"
;
label var	SECTOR		"Sector of institution (control and level combined)"
;
label val	SECTOR	SECTOR
;
label def	ICLEVEL
1	"Four or more years"
2	"At least 2 but less than 4 years"
;
label var	ICLEVEL		"Level of institution"
;
label val	ICLEVEL	ICLEVEL
;
label def	CONTROL
1	"Public"
2	"Private not-for-profit"
3	"Private for-profit"
;
label var	CONTROL		"Control of institution (IPEDS)"
;
label val	CONTROL	CONTROL
;
label def	OBEREG
0	"US Service schools"
1	"New England CT ME MA NH RI VT"
2	"Mid East DE DC MD NJ NY PA"
3	"Great Lakes IL IN MI OH WI"
4	"Plains IA KS MN MO NE ND SD"
5	"Southeast AL AR FL GA KY LA MS NC SC TN VA WV"
6	"Southwest AZ NM OK TX"
7	"Rocky Mountains CO ID MT UT WY"
8	"Far West AK CA HI NV OR WA"
9	"Outlying areas AS FM GU MH MP PR PW VI"
;
label var	OBEREG		"Region code"
;
label val 	OBEREG	OBEREG
;
label def	LOCALE
-3	"{Not available}"
11	"City Large"
12	"City Midsize"
13	"City Small"
21	"Suburb Large"
22	"Suburb Midsize"
23	"Suburb Small"
31	"Town Fringe"
32	"Town Distant"
33	"Town Remote"
41	"Rural Fringe"
42	"Rural Distant"
43	"Rural Remote"
;
label var	LOCALE		"Degree of urbanization (Urban-centric locale)"
;
label val	LOCALE	LOCALE
;
label def	YES_1NO_0
0	"No"
1	"Yes"
;
label var	LANDGRNT	"Land-grant institution"
;
label var	HBCU		"Historically Black College or University"
;
label var	TRIBAL		"Tribal College"
;
label var	MEDICAL		"Institution grants a medical degree (MD, DDS, DMD, DO, DVM)"
;
label var	HSI 		"Hispanic Serving Institution"
;
label var	MSI			"Minority Serving Institution"
;
label var	WOMENS		"Women's College"
;
label var	COPLAC		"Council of Public Liberal Arts Colleges Member"
;
label var	CUSU		"Coalition of Urban Serving Universities Member"
;
label var	CUMU		"Coalition of Urban and Metropolitan Universities Member"
;
label val	LANDGRNT	
			HBCU
			TRIBAL
			MEDICAL
			HSI
			MSI
			WOMENS
			COPLAC
			CUSU
			CUMU		YES_1NO_0
;
label def	FAITHFLAG
0	"Not previously known to be faith-related"
1	"Previsously known to be faith-related"
;
label var	FAITHFLAG	"Faith-related institution flag"
;
label val	FAITHFLAG	FAITHFLAG
;
label def	OTHSFFLAG
0	"Previously known to be special focus"
1	"Not-previously known to be special focus"
;
label var	OTHSFFLAG	"Flag for special focus institutions, other than faith-related, as determined by prior classification"
;
label val	OTHSFFLAG	OTHSFFLAG
;
label def	DOCRESFLAG
0	"	Did not confer research/scholarship doctoral degrees	"
1	"	Conferred research/scholarship doctoral degrees	"
;
label var	DOCRESFLAG	"Institution confers research/scholarship doctoral degrees"
;
label val 	DOCRESFLAG	DOCRESFLAG
;
label var	ACTCAT		"Final ACT category (1=inclusive; 2=selective; 3=more selective)"
;
label def	ACTCAT
1	"Inclusive"
2	"Selective"
3	"More selective"
;
label val	ACTCAT ACTCAT
;
tostring UNITID, gen(unitid) format(%06.0f) 
;
#delimit cr

save "CarnegieClassification", replace

log close 
exit
