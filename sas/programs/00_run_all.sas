/* Edit project_root before running in SAS 9.4+ */
%let project_root=C:\clinical-trial-programming-hub;
%let raw=&project_root.\data\raw;
%let outpath=&project_root.\outputs;
options validvarname=upcase mprint;
libname out "&outpath";
%include "&project_root.\sas\macros\qc_macros.sas";
%include "&project_root.\sas\programs\01_build_adsl.sas";
%include "&project_root.\sas\programs\02_build_adlb.sas";
%include "&project_root.\sas\programs\03_tlf_summary.sas";
%include "&project_root.\sas\programs\04_qc_checks.sas";
