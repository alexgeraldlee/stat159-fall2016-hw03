# Multiple Regression Analysis of Advertising Data

## Author: Alexander Lee

Email: alexgeraldlee@berkeley.edu

## About the Project

This project seeks to perform a multiple linear regression on the `Advertising.csv` dataset. I also create R scripts that calculate various
statistics about the data (such as the RSE and the F-statistic), and use the R package "testthat" to ensure they work as intended.

The data, images, and summary statistics can all be generated via running the Makefile. The report was also compiled using the Makefile, but contains
a standard multiple linear regression analysis of the `Advertising.csv` dataset.

## File Structure

```
stat159-fall2016-hw03/
	.gitignore
	README.md
	LICENSE
	Makefile
	session-info.txt
	code/
		README.md
		test-that.R
		functions/
			regression-functions.R
		scripts/
			eda-script.R
			regression-script.R
			session-info-script.R
		tests/
			test-regression.R
	data/
		README.md
		Advertising.csv
		eda-output.txt
		correlation-matrix.RData
		regression.RData
	images/
		histogram-sales.png
		histogram-tv.png
		histogram-radio.png
		histogram-newspaper.png
		scatterplot-matrix.png
		scatterplot-tv-sales.png
		scatterplot-radio-sales.png
		scatterplot-newspaper-sales.png
		residual-plot.png
		scale-location-plot.png
		normal-qq-plot.png
	report/
		report.Rmd
		report.pdf
```

## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.