#!/bin/zsh
#

for f in *.tex
do
 	pdflatex --shell-escape $f
	rm ${f%%.tex}.aux
	rm ${f%%.tex}.log
	rm ${f%%.tex}.pdf
	mv ${f%%.tex}.png output/
done

