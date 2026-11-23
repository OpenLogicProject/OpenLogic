.PHONY: FORCE_MAKE

all: ic-screen.pdf ic-print.pdf ic-print-cover.pdf

print: ic-print.pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -dvi- -ps- -pdf $<

index.html: README.md  webpage-template.html ic-screen.pdf
	convert ic-screen.pdf[0] ic.png
	pandoc --template webpage-template.html -f markdown -t html -o index.html README.md

clean:
	latexmk -c ic-screen.tex ic-print.tex ic-print-cover.tex

