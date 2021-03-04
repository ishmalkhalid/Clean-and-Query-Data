# Overview
## About the Data

1. Name / Title: WHO Suicide Statistics

2. Link to Data: https://www.kaggle.com/szamil/who-suicide-statistics

3. Source / Origin: 
	* Author or Creator: Szamil
	* Publication Date: 2018-08-30
	* Publisher: Szamil
	* Version or Data Accessed: Version 1
    
4. License: CC BY-NC-SA 3.0 IGO (Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Intergovernmental Organization)
	
5. Can You Use this Data Set for Your Intended Use Case? Yes, as stated by the license that: "Extracts of the information in the web site may be reviewed, reproduced or translated for research or private study but not for sale or for use in conjunction with commercial purposes."

## Format

### Overview

Format: Comma Separated Values (csv)
Size: 1,809 KB
Number of Records: 43776

### Sample of Data

Albania,2015,male,35-54 years,,374464
Albania,2015,male,5-14 years,,184114
Albania,2015,male,55-74 years,,287770
Albania,2015,male,75+ years,,64200
Anguilla,1983,female,15-24 years,0,
Anguilla,1983,female,25-34 years,0,
Anguilla,1983,female,35-54 years,0,
Anguilla,1983,female,5-14 years,0,

### Fields or Column Headers

* country: String
* year: Integer
* sex: String
* age: String
* suicides_no: Integer
* population: Integer

# Table Design 

THESE WERE MY FIELDS

country TEXT NOT NULL,
year INTEGER NOT NULL,
sex TEXT NOT NULL,
age TEXT NOT NULL,
suicides_no INTEGER,
population INTEGER,
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL

For my column 1 "country", I used the TEXT data type as all the values are written in plain string and represent each country. There is a value for country in each row therefore I have not allowed NULL values for this field.

For my column 2 "year", I used the INTEGER data type as all the values are written in plain integers and represent each year. There is a value for year in each row therefore I have not allowed NULL values for this field.

For my column 3 "sex", I used the TEXT data type as all the values are written in plain string and represent one of the two sexes "male" or "female". There is a value for sex in each row therefore I have not allowed NULL values for this field.

For my column 4 "age", I used the TEXT data type as all the values are written in a mix of integers and alphabets and represent age groups. There is a value for age in each row therefore I have not allowed NULL values for this field.

For my column 5 "suicides_no", I used the INTEGER data type as all the values are written in plain integers and represent the number of suicides. There is not a value for suicide_no in each row therefore I have allowed NULL values for this field.

For my column 6 "population", I used the INTEGER data type as all the values are written in plain integers and represent the overall population. There is not a value for population in each row therefore I have allowed NULL values for this field.

For my column 7 "id", I set it as the primary key for my dataset as I did not have a column which had unique values for each row. my "id" automatically increments with each row and it cannot be a NULL value as each row must have a primary key. It is unique to each row of the table.

# Import

While importing my file to the database I encountered an error pertinent to the file path. Initially I used an absolute file path to import data from my csv file but it gave me an error. Due to this reason, I put the process file in same directory as source file and ran from there using relative file path. This allowed me to import my data into my table and save the database. 

# Database Information

COMMAND (1):
	sqlite> .tables
```
-- OUTPUT
	suicidestats
```

COMMAND (2):
	sqlite> .schema
```
-- OUTPUT
	CREATE TABLE suicidestats (
	        country TEXT NOT NULL,
	        year INTEGER NOT NULL,
	        sex TEXT NOT NULL,
	        age TEXT NOT NULL,
	        suicides_no INTEGER,
	        population INTEGER,
	        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
	        );
	        
	CREATE TABLE sqlite_sequence(name,seq);
```

# Query Results

```
-- 1. do some rudimentary data cleaning by modifying values in a column or columns (such as change '' to NULL, cast types, etc.) … instead of adding the results of the query or queries to report.md, write the motivation for modifying / cleaning your data in this way	
sqlite> UPDATE suicidestats


This query produces no output.

```

```
-- 2. the total number of rows in the database

COUNT (*)
---------
41520

```

```
-- 3. show the first 15 rows, but only display 3 columns (your choice)
age          sex     population
-----------  ------  ----------
15-24 years  female  289700
25-34 years  female  257200
35-54 years  female  278800
5-14 years   female  311000
55-74 years  female  144600
75+ years    female  35600
15-24 years  male    312900
25-34 years  male    274300
35-54 years  male    308000
5-14 years   male    338200
55-74 years  male    137500
75+ years    male    21800
15-24 years  female  295600
25-34 years  female  262400
35-54 years  female  284500

```

```
-- 4. do the same as above, but choose a column to sort on, and sort in descending order
age          sex     population
-----------  ------  ----------
35-54 years  female  43805214
35-54 years  female  43607902
35-54 years  female  43509335
35-54 years  female  43240905
35-54 years  male    43139910
35-54 years  male    43002471
35-54 years  female  42997878
35-54 years  male    42992076
35-54 years  female  42957716
35-54 years  male    42932194
35-54 years  female  42893858
35-54 years  female  42836835
35-54 years  male    42835394
35-54 years  male    42798501
35-54 years  female  42711237
```

```
--5. add a new column without a default value


This query produces no output.
```

```
--6. set the value of that new column


This query produces no output.
```

```
--7. show only the unique (non duplicates) of a column of your choice

age
-----------
15-24 years
25-34 years
35-54 years
5-14 years
55-74 years
75+ years
```

```
--8. group rows together by a column value (your choice) and use an aggregate function to calculate something about that group (count of all members of the group, the average of a column of the members of the group)
----- show the column that is used for grouping AND the result of the aggregate function (so, 2 columns minimum on output)

country                             sum(suicides_no)
----------------------------------  ----------------
Albania                             1970
Anguilla                            2
Antigua and Barbuda                 11
Argentina                           93862
Armenia                             2422
Aruba                               120
Australia                           80279
Austria                             60179
Azerbaijan                          3366
Bahamas                             107
Bahrain                             463
Barbados                            205
Belarus                             74974
Belgium                             75948
Belize                              352
Bermuda                             91
Bolivia                             54
Bosnia and Herzegovina              3591
Brazil                              250824
British Virgin Islands              8
Brunei Darussalam                   123
Bulgaria                            42868
Cabo Verde                          42
Canada                              128382
Cayman Islands                      19
Chile                               44126
Colombia                            54136
Costa Rica                          7346
Croatia                             29400
Cuba                                41418
Cyprus                              412
Czech Republic                      51664
Denmark                             15297
Dominica                            54
Dominican Republic                  5312
Ecuador                             22595
Egypt                               1206
El Salvador                         13865
Estonia                             12671
Falkland Islands (Malvinas)         1
Fiji                                304
Finland                             33677
France                              395500
French Guiana                       264
Georgia                             4971
Germany                             291262
Greece                              14385
Grenada                             38
Guadeloupe                          583
Guatemala                           8403
Guyana                              3438
Haiti                               28
Honduras                            1072
Hong Kong SAR                       29691
Hungary                             130018
Iceland                             1230
Iran (Islamic Rep of)               7299
Iraq                                3
Ireland                             13960
Israel                              12663
Italy                               157074
Jamaica                             198
Japan                               937614
Jordan                              87
Kazakhstan                          123151
Kiribati                            53
Kuwait                              1013
Kyrgyzstan                          16436
Latvia                              24861
Lithuania                           42166
Luxembourg                          2367
Macau                               27
Malaysia                            939
Maldives                            20
Malta                               587
Martinique                          538
Mauritius                           4062
Mayotte                             6
Mexico                              117479
Monaco                              17
Mongolia                            450
Montenegro                          472
Montserrat                          1
Morocco                             664
Netherlands                         60205
Netherlands Antilles                107
New Zealand                         16447
Nicaragua                           7613
Norway                              16992
Occupied Palestinian Territory      58
Oman                                33
Panama                              3691
Paraguay                            5082
Peru                                7711
Philippines                         21330
Poland                              172562
Portugal                            28413
Puerto Rico                         10838
Qatar                               576
Republic of Korea                   261730
Republic of Moldova                 22447
Reunion                             1266
Rodrigues                           43
Romania                             72793
Russian Federation                  1500992
Saint Kitts and Nevis               25
Saint Lucia                         244
Saint Pierre and Miquelon           5
Saint Vincent and Grenadines        124
San Marino                          26
Sao Tome and Principe               4
Saudi Arabia                        135
Serbia                              24179
Seychelles                          98
Singapore                           11510
Slovakia                            13437
Slovenia                            16805
South Africa                        7321
Spain                               110097
Sri Lanka                           80747
Suriname                            2492
Sweden                              37800
Switzerland                         26217
Syrian Arab Republic                417
TFYR Macedonia                      3477
Tajikistan                          4773
Thailand                            129899
Trinidad and Tobago                 4447
Tunisia                             32
Turkey                              10131
Turkmenistan                        9644
Turks and Caicos Islands            6
Ukraine                             365170
United Arab Emirates                622
United Kingdom                      166314
United States of America            1201401
Uruguay                             14647
Uzbekistan                          44063
Venezuela (Bolivarian Republic of)  29504
Virgin Islands (USA)                113
Zimbabwe                            764
```

```
--9. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups (for example, show all genres that have more than 2 movies in it and only show the genre and the number of movies for that genre).
---- you'll use a HAVING clause to do this (covered in the slides on group by)

country                   sum(suicides_no)
------------------------  ----------------
Brazil                    250824
Canada                    128382
France                    395500
Germany                   291262
Hungary                   130018
Italy                     157074
Japan                     937614
Kazakhstan                123151
Mexico                    117479
Poland                    172562
Republic of Korea         261730
Russian Federation        1500992
Spain                     110097
Thailand                  129899
Ukraine                   365170
United Kingdom            166314
United States of America  1201401
```

```
--Add another 3 queries of your own that helps you gain some insight on your data (ok to reproduce the work that you did previously for the previous homework… but using sql instead of python). You must include one of each of the following in any of your queries (that is, one of #1 and one of #2 below in any part of your work for queries 10-12):
--10. Find the rounded average number of suicides in Japan for each age group 

round(avg(suicides_no))
-----------------------
2112.0
```

```
--11. Display the country, age and sex for the max number of suicides 


country             age          sex   max(suicides_no)
------------------  -----------  ----  ----------------
Russian Federation  35-54 years  male  22338
```

```
--12. Display the country for the sum of suicides once the values are grouped by country and order them in ascending order by the sum of suicides and limit them to 5 categories


country                      sum(suicides_no)
---------------------------  ----------------
Falkland Islands (Malvinas)  1
Montserrat                   1
Anguilla                     2
Iraq                         3
Sao Tome and Principe        4
```

