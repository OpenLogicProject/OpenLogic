# Incompleteness and Computability

![Book Cover](https://ic.openlogicproject.org/ic.png)

Textbook on Gödel's incompleteness theorems and computability
theory, developed for Calgary's Logic III course, based on the Open
Logic Project.  Covers recursive function theory, arithmetization of
syntax, the first and second incompleteness theorem, models of
arithmetic, second-order logic, and the lambda calculus.

You can [download the
PDF](https://ic.openlogicproject.org/ic-screen.pdf) from the [Open
Logic builds site](https://ic.openlogicproject.org/), or order a
hardcopy from Amazon [[US](https://www.amazon.com/dp/1077323395)]
[[CA](https://www.amazon.ca/dp/1077323395)]
[[UK](https://www.amazon.co.uk/dp/1077323395)]
[[DE](https://www.amazon.de/dp/1077323395)].

To install and compile:

- Download/install the _Open Logic Text_ from
  [GitHub](http://github.com/OpenLogicProject/OpenLogic/), including [photos](https://github.com/OpenLogicProject/photos) and [line art portraits](https://github.com/OpenLogicProject/portraits).
- Navigate to the subdirectory `textbooks/incompleteness-computability`.

Inside `textbooks/incompleteness-computability`, you can now compile:
```
# pdflatex ic-screen
```
or just `# make` if you have `latexmk` installed. (You'll also have to
do `bibtex ic-screen` for the bibliography.)

The file `ic-screen.tex` produces a color version of the text with
smaller margins for screen reading. `ic-print` produces a
black-and-white version designed for printing on Crown Quarto stock
(without cover).

The file loads `ic.tex`, which contains the actual material. It
in turn includes other files, most of them from the `contents/`
directory.

[![Creative Commons License](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)](https://creativecommons.org/licenses/by/4.0/) 

_[Incompleteness and
Computability](https://ic.openlogicproject.org/)_ by [Richard
Zach](https://richardzach.org/) is licensed under a [Creative Commons
Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
