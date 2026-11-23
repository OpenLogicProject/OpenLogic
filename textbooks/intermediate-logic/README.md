# Intermediate Logic

![Book Cover](https://builds.openlogicproject.org/textbooks/intermediate-logic/il.png)

Textbook on basic set theory, first-order logic, and Gödel's
incompleteness theorems, developed for McGill's Intermediate Logic
course, based on the Open Logic Project.

Download the [PDF here](https://builds.openlogicproject.org/textbooks/intermediate-logic/il-screen.pdf).

To install and compile:

- Download/install the _Open Logic Text_ from
  [GitHub](http://github.com/OpenLogicProject/OpenLogic/), including [photos](https://github.com/OpenLogicProject/photos) and [line art portraits](https://github.com/OpenLogicProject/portraits).
- Navigate to the subdirectory `textbooks/intermediate-logic`.

Inside `textbooks/intermediate-logic`, you can now compile:
```
# pdflatex il-screen
```
or just `# make` if you have `latexmk` installed. (You'll also have to
do `bibtex il-screen` for the bibliography.)

The file `il-screen.tex` produces a color version of the text with
smaller margins for screen reading. `il-print` produces a
black-and-white version designed for printing on Crown Quarto stock
(without cover).

The file loads `ic.tex`, which contains the actual material. It
in turn includes other files, most of them from the `contents/`
directory.

[![Creative Commons License](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)](https://creativecommons.org/licenses/by/4.0/) 

_[Intermediate
Logic](https://builds.openlogicproject.org/textbooks/intermediate-logic/)_
by [Michael
Hallett](https://www.mcgill.ca/philosophy/michael-frank-hallett) and
[Richard Zach](https://richardzach.org/) is licensed under a [Creative
Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
