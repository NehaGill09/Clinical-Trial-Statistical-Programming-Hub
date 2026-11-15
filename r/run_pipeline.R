# Run from repository root: Rscript r/run_pipeline.R
pkgs <- c("readr","dplyr","ggplot2")
missing <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly=TRUE)]
if(length(missing)) stop("Install: ",paste(missing,collapse=", "))
library(readr); library(dplyr); library(ggplot2)
dir.create("outputs/tables",recursive=TRUE,showWarnings=FALSE)
dir.create("outputs/figures",recursive=TRUE,showWarnings=FALSE)
dm <- read_csv("data/raw/dm.csv",show_col_types=FALSE)
lb <- read_csv("data/raw/lb.csv",show_col_types=FALSE)
ae <- read_csv("data/raw/ae.csv",show_col_types=FALSE)
stopifnot(!anyDuplicated(dm$USUBJID))
stopifnot(all(dm$ARM %in% c("Investigational Drug","Placebo")))
adsl <- dm %>% transmute(STUDYID="ABC-301",USUBJID,SUBJID,SITEID,AGE,SEX,RACE,TRT01A=ARM,ITTFL="Y",SAFFL="Y")
adlb <- lb %>% mutate(AVAL=as.numeric(LBORRES)) %>% group_by(USUBJID) %>%
 mutate(BASE=AVAL[AVISIT=="BASELINE"][1],CHG=AVAL-BASE) %>% ungroup() %>%
 transmute(STUDYID="ABC-301",USUBJID,PARAMCD=LBTESTCD,PARAM=LBTEST,AVISIT,AVISITN,AVAL,BASE,CHG)
w24 <- adlb %>% filter(AVISIT=="Week 24",PARAMCD=="HBA1C") %>% inner_join(adsl %>% select(USUBJID,TRT01A),by="USUBJID")
tab <- w24 %>% group_by(TRT01A) %>% summarise(N=n(),MEAN=mean(CHG),SD=sd(CHG),.groups="drop")
ae_tab <- ae %>% count(AEBODSYS,AEDECOD,AESEV,name="EVENTS")
qc <- data.frame(check=c("Unique USUBJID","Valid treatment","ADLB subject linkage"),
 status=c(ifelse(!anyDuplicated(dm$USUBJID),"PASS","FAIL"),
 ifelse(all(dm$ARM %in% c("Investigational Drug","Placebo")),"PASS","FAIL"),
 ifelse(all(adlb$USUBJID %in% dm$USUBJID),"PASS","FAIL")))
write_csv(adsl,"outputs/tables/adsl_example.csv"); write_csv(adlb,"outputs/tables/adlb_example.csv")
write_csv(tab,"outputs/tables/tlf_hba1c_week24.csv"); write_csv(ae_tab,"outputs/tables/tlf_ae_summary.csv")
write_csv(qc,"outputs/tables/qc_summary.csv")
p <- ggplot(w24,aes(TRT01A,CHG,fill=TRT01A))+geom_boxplot()+geom_jitter(width=.12)+
 labs(title="ABC-301: HbA1c change at Week 24",x="Treatment",y="Change from baseline (%)")+theme_minimal()
ggsave("outputs/figures/fig_hba1c_week24.png",p,width=8,height=5,dpi=150)
print(tab); print(qc)
