proc import datafile="&raw.\dm.csv" out=work.dm dbms=csv replace; guessingrows=max; run;
data out.adsl;
 set work.dm;
 length STUDYID $8 TRT01A $30;
 STUDYID='ABC-301'; TRT01A=ARM; ITTFL='Y'; SAFFL='Y';
 keep STUDYID USUBJID SUBJID SITEID AGE SEX RACE COUNTRY TRT01A ITTFL SAFFL;
run;
%assert_nobs(data=out.adsl,min=20);
