# Programming specifications — ABC-301

## ADSL
- Grain: one record per subject.
- Key: STUDYID + USUBJID.
- TRT01A: actual treatment assignment from source ARM.
- ITTFL and SAFFL: illustrative flags; real derivations must follow protocol and SAP definitions.

## ADLB
- Grain: one record per subject, parameter and analysis visit.
- AVAL: numeric conversion of LBORRES.
- BASE: sample baseline record; production derivation should follow protocol/SAP baseline window.
- CHG: AVAL minus BASE.
- PARAMCD: test code; PARAM: test label.

## Example TLF 14.2.1
Summarize Week 24 HbA1c change by treatment: N, mean and SD. A real SAP must define estimand, population, missing-data handling, model/covariates, intercurrent events and multiplicity.

Each program requires specification review, peer code review, independent QC, output review and documented approval before release.
