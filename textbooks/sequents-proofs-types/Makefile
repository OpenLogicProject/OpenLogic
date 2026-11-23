.PHONY: FORCE_MAKE

all: spt-screen.pdf spt-print.pdf spt-print-cover.pdf

print: spt-print.pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -dvi- -ps- -pdf $<

index.html: README.md webpage-template.html spt-screen.pdf
	convert spt-screen.pdf[0] sp.png
	pandoc --template webpage-template.html -f markdown -t html -o index.html README.md
