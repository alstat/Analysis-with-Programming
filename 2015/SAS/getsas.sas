/* Importing the data */
proc import datafile = "/folders/myfolders/palay.csv"
  out = work.palay dbms = csv;
  getnames = yes;
  datarow = 2;

/* Information about the Palay data set */
proc contents data = palay;

/* Prints the data */
proc print data = palay;

/* Descriptive statistics */
proc means data = palay
  min mean median mode cv std var kurt skew max;

/* Graphics */
/* Histogram of Abra */
proc sgplot data = palay;
  histogram abra;

/* Scatter Plot of Abra */
proc sgplot data = palay;
  scatter x = kalinga y = benguet;

/* Generates New Data Years */
data years;
  do i = 1 to 79;
    output;
  end;

/* Prints Years */
proc print data = years;

/* Concatenate both data set */
data palay;
  set palay; 
  set years;

/* Series plot */
proc sgplot data = palay;
  series x = i y = abra;
  series x = i y = apayao;
  series x = i y = benguet;
  series x = i y = ifugao;
  series x = i y = kalinga;

/* Prints the new palay data */
proc print data = palay;

/* Correlations of Variables in Palay data set */
proc corr data = palay plots = matrix(histogram);

/* Subsetting the data */
data abra;
  set palay;
  keep palay;

/* t-test on data */
proc ttest data = abra
  alpha = 0.05;
run;

proc fcmp outlib = work.func.stdnorm;
  function stdnorm(t);
    fx = 1 / sqrt(constant('PI')) * constant('E') ** (-(t ** 2) / 2);
    return(fx);
  endsub;
quit;

options cmplib = work.func;

data sn_data;
  do i = -5 to 5 by 0.1;
    y = stdnorm(i);
    output;
  end;
run;

proc sgplot data = palay;
  title1 "Histogram of Benguet";
  title2 "by Al-Ahmadgaid Asaad";
  xaxis minor grid offsetmin = 0.05 offsetmax = 0.05;
  yaxis minor grid;
  histogram benguet / nbins = 10
  fill fillattrs = (color = "#FF6961") outline
  transparency = 0.2;
  density benguet / type = normal;
  density benguet / type = kernel lineattrs = (color = "purple");
  keylegend / location = inside position = topright across = 1;
run;

proc sgplot data = sn_data;
  title1 "Sample Scatter Plot in SAS";
  title2 "by Al-Ahmadgaid Asaad";
  xaxis label = "x-axis" grid minor;
  yaxis label = "y-axis" grid minor;
  scatter x = i y = y / markerattrs = (size = 20 symbol = "circlefilled")
  filledoutlinedmarkers markerfillattrs = (color = "red")
  markeroutlineattrs = (color = "purple" thickness = 1)
  transparency = 0.7 dataskin = matte;
run;

/*--HBar Plot--*/

data _null_;
	x=dcreate("ODSEditorFiles","/folders/myfolders/");
run;

ods listing gpath="/folders/myfolders/ODSEditorFiles";

title 'Mileage by Type';
proc sgplot data=sashelp.cars ;
  hbar type / response=mpg_city  stat=mean  limits=both;
  yaxis display=(nolabel) grid;
  xaxis display=(nolabel);
  run;
/*--HighLow Plot--*/
data _null_;
	x=dcreate("ODSEditorFiles","/folders/myfolders/");
run;

ods listing gpath="/folders/myfolders/ODSEditorFiles";

title 'Monthly Stock Price for IBM';
proc sgplot data=sashelp.stocks(where=(stock eq 'IBM' and date > '01Jan2003'd));
  highlow x=date high=high low=low / open=open close=close
      lineattrs=(thickness=2) y2axis;
  xaxis display=(nolabel);
  y2axis display=(nolabel) grid;
  run;
/*--Histogram--*/
data _null_;
	x=dcreate("ODSEditorFiles","/folders/myfolders/");
run;

ods listing gpath="/folders/myfolders/ODSEditorFiles";

title 'Distribution of Mileage';
proc sgplot data=sashelp.cars(where=(type ne 'Hybrid'));
  histogram mpg_city;
  density mpg_city / lineattrs=(pattern=solid);
  density mpg_city / type=kernel lineattrs=(pattern=solid);
  keylegend / location=inside position=topright across=1;
  yaxis offsetmin=0 grid;
run;

