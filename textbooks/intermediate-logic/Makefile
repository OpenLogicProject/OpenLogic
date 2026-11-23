.PHONY: FORCE_MAKE

all: il-screen.pdf il-print.pdf il-print-cover.pdf

print: il-print.pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -dvi- -ps- -pdf $<

index.html: README.md  webpage-template.html il-screen.pdf
	convert il-screen.pdf[0] il.png
	pandoc --template webpage-template.html -f markdown -t html -o index.html README.md

clean:
	latexmk -c il-screen.tex il-print.tex il-print-cover.tex


