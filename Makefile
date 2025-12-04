report.html: FinalProject_R_ZixuanHao.Rmd code/render_report.R output/table1.rds output/figure1.rds
	Rscript code/render_report.R

output/table1.rds output/figure1.rds: code/code_analysis.R data/brfss_obesity.csv
	Rscript code/code_analysis.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
	
install:
	Rscript -e "renv::restore()"
	
docker-report:
	mkdir -p report
	docker run --rm \
	  -v "$$(pwd)/report:/home/rstudio/project/report" \
	  dianahao007/final_project_data550:latest

docker-report-win:
	mkdir -p report
	docker run --rm \
	  -v "/$$(pwd)/report:/home/rstudio/project/report" \
	  dianahao007/final_project_data550:latest

