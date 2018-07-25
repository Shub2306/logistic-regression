libname lo '/folders/myfolders/BA Case Study/Regression Case Studies - Linear & Logistic/Proactive Attrition Management-Logistic Regression Case Study';

proc import datafile='/folders/myfolders/BA Case Study/Regression Case Studies - Linear & Logistic/Proactive Attrition Management-Logistic Regression Case Study/PAM.csv'
out=lo.pam dbms=csv replace;
getnames= yes;
run;

proc contents data=lo.pam varnum;
run;

proc means data=lo.pam N Nmiss mean std min P1 P5 P10 P25 P50 P75 P90 P95 P99 max;
run;

/* OUTLIER TREATMENT */
DATA PAM;
SET LO.PAM;
if  REVENUE >  135.24  Then REVENUE =  135.24 ;
if  MOU >  1579.25  Then MOU =  1579.25 ;
if  RECCHRGE >  85  Then RECCHRGE =  85 ;
if  DIRECTAS >  4.21  Then DIRECTAS =  4.21 ;
if  OVERAGE >  190  Then OVERAGE =  190 ;
if  ROAM >  5.07  Then ROAM =  5.07 ;
if  CHANGEM >  343.75  Then CHANGEM =  343.75 ;
if  CHANGER >  45.9  Then CHANGER =  45.9 ;
if  DROPVCE >  22  Then DROPVCE =  22 ;
if  BLCKVCE >  17.33  Then BLCKVCE =  17.33 ;
if  UNANSVCE >  97.67  Then UNANSVCE =  97.67 ;
if  CUSTCARE >  9.33  Then CUSTCARE =  9.33 ;
if  THREEWAY >  1.33  Then THREEWAY =  1.33 ;
if  MOUREC >  440.95  Then MOUREC =  440.95 ;
if  OUTCALLS >  90.33  Then OUTCALLS =  90.33 ;
if  INCALLS >  35.67  Then INCALLS =  35.67 ;
if  PEAKVCE >  279.67  Then PEAKVCE =  279.67 ;
if  OPEAKVCE >  242  Then OPEAKVCE =  242 ;
if  DROPBLK >  35.33  Then DROPBLK =  35.33 ;
if  CALLFWDV >  0  Then CALLFWDV =  0 ;
if  CALLWAIT >  8.67  Then CALLWAIT =  8.67 ;
if  CHURN >  1  Then CHURN =  1 ;
if  MONTHS >  37  Then MONTHS =  37 ;
if  UNIQSUBS >  3  Then UNIQSUBS =  3 ;
if  ACTVSUBS >  2  Then ACTVSUBS =  2 ;
if  PHONES >  4  Then PHONES =  4 ;
if  MODELS >  3  Then MODELS =  3 ;
if  EQPDAYS >  866  Then EQPDAYS =  866 ;
if  CUSTOMER >  1095336  Then CUSTOMER =  1095336 ;
if  AGE1 >  62  Then AGE1 =  62 ;
if  AGE2 >  60  Then AGE2 =  60 ;
if  RETCALLS >  0  Then RETCALLS =  0 ;
if  RETACCPT >  0  Then RETACCPT =  0 ;
if  REFER >  0  Then REFER =  0 ;
if  INCOME >  9  Then INCOME =  9 ;
if  CREDITAD >  0  Then CREDITAD =  0 ;
if  SETPRC >  149.99  Then SETPRC =  149.99 ;
if  REVENUE <  15.57  Then REVENUE =  15.57 ;
if  MOU <  20.5  Then MOU =  20.5 ;
if  RECCHRGE <  10  Then RECCHRGE =  10 ;
if  DIRECTAS <  0  Then DIRECTAS =  0 ;
if  OVERAGE <  0  Then OVERAGE =  0 ;
if  ROAM <  0  Then ROAM =  0 ;
if  CHANGEM <  -374  Then CHANGEM =  -374 ;
if  CHANGER <  -47.23  Then CHANGER =  -47.23 ;
if  DROPVCE <  0  Then DROPVCE =  0 ;
if  BLCKVCE <  0  Then BLCKVCE =  0 ;
if  UNANSVCE <  0  Then UNANSVCE =  0 ;
if  CUSTCARE <  0  Then CUSTCARE =  0 ;
if  THREEWAY <  0  Then THREEWAY =  0 ;
if  MOUREC <  0  Then MOUREC =  0 ;
if  OUTCALLS <  0  Then OUTCALLS =  0 ;
if  INCALLS <  0  Then INCALLS =  0 ;
if  PEAKVCE <  0  Then PEAKVCE =  0 ;
if  OPEAKVCE <  0  Then OPEAKVCE =  0 ;
if  DROPBLK <  0  Then DROPBLK =  0 ;
if  CALLFWDV <  0  Then CALLFWDV =  0 ;
if  CALLWAIT <  0  Then CALLWAIT =  0 ;
if  CHURN <  0  Then CHURN =  0 ;
if  MONTHS <  7  Then MONTHS =  7 ;
if  UNIQSUBS <  1  Then UNIQSUBS =  1 ;
if  ACTVSUBS <  1  Then ACTVSUBS =  1 ;
if  PHONES <  1  Then PHONES =  1 ;
if  MODELS <  1  Then MODELS =  1 ;
if  EQPDAYS <  42  Then EQPDAYS =  42 ;
if  CUSTOMER <  1004986  Then CUSTOMER =  1004986 ;
if  AGE1 <  0  Then AGE1 =  0 ;
if  AGE2 <  0  Then AGE2 =  0 ;
if  RETCALLS <  0  Then RETCALLS =  0 ;
if  RETACCPT <  0  Then RETACCPT =  0 ;
if  REFER <  0  Then REFER =  0 ;
if  INCOME <  0  Then INCOME =  0 ;
if  CREDITAD <  0  Then CREDITAD =  0 ;
if  SETPRC <  0  Then SETPRC =  0 ;
RUN;

