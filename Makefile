.PHONY : FORCE_MAKE

ALLDIRS = first-order-logic computability sets-functions-relations 

ALLTEXFILES = open-logic-debug.tex open-logic-complete.tex \
	examples/*.tex \
	$(shell grep 'INPUT [^/].*/.*\.tex' open-logic-debug.fls | uniq | sed 's/INPUT //g' )

ALLPDFFILES = $(ALLTEXFILES:.tex=.pdf)

all: $(ALLPDFFILES) open-logic-config.pdf

open-logic-config.pdf: open-logic-config.sty
	grep -e "^%" -e "^$$" open-logic-config.sty | cut --bytes=3-|pandoc -f markdown -M date="`git log --format=format:"%ad %h" --date=short -1 open-logic-config.sty`" -o open-logic-config.pdf

%.pdf : %.tex FORCE_MAKE
	latexmk -pdf -dvi- -ps- -cd $<

clean:	
	latexmk -c $(ALLTEXFILES)

upload: all FORCE_MAKE
	rsync -avz --delete --include "[^\.]*/" --include '*.pdf' --exclude '*'  . rzach@c1.ucalgary.ca:webdisk/public_html/static/open-logic/

