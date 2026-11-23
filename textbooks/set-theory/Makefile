.PHONY: FORCE_MAKE

all: settheory-screen.pdf settheory-print.pdf settheory-print-cover.pdf

print: settheory-print.pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -dvi- -ps- -pdf $<

index.html: README.md webpage-template.html settheory-screen.pdf
	convert settheory-screen.pdf[0] settheory.png
	pandoc --template webpage-template.html -f markdown -t html -o index.html README.md
