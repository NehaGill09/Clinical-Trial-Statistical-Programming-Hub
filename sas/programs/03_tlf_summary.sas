/* Example TLF summary; descriptive only, not a prespecified SAP analysis */
proc sql;
 create table work.hba1c_w24 as
 select a.USUBJID,a.TRT01A,b.AVAL,b.BASE,b.CHG
 from out.adsl a inner join out.adlb b on a.USUBJID=b.USUBJID
 where b.AVISIT='Week 24' and b.PARAMCD='HBA1C';
quit;
proc means data=work.hba1c_w24 n mean std median min max maxdec=2;
 class TRT01A; var CHG;
 title "ABC-301: HbA1c Change from Baseline at Week 24";
run;
title;
