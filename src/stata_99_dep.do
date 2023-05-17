/*
 This file installs dependencies in wd/src/external which will be loaded from there upon
 execution of master.do

 Credit: https://github.com/reifjulian/my-project/blob/master/analysis/scripts/_install_stata_packages.do

 Note: 
 There is the possibility that re-running this file with a list of all programs 
 AT THE END OF A PROJECT breaks compatibility due to 'replace force'. 
 Only install packages consecutivel
*/

net set ado "/home/max/Seafile/Projects/repro-collab/src/external"
net set other "/home/max/Seafile/Projects/repro-collab/src/external"

// Install packages from SSC
foreach p in estout {
	local ltr = substr(`"`p'"', 1, 1)
	qui net from "http://fmwww.bc.edu/repec/bocode/`ltr'"
	net install `p' // , replace force // only use if sure you want to replace the local versions
}