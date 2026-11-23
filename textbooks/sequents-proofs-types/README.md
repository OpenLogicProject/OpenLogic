# Sequents, Proofs, Types

![Book Cover](https://builds.openlogicproject.org/textbooks/sequents-proofs-types/sp.png)

A textbook on proof theory based on the Open Logic Project. Very much
work in progress!

To install and compile:

- Download/install the _Open Logic Text_ from
  [GitHub](http://github.com/OpenLogicProject/OpenLogic/), including [photos](https://github.com/OpenLogicProject/photos) and [line art portraits](https://github.com/OpenLogicProject/portraits).
- Navigate to the subdirectory `textbooks/sequents-pproofs-types`.

Inside `textbooks/sequents-proofs-types`, you can now compile:
```
# pdflatex spt-screen
```
or just `# make` if you have `latexmk` installed.

The file `spt-screen.tex` produces a color version of the text
with smaller margins for screen reading. `spt-print` produces a
black-and-white version designed for printing on Crown Quarto stock
(without cover).

Both versions load `spt.tex`, which contains the actual
material. It in turn includes other files, most of them from the
`OpenLogic` repository. So you won't get a complete book unless you
download into the right subdirectory of and compile from there.

[![Creative Commons License](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)](http://creativecommons.org/licenses/by/4.0/) 

_[Sequents, Proofs, Types](https://builds.openlogicproject.org/textbooks/sequents-proofs-types/)_ by [Richard
Zach](http://richardzach.org/) is licensed under a [Creative
Commons Attribution 4.0 International
License](http://creativecommons.org/licenses/by/4.0/).
