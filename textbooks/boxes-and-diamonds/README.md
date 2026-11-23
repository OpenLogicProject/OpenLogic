# Boxes and Diamonds

![Book Cover](https://bd.openlogicproject.org/bd.png)

A textbook for modal and other intensional logics based on the Open
Logic Project. It covers normal modal logics, relational semantics, 
axiomatic and tableaux proof systems, intuitionistic logic, and 
counterfactual conditionals.

You can [download the
PDF](https://bd.openlogicproject.org/bd-screen.pdf)
of the most recent version from the [Open Logic builds
site](https://bd.openlogicproject.org/), or order a
hardcopy from Amazon [[US](https://www.amazon.com/dp/1077321384)]
[[CA](https://www.amazon.ca/dp/1077321384)]
[[UK](https://www.amazon.co.uk/dp/1077321384)]
[[DE](https://www.amazon.de/dp/1077321384)]. Note that the version on
Amazon is usually not as current as the PDF.

To install and compile:

- Download/install the _Open Logic Text_ from
  [GitHub](http://github.com/OpenLogicProject/OpenLogic/), including [photos](https://github.com/OpenLogicProject/photos) and [line art portraits](https://github.com/OpenLogicProject/portraits).
- Navigate to the subdirectory `textbooks/boxes-and-diamonds`.

Inside `textbooks/boxes-and-diamonds`, you can now compile:
```
# pdflatex bd-screen
```
or just `# make` if you have `latexmk` installed.

The file `bd-screen.tex` produces a color version of the text
with smaller margins for screen reading. `bd-print` produces a
black-and-white version designed for printing on Crown Quarto stock
(without cover).

Both versions load `bd.tex`, which contains the actual
material. It in turn includes other files, most of them from the
`content/` directory.

[![Creative Commons License](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)](http://creativecommons.org/licenses/by/4.0/) 

_[Boxes and Diamonds](https://bd.openlogicproject.org/)_ by [Richard
Zach](http://richardzach.org/) is licensed under a [Creative
Commons Attribution 4.0 International
License](http://creativecommons.org/licenses/by/4.0/).
