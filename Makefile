.PHONY: analysis_stata analysis_r docs

analysis_stata: 
	@ ${stata} do "src/stata_00_master.do" || echo "Stata not found. Make sure it is in PATH and you call 'make analysis stata=StataExecutable'"

analysis_r: 
	Rscript "src/r_00_master.R"

rmarkdown:
	Rscript -e "rmarkdown::render('src/r_markdown.rmd', 'all')"
	mv src/r_markdown.pdf docs/manuscript/r_markdown.pdf
	mv src/r_markdown.html docs/manuscript/r_markdown.html

docs: 
	tectonic -X compile docs/manuscript/manuscript.tex

all: analysis_stata analysis_r rmarkdown docs