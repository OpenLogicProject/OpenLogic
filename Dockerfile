# Use ubuntu bionic as the base image
FROM ubuntu:bionic

# Add a backport of TeX Live 2019 packages, for LTS releases, to the apt sources
RUN echo -e '\ndeb http://ppa.launchpad.net/jonathonf/texlive-2019/ubuntu bionic main\ndeb-src http://ppa.launchpad.net/jonathonf/texlive-2019/ubuntu bionic main' /etc/apt/sources.list

# Install dependencies for building the open-logic-debug.pdf file
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-base \
    texlive-fonts-recommended \
    texlive-generic-extra \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-science \
    latexmk 
    
# Set the working directory to wd and copy the git repository into it
WORKDIR /wd
VOLUME ["/wd"]
COPY . .

# Try generating open-logic-debug.pdf
CMD ["latexmk", "-dvi-", "-pdf", "-pdflatex=pdflatex -interaction nonstopmode -halt-on-error", "open-logic-debug.tex"]
