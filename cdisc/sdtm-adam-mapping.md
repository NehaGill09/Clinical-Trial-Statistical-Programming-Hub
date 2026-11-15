# CDISC mapping overview — ABC-301
Illustrative mapping only; confirm standards versions, controlled terminology and sponsor conventions before use.

| Source | Domain/dataset | Example variables |
|---|---|---|
| Raw demographics | SDTM DM | USUBJID, SUBJID, SITEID, AGE, SEX, RACE, ARM |
| Raw adverse events | SDTM AE | USUBJID, AESEQ, AEDECOD, AEBODSYS, AESEV, AESER |
| Raw laboratory | SDTM LB | USUBJID, LBTESTCD, LBTEST, LBORRES, LBORRESU, LBDTC |
| Subject analysis | ADaM ADSL | USUBJID, TRT01A, AGE, SEX, ITTFL, SAFFL |
| Lab analysis | ADaM ADLB | USUBJID, PARAMCD, PARAM, AVAL, BASE, CHG, AVISIT |

ADSL is intended as one record per subject. ADLB is intended as one record per subject, parameter and analysis visit. CHG = AVAL - BASE. This is a learning example, not a complete standards implementation.