/* MEAN IMPUTATION */

DATA PAM;
SET PAM;
IF REVENUE=. THEN REVENUE=58.8539614;
IF MOU=. THEN MOU=525.7283924;
IF RECCHRGE=. THEN RECCHRGE=46.8764916;
IF DIRECTAS=. THEN DIRECTAS=0.8948011;
IF OVERAGE=. THEN OVERAGE=40.0953598;
IF ROAM=. THEN ROAM=1.2215262;
IF CHANGEM=. THEN CHANGEM=-10.8464614;
IF CHANGER=. THEN CHANGER=-1.2059256;
IF AGE1=. THEN AGE1=31.37511;
IF AGE2=. THEN AGE2=21.15772;
IF PHONES=. THEN PHONES=4;
IF MODELS=. THEN MODELS=7;
IF EQPDAYS=. THEN EQPDAYS=380;
RUN;

PROC FREQ DATA=PAM;
table churn;
RUN;

/* Dimension reduction via Chi sqr test to eliminate useless catagorical variables */

proc freq data=pam;
tables churn * (CHILDREN
CREDITA
CREDITAA
CREDITB
CREDITC
CREDITDE
CREDITGY
CREDITZ
PRIZMRUR
PRIZMUB
PRIZMTWN
REFURB
WEBCAP
OCCPROF
OCCCLER
OCCCRFT
OCCSTUD
OCCHMKR
OCCRET
OCCSELF
MARRYYES
MARRYNO
MAILORD
MAILRES
MAILFLAG
TRAVEL
PCOWN
NEWCELLY
NEWCELLN
INCMISS)/ chisq nocol nopercent norow;
run;

/* Correlation Matrix */

proc corr data=pam;
var REVENUE
MOU
RECCHRGE
DIRECTAS
OVERAGE
ROAM
CHANGEM
CHANGER
DROPVCE
BLCKVCE
UNANSVCE
CUSTCARE
THREEWAY
MOUREC
OUTCALLS
INCALLS
PEAKVCE
OPEAKVCE
DROPBLK
CALLFWDV
CALLWAIT
MONTHS
UNIQSUBS
ACTVSUBS
PHONES
MODELS
EQPDAYS
RETCALLS
RETACCPT
INCOME
CREDITAD
SETPRCM
SETPRC;
run;
	
/* Variable reduction using stepwise regression */

