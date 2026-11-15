/* Edit project_root before running in SAS 9.4+ */
%let project_root=C:\clinical-trial-programming-hub;
%let raw=&project_root.\data\raw;
%let out=&project_root.\outputs;
options validvarname=upcase mprint;
libname out "&out";
%include "&project_root.\sas\macros\qc_macros.sas";
%include "&project_root.\sas\programs\01_build_adsl.sas";
%include "&project_root.\sas\programs\02_build_adlb.sas";
