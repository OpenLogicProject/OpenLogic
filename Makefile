# Open Logic Project
# Makefile

# YOU DO NOT HAVE TO USE THIS MAKEFILE
# Just run pdflatex on whichever tex file you want to compile
# The job of this makefile is to compile *everything*
 
# Requires latexmk https://www.ctan.org/pkg/latexmk/
# The PDF of the open-logic-config documentation also requires
# pandoc http://pandoc.org/

.PHONY : FORCE_MAKE

ALLTEXFILES = open-logic-debug.tex open-logic-complete.tex \
	examples/*.tex \
	$(shell grep 'INPUT [^/].*/.*\.tex' open-logic-debug.fls | uniq | sed 's/INPUT //g' )

ALLPDFFILES = $(ALLTEXFILES:.tex=.pdf)

all: open-logic-debug.pdf open-logic-complete.pdf

everything: $(ALLPDFFILES) open-logic-config.pdf

open-logic-config.pdf: open-logic-config.sty
	grep -e "^%" -e "^$$" open-logic-config.sty | cut --bytes=3-|pandoc -f markdown -M date="`git log --format=format:"%ad %h" --date=short -1 open-logic-config.sty`" -o open-logic-config.pdf

%.pdf : %.tex FORCE_MAKE
	latexmk -pdf -dvi- -ps- -cd $<

clean:	
	latexmk -c $(ALLTEXFILES)

upload: everything FORCE_MAKE
	rsync -avz --delete --include "[^\.]*/" --include '*.pdf' --exclude '*'  . rzach@c1.ucalgary.ca:webdisk/public_html/static/open-logic/

