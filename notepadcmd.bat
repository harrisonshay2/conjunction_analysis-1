@echo off
"C:\Program Files\R\R-4.0.0\bin\Rscript.exe" "C:\Users\Harri\OneDrive\Documents\conjunction_analysis-1\daily_update1.R" 
"C:\Program Files\R\R-4.0.0\bin\Rscript.exe" -e "library('knitr'); knitr('C:\Users\Harri\OneDrive\Documents\conjunction_analysis-1\index.Rmd')"
"C:\Program Files\RStudio\bin\pandoc" -e "rmarkdown::render('index.md')"
move index.html "C:\Users\Harri\OneDrive\Documents\conjunction_analysis-1\docs" 
"C:\Program Files\Git\bin\bash.exe" "C:\Users\Harri\OneDrive\Documents\conjunction_analysis-1\git_update.git"



