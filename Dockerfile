# Use ubuntu trusty as the base image
FROM ubuntu:trusty

# Add a backport of TeX Live 2016 packages, for LTS releases, to the apt sources
RUN echo -e '\ndeb http://ppa.launchpad.net/jonathonf/texlive-2016/ubuntu trusty main\ndeb-src http://ppa.launchpad.net/jonathonf/texlive-2016/ubuntu trusty main' /etc/apt/sources.list

# Install dependencies for building the open-logic-debug.pdf file
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-base \
    texlive-fonts-recommended \
    texlive-generic-extra \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-math-extra \
    latexmk \

    # Additionally install these to packages to fix a bug saying tikz.sty is missing
    texlive-pictures \
    pgf 
    
# Set the working directory to wd and copy the git repository into it
WORKDIR /wd
VOLUME ["/wd"]
COPY . .

# This is used to fix a bug saying gitinfo2.sty cannot be found
ADD http://www.pirbot.com/mirrors/ctan/macros/latex/contrib/gitinfo2/gitinfo2.sty gitinfo2.sty

# Try generating open-logic-debug.pdf
CMD ["latexmk", "-dvi-", "-pdf", "-pdflatex=pdflatex -interaction nonstopmode -halt-on-error", "open-logic-debug.tex"]