proc reg data= pam;
model churn = REVENUE
MOU
RECCHRGE
DIRECTAS
OVERAGE
ROAM
CHANGEM
CHANGER
DROPVCE
BLCKVCE
UNANSVCE
CUSTCARE
THREEWAY
MOUREC
OUTCALLS
INCALLS
PEAKVCE
OPEAKVCE
DROPBLK
CALLFWDV
CALLWAIT
MONTHS
UNIQSUBS
ACTVSUBS
PHONES
MODELS
EQPDAYS
CUSTOMER
AGE1
AGE2
CREDITA
CREDITAA
CREDITC
CREDITDE
PRIZMRUR
PRIZMUB
PRIZMTWN
TRUCK
RV
OCCRET
MAILORD
MAILRES
CREDITCD
RETCALLS
RETACCPT
NEWCELLY
REFER
INCOME
MCYCLE
CREDITAD
SETPRCM
SETPRC
RETCALL/ selection= stepwise slentry=0.05 slstay=0.1 VIF STB;
run;

/* Calibration and validation data split */

data dev val;
set pam;
if  CALIBRAT=1 then output dev;
else output val;
run;

data pam;
set pam;
root_mou = sqrt(mou);
root_eqpdays = sqrt(eqpdays);
root_overage = sqrt(overage);
run;

data val;
set val;
root_mou = sqrt(mou);
root_eqpdays = sqrt(eqpdays);
root_overage = sqrt(overage);
run;

data dev;
set dev;
root_mou = sqrt(mou);
root_eqpdays = sqrt(eqpdays);
root_overage = sqrt(overage);
run;

/* Logistic regression */

proc logistic data=dev descending;
model churn =
root_EQPDAYS
RETCALL
CHANGEM
CREDITDE
AGE1
root_OVERAGE
root_MOU
UNIQSUBS
MONTHS
PHONES
CHANGER
DROPVCE
PEAKVCE
SETPRC
ROAM
ACTVSUBS
MAILRES
CREDITC
BLCKVCE
THREEWAY
CUSTOMER
RECCHRGE
INCALLS
PRIZMRUR
REVENUE
CALLWAIT
PRIZMUB
CUSTCARE
CREDITCD
TRUCK
OPEAKVCE/ selection=stepwise slentry=0.05 slstay=0.05 stb lackfit;
output out = tmp p=newpred;
run;

/* Final Iteration */
proc logistic data=dev descending;
model churn =
root_eqpdays
CHANGEM
root_overage
root_mou
AGE1
CREDITDE
SETPRC
MONTHS
UNIQSUBS
PHONES
DROPVCE
ROAM
ACTVSUBS
PEAKVCE
MAILRES
CREDITC
BLCKVCE
THREEWAY
CHANGER
INCALLS
OPEAKVCE
PRIZMUB/ selection=stepwise stb lackfit;
output out = tmp p=newpred;
run;

proc sort data=tmp;
by descending newpred;
run;

proc rank data=tmp groups=10 out=dev;
/*by descending prob;*/
var newpred;
ranks probrank;
run;

proc sql ;
select probrank, count(newpred) as number_of_obs, min(newpred) as min_score,
max(newpred) as max_score,sum(churn) as churners
from dev
group by probrank
order by probrank desc;
quit;

/* Validation deciling */

data val;
set val;
Y= -0.7201 + (root_eqpdays*0.063)
+(CHANGEM*-0.00082)
+(root_overage*0.0506)
+(root_mou*-0.0258)
+(AGE1*-0.00361)
+(CREDITDE*-0.3379)
+(SETPRC*0.0018)
+(MONTHS*-0.018)
+(UNIQSUBS*0.2012)
+(PHONES*0.1354)
+(DROPVCE*0.0165)
+(ROAM*0.0419)
+(ACTVSUBS*-0.1759)
+(PEAKVCE*-0.00099)
+(MAILRES*-0.1124)
+(CREDITC*-0.1404)
+(BLCKVCE*0.0111)
+(THREEWAY*-0.1164)
+(CHANGER*0.00181)
+(INCALLS*-0.00598)
+(OPEAKVCE*0.000911)
+(PRIZMUB*-0.0531)
;
pred= exp(Y)/1+exp(Y);
run;

proc sort data=val;
by descending pred;
run;

proc rank data=val groups=10 out=val1;
/*by descending prob;*/
var pred;
ranks probrank;
run;

proc sql ;
select probrank, count(pred) as number_of_obs, min(pred) as min_score,
max(pred) as max_score,sum(churn) as churners
from val1
group by probrank
order by probrank desc;
quit;

/************************************END*************************************/