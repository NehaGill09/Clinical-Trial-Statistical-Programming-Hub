/* Basic programmed QC checks; not a substitute for formal validation */
%assert_nobs(data=out.adsl,min=20);
%assert_nobs(data=out.adlb,min=40);
proc sql;
 title "QC: duplicate subject identifiers";
 select USUBJID,count(*) as N from out.adsl group by USUBJID having calculated N>1;
 title "QC: missing treatment";
 select count(*) as N_MISSING from out.adsl where missing(TRT01A);
quit;
title;
