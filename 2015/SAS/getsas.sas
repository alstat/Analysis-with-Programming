* Imports the data;
proc import datafile = "/folders/myfolders/palay.csv"
  out = work.palay dbms = csv;
  getnames = yes;
  datarow = 2;
run;
