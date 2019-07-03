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
	$(shell grep 'INPUT content/.*/.*\.tex' open-logic-debug.fls | uniq | sed 's/INPUT //g' )

ALLPDFFILES = $(ALLTEXFILES:.tex=.pdf)

all: open-logic-debug.pdf open-logic-complete.pdf

content/open-logic.pdf:

everything: $(ALLPDFFILES) open-logic-config.pdf index.html

courses: FORCE_MAKE
	for course in courses/* ; do \
		make -C $$course ;\
	done

branches: FORCE_MAKE
	git checkout master
	for branch in `git branch --list --no-column |grep -v master` ; do \
		git checkout $$branch ;\
		latexmk -pdf -dvi- -ps- open-logic-debug ;\
		latexmk -pdf -dvi- -ps- open-logic-complete ;\
		mkdir -p branches/$$branch ;\
		cp open-logic-debug.pdf open-logic-complete.pdf branches/$$branch ;\
	done 
	git checkout master
	latexmk -pdf -dvi- -ps- open-logic-debug
	latexmk -pdf -dvi- -ps- open-logic-complete

open-logic-config.pdf: open-logic-config.sty
	grep -e "^%" -e "^$$" open-logic-config.sty | cut --bytes=3-|pandoc -f markdown -M date="`git log --format=format:"%ad %h" --date=short -1 open-logic-config.sty`" -o open-logic-config.pdf

%.pdf : %.tex FORCE_MAKE
	latexmk -pdf -dvi- -ps- -cd $<

clean:	
	latexmk -c $(ALLTEXFILES)

clean-all:
	latexmk -C $(ALLTEXFILES)

index.html: FORCE_MAKE
	git checkout master
	cp misc/index.start.html index.html
	for branch in `git branch --list --no-column |grep -v master` ; do \
		echo "<li>$$branch: <a href=\"branches/$$branch/open-logic-debug.pdf\">debug</a> | <a href=\"branches/$$branch/open-logic-complete.pdf\">complete</a></li>" >> index.html ;\
	done 
	echo "</ol>" >> index.html
	echo "<h2>Parts, Chapters, Sections</h2>" >> index.html
	misc/htmltoc content content | sed "1d" >> index.html
	echo "<p>Generated from Git revision <code>" >> index.html
	grep shash .git/gitHeadInfo.gin |sed 's/[^{]*{\([^}]*\)},/\1/' >>index.html
	grep authsdate .git/gitHeadInfo.gin |sed 's/[^{]*{\([^}]*\)},/(\1)/' >> index.html
	echo "</code></p></div></div></div></body></html>" >> index.html
