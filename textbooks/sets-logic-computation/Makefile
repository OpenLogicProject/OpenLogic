# Sets, Logic, Computation text based on OLP
# Makefile

# YOU DO NOT HAVE TO USE THIS MAKEFILE
# Just run pdflatex on whichever tex file you want to compile
# The job of this makefile is to compile *everything*
 
# Requires latexmk https://www.ctan.org/pkg/latexmk/
# The PDF of the open-logic-config documentation also requires
# pandoc http://pandoc.org/

.PHONY : FORCE_MAKE

all: slc-screen.pdf slc-print.pdf slc-print-cover.pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -pdf -dvi- -ps- $<

index.html: README.md  webpage-template.html slc-screen.pdf
	convert slc-screen.pdf[0] slc.png
	pandoc --template webpage-template.html -f markdown -t html -o index.html README.md

clean:
	latexmk -c slc-screen.tex slc-print.tex slc-print-cover.tex
