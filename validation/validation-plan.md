# Validation and QC plan
Scope: educational checks for synthetic ABC-301 data. Not formal computer system validation or regulated independent validation.

1. Input checks: file presence, expected columns, row counts, types and duplicate keys.
2. SDTM review: identifiers, domain keys, date formats and controlled terminology.
3. ADaM review: subject linkage, treatment consistency, baseline and change derivations.
4. TLF review: denominators, treatment groups, missing data and numeric summaries.
5. Independent QC: reconcile selected SAS outputs with separately programmed R outputs when SAS is available.

Acceptance criteria: unique ADSL subject IDs; all analysis IDs map to source subjects; treatment values are valid; baseline and Week 24 records are identifiable; CHG equals AVAL minus BASE.

Pinnacle 21: no actual Pinnacle 21 execution is claimed. Run with a supported installation and standards-compliant package; record software and standards versions, findings, severity, disposition and reviewer.
