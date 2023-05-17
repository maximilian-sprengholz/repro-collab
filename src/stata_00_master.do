////////////////////////////////////////////////////////////////////////////////
//
//    0 -- Example Master File
//
//    Maximilian Sprengholz / maximilian.sprengholz@hu-berlin.de
//
////////////////////////////////////////////////////////////////////////////////

//
// Settings
//

clear all
set seed 1234
set more off
set matsize 11000
set emptycells drop
set linesize 155
version 17 // so people know the version you worked with; but: will break for lower versions

// Project directories (trial and error approach for different users)
local wd_edith "C:/Users/edith/repro-collab"
local someotherdir_edith "C:/some/other/dir"
local wd_max "/home/max/Seafile/Projects/repro-collab"
local someotherdir_max "/home/someotherdir"

foreach user in edith max {
	cap cd "`wd_`user''"
	if (_rc==0) {
		global wd "`wd_`user''"
        global someotherdir "`someotherdir_`user''"
		global user "`user'"
		break
	}
}

// subdirectories for convenience
global src "${wd}/src"
global data "${wd}/data"
global fig "${wd}/results/figures"
global tab "${wd}/results/tables"


//
// Dependencies (credit: https://julianreif.com/guide/)
//

// program specific ado dir
tokenize `"$S_ADO"', parse(";")
while `"`1'"' != "" {
  if `"`1'"' != "BASE" cap adopath - `"`1'"'
  macro shift
}
adopath ++ "${src}/external"

// set PLUS and PERSONAL to the same dir
sysdir set PLUS "${src}/external"
sysdir set PERSONAL "${src}/external"

// reindex mata libraries (necessary for some packages such as parallel)
mata: mata mlib index

//
// Run
//

do "${src}/stata_01_stuff.do" // do stuff

exit, clear STATA