.PHONY: FORCE_MAKE

all: wi-screen.pdf wi-print.pdf wi-print-cover.pdf

print: wi-print.pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -dvi- -ps- -pdf $<

index.html: README.md webpage-template.html wi-screen.pdf
	convert wi-screen.pdf[0] wi.png
	pandoc --template webpage-template.html -f markdown -t html -o index.html README.md

