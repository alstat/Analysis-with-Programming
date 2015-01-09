/* Imports the data */
proc import datafile = "/folders/myfolders/palay.csv"
  out = work.palay dbms = csv;
  getnames = yes;
  datarow = 2;
run;

/* Prints the data */
proc print data = palay;
run;

/* Computes Descriptive statistics */
proc means data = palay
  min mean median mode cv std var kurt skew max;
run;

/* Histogram of Abra */
proc sgplot data = palay;
  histogram abra;
run;

proc sgplot data = palay;
  scatter x = kalinga y = benguet;
run;
proc corr data = palay plots = matrix(histogram);
run;
proc ttest data = palay alpha = 0.05;
run;
proc contents data = palay;
run;
