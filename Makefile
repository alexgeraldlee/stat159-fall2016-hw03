
reports = report/report.Rmd 

all: data/Advertising.csv

data/Advertising.csv:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

report/report.pdf: $(reports)
	cd report && Rscript -e "require(knitr); require(rmarkdown); render('report.Rmd', 'pdf_document')

