create database doctors;
show variables like "secure_file_priv";
create table bhs_doctors (
CIVIL_LIST_NO varchar(50),
COMBINED_MERIT_BPSC varchar(30),
ROLL_NO_BPSC varchar(200), 	
DOCTOR_ID varchar(20),	
BTSC_REG_NO	varchar(20),
NAME varchar(50),
SELECTION_CATEGORY varchar(30),
ACTUAL_CATEGORY	varchar(30),
DESIGNATION	varchar(100),
HOME_DISTRICT varchar(50),
DOB varchar(12),
LAST_POSTING_DISTRICT varchar(50),
PRESENT_POSTING_DISTRICT varchar(50),
ADVERTISEMENT_NO varchar(50),
FIRST_JOINING_NOTIF_NO	varchar(100),
FIRST_JOINING_DATE	varchar(30),
DEPUTATION varchar(200),
REMARKS varchar(300),
REMARKS_2 varchar(400),
REMARKS_SANCTIONED_POST varchar(300),
PRESENT_POSTING_PLACE varchar(300),
TOKEN varchar(50),
REMARKS_FROM_SECTION9 varchar(300),
CONTACT_NUMBER varchar(30)
);
SET @@global.sql_mode= '';

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bhs_doctors.csv'
into table bhs_doctors
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*queries*/

/* SELECT ALL THE INFORMATION FROM THE TABLE */
select * from bhs_doctors;

/*HOW MANY DOCTORS ARE THERE HAVING A COURT CASE?*/
select NAME from bhs_doctors where COMBINED_MERIT_BPSC="COURT CASE";

/*HOW MANY DOCTORS HAVE RETIRED?*/
select count(NAME) from bhs_doctors where TOKEN="RETIRED";

/*HOW MANY DOCTORS HAVE JOINED BMES SERVICE?*/
select count(NAME) from bhs_doctors where TOKEN like "*BMES*";

/*HOW MANY DOCTORS HAVE TAKEN VRS?*/
select count(NAME) from bhs_doctors where TOKEN="V.R.S.";

/*LIST OF DOCTORS POSTED IN BUXAR*/
select count(NAME) from bhs_doctors where PRESENT_POSTING_DISTRICT like "Buxar";
select NAME from bhs_doctors where PRESENT_POSTING_DISTRICT like "Buxar";

/*HOW MANY DOCTORS HAVE NOT PROVIDED CONTACT NUMBER?*/
select count(NAME) from bhs_doctors where CONTACT_NUMBER="NA";

/*NAME OF 5 SENIOR DOCTORS ELIGIBLE FOR TRANSFER*/
select NAME from bhs_doctors where TOKEN="NA" order by DOCTOR_ID DESC limit 5;

/* NAME OF DOCTORS WHO QUALIFIED BTSC AND GOT PROMOTED */
select NAME, BTSC_REG_NO, HOME_DISTRICT, DOB from bhs_doctors where BTSC_REG_NO LIKE 'BR%' ORDER BY BTSC_REG_NO;

/*NAME OF THE DOCTORS WHOSE HOME DISTRICT & POSTING DISTRICT ARE SAME*/
select * from bhs_doctors where HOME_DISTRICT=PRESENT_POSTING_DISTRICT;

/*LIST OF DOCTORS WHO HAVE NOT BEEN TRANSFERRED*/
select * from bhs_doctors where LAST_POSTING_DISTRICT=PRESENT_POSTING_DISTRICT;

/*LIST OF DOCTORS WHO ARE DEPUTY DIRECTORS*/
select NAME, HOME_DISTRICT, DOB, DESIGNATION from bhs_doctors where DESIGNATION Like '%deputy director%';

/*LIST OF DOCTORS WHO ARE ADDITIONAL DIRECTORS*/
select NAME, HOME_DISTRICT, DOB, DESIGNATION from bhs_doctors where DESIGNATION Like '%ADDITIONAL director%';





    

