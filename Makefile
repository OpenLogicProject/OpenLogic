.PHONY : FORCE_MAKE

ALLDIRS = first-order-logic computability sets-functions-relations 

ALLTEXFILES = open-logic-dev.tex open-logic-rel.tex \
	$(shell grep 'INPUT [^/].*\.tex' open-logic-dev.fls | uniq | sed 's/INPUT //g' )

ALLPDFFILES = $(ALLTEXFILES:.tex=.pdf)

all: $(ALLPDFFILES)

%.pdf : %.tex FORCE_MAKE
	latexmk -pdf -dvi- -ps- -cd $<

clean:	
	latexmk -c $(ALLTEXFILES)

upload: all FORCE_MAKE
	rsync -avz --delete --include "[^\.]*/" --include '*.pdf' --exclude '*'  . rzach@c1.ucalgary.ca:webdisk/public_html/static/open-logic/

