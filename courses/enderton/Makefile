# sample course based on OLP
# Makefile

# YOU DO NOT HAVE TO USE THIS MAKEFILE
# Just run pdflatex on whichever tex file you want to compile
# The job of this makefile is to compile *everything*
 
# Requires latexmk https://www.ctan.org/pkg/latexmk/
# The PDF of the open-logic-config documentation also requires
# pandoc http://pandoc.org/

.PHONY : FORCE_MAKE

all: open-logic-enderton.pdf

%.pdf : %.tex FORCE_MAKE
	latexmk -pdf -dvi- -ps- -interaction=nonstopmode $<

clean:	
	latexmk -c open-logic-enderton.tex
