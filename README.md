# Reproducibility and Collaboration

_Version 0.1.0_

Some tips to enhance reproducibility and facilitate collaboration in social science research projects.


## Project organization

```
.
├── .gitignore
├── environment.yml
├── LICENSE.md
├── Makefile
├── README.md
├── data               <- All project data, ignored by git
│   ├── processed      <- Final data sets for modeling. (PG)
│   ├── raw            <- The original, immutable data dump (RO)
│   └── temp           <- Intermediate, transformed data (PG)
├── docs               <- Documentation
│   ├── manuscript     <- Manuscript source (HW)
│   └── presentations  <- Presentation source (HW)
├── results
│   ├── figures        <- Figures for the manuscript or reports (PG)
│   └── tables         <- Tables (PG)
└── src                <- Source code (HW)
    └── external       <- External source code used (RO)

```
*RO* = read-only, *HW* = human-writeable, *PG* = project-generated. Repository organization implemented with [cookiecutter](https://github.com/cookiecutter/cookiecutter) using an adapted version of the [good-enough-project template](https://github.com/bvreede/good-enough-project) by Barbara Vreede. The fork is available [here](https://github.com/maximilian-sprengholz/good-enough-project).

## Usage

To replicate the analysis and docs, you need to have [conda](https://docs.conda.io/en/latest/miniconda.html) installed and `conda` available via shell:

```bash
# create and activate conda environment (initialized as subdirectory ./env)
cd /path/to/repro-collab
conda env create --prefix ./env --file environment.yml
conda activate ./env
# run (Stata needs to be available via shell)
make all stata="NameOfStataExecutable"
# in case you have no Stata, you can still do
make analysis_r
make rmarkdown
make docs
```

## License

This project is licensed under the terms of the [MIT License](/LICENSE.md)

## Citation

Please cite this project as:

Maximilian Sprengholz (2023). Reproducibility and Collaboration, version 0.1.0. Url: https://scm.cms.hu-berlin.de/sprenmax/repro-collab