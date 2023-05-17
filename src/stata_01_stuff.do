////////////////////////////////////////////////////////////////////////////////
//
//    1 -- File which does some stuff
//
//    Maximilian Sprengholz / maximilian.sprengholz@hu-berlin.de
//
////////////////////////////////////////////////////////////////////////////////

// settings
set seed 1234
set sortseed 1234

// data
import delimited "${data}/raw/mtcars.csv", clear
rename v1 make

// make plot
hist mpg, scheme(s1mono) freq
graph export "${fig}/stata_hist_mpg.pdf", replace

// make latex table
estpost sum mpg hp cyl
esttab using "${tab}/stata_sumstats.tex" ///
    , cells("count mean sd min max") tex replace ///
    noobs nomtitles nonumbers
