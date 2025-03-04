data/clean/titanic_clean.csv: 01-load_clean.R data/original/titanic.csv
	Rscript 01-load_clean.R --file_path=data/original/titanic.csv --output_path=data/clean/titanic_clean.csv

output/model.RDS: 03-model.R data/clean/titanic_clean.csv
	Rscript 03-model.R --file_path=data/clean/titanic_clean.csv --output_path=output/model.RDS

output/coef.csv output/fig.png: 04-analyze.R output/model.RDS
	Rscript 04-analyze.R --model=output/model.RDS --output_coef=output/coef.csv --output_fig=output/fig.png

index.html: report.qmd output/coef.csv output/fig.png
	quarto render report.qmd --output index.html

clean:
	rm -f output/*
	rm -f data/clean/*
	rm -f index.html
	rm -f *.pdf
