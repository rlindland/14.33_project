
// Main
// Reg 1: main table
//clear
//import delimited "/Users/robert/Downloads/cdtest/data_f_candtime.csv", encoding(ISO-8859-1)clear
eststo clear
eststo: eventdd pct_change in* hweek* if stile_1!=1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* cost airings if stile_1!=1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if stile_1!=1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
esttab using ~/Downloads/cdtest/main_fin.tex, se nostar

// Reg 2: Robustness for above/below median approval
eststo clear
eststo: eventdd pct_change in* hweek* candtime* cost airings if stile_1==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if stile_2==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if stile_3==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if stile_4==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if stile_5==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if stile_6==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
esttab using ~/Downloads/cdtest/med_poll_fin.tex, se nostar

// Reg 3: Robustness for above/below spending 
eststo clear
eststo: eventdd pct_change in* hweek* candtime* if stile_1!=1 & cand!="tom-steyer" & med_cost==1, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* if stile_1!=1 & cand!="tom-steyer" & med_cost==0, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
esttab using ~/Downloads/cdtest/med_cost_fin.tex, se nostar

// Reg 4: Robustness for above/below airings
eststo clear
eststo: eventdd pct_change in* hweek* candtime* if stile_1!=1 & cand!="tom-steyer" & med_airings==1, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* if stile_1!=1 & cand!="tom-steyer" & med_airings==0, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
esttab using ~/Downloads/cdtest/med_airings_fin.tex, se nostar

// Reg 5: Robustness for 2016 dem/rep/close states 
eststo clear
eststo: eventdd pct_change in* hweek* candtime* cost airings if color=="r" & stile_1!=1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if color=="b" & stile_1!=1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
eststo: eventdd pct_change in* hweek* candtime* cost airings if color=="p" & stile_1!=1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange
esttab using ~/Downloads/cdtest/color_fin.tex, se nostar


// Issues
// Reg 6: Issue Effects
clear
import delimited "/Users/robert/Downloads/cdtest/data_f_iss.csv", encoding(ISO-8859-1)clear
eststo clear
eststo: eventdd pct_change in* week* topic*, timevar(grouped_10) ci(rcap) lags(1) leads(3) inrange
esttab using ~/Downloads/cdtest/issues.tex, se

clear
import delimited "/Users/robert/Downloads/cdtest/data_f_iss2.csv", encoding(ISO-8859-1)clear
eststo clear
eststo: eventdd pct_change in* week* topic*, timevar(grouped_5) ci(rcap) lags(1) leads(5) inrange


