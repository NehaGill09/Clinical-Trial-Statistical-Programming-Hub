# Repository guide
- data/raw: synthetic source CSV files.
- sas/macros and sas/programs: reusable SAS macro, dataset and TLF examples.
- r: R analysis, output generation and QC pipeline.
- cdisc: SDTM/ADaM mapping and traceability examples.
- validation: validation plan and example issue log.
- documentation: study plan, programming specifications and submission artifact descriptions.
- dashboard: static study-lead dashboard.
- screenshots: SVG portfolio preview images.

Run R from the repository root with Rscript r/run_pipeline.R after installing readr, dplyr and ggplot2. Open dashboard/index.html in a browser. Edit the SAS project_root before execution in SAS 9.4+.
