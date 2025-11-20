report.html: FinalProject_R_ZixuanHao.Rmd code/render_report.R table_figure
	Rscript code/render_report.R

table_figure:
	Rscript code/code_analysis.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
	
install:
	Rscript -e "renv::restore()"
	

