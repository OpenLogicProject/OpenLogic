# Sets, Logic, Computation

[![Book Cover](https://slc.openlogicproject.org/slc.png)](https://slc.openlogicproject.org/slc-screen.pdf)

_Sets, Logic, Computation_ is an introductory textbook on metalogic.
It covers naive set theory, first-order logic, sequent calculus and
natural deduction, the completeness, compactness, and Löwenheim-Skolem
theorems, Turing machines, and the undecidability of the halting
problem and of first-order logic. The audience is undergraduate
students with some background in formal logic, e.g., what is covered
by _[forall x](https://forallx.openlogicproject.org)_.

This repository/directory only contains the LaTeX files and
illustrations needed to typeset the textbook _Sets, Logic,
Computation_. It *also* requires the material in the _[Open Logic
Text](https://github.com/OpenLogicProject/OpenLogic/)_.

You can download the PDF of the most recent version from the [Open
Logic builds site](https://builds.openlogicproject.org/):

- [Screen version](https://slc.openlogicproject.org/slc-screen.pdf)
- [Print version](https://slc.openlogicproject.org/slc-print.pdf)

We also have archived versions:

- <a
  href="https://slc.openlogicproject.org/archives/f25/slc-screen.pdf"
  rel="nofollow">Fall
  2025</a>.
- <a
  href="https://slc.openlogicproject.org/archives/f21/slc-screen.pdf"
  rel="nofollow">Fall
  2021</a>.
- <a
  href="https://slc.openlogicproject.org/archives/f19/slc-screen.pdf"
  rel="nofollow">Fall
  2019</a>.
- <a
  href="https://slc.openlogicproject.org/archives/f16/slc-screen.pdf"
  rel="nofollow">Fall
  2016</a>.

You can order a hardcopy from
Amazon
[[US](https://www.amazon.com/dp/B099C47ND8)|[CA](https://www.amazon.ca/dp/B099C47ND8)|[UK](https://www.amazon.co.uk/dp/B099C47ND8)|[DE](https://www.amazon.de/dp/B099C47ND8)|[AU](https://www.amazon.com.au/dp/B099C47ND8)].
Please note that the version on Amazon is not updated regularly and so
may not match the most recent PDF.

To install and compile:

- Download/install the _Open Logic Text_ from
  [GitHub](https://github.com/OpenLogicProject/OpenLogic/), including [photos](https://github.com/OpenLogicProject/photos) and [line art portraits](https://github.com/OpenLogicProject/portraits).
- Navigate to the subdirectory `courses/`
- Put the content of [this repository](https://github.com/rzach/sets-logic-computation) into a subdirectory of it, say
  `courses/sets-logic-computation/`.
- To get the graphics for the cover, navigate to the subdirectory `OpenLogic/assets` and put the content of [`photos`](https://github.com/OpenLogicProject/photos) into the subdirectory `photos`, and the content of [`portraits`](https://github.com/OpenLogicProject/portraits) into the subdirectory `portraits`

If you use `git`, this should do it:
```
# git clone https://github.com/OpenLogicProject/OpenLogic.git
# cd OpenLogic/courses
# git clone https://github.com/rzach/sets-logic-computation.git
# cd ../assets
# git clone https://github.com/OpenLogicProject/portraits.git
# git clone https://github.com/OpenLogicProject/photos.git
```
Inside `courses/sets-logic-computation/`, you can now compile:
```
# pdflatex slc-screen
```
or just `# make` if you have `latexmk` installed. (You'll also have to
do `makeglossaries slc-screen` to get the glossary, and `bibtex
slc-screen` for the bibliography.)

The file `slc-screen.tex` produces a color version of the text
with smaller margins for screen reading. `slc-print` produces a
black-and-white version designed for printing on Crown Quarto stock
(without cover).

Both versions load `slc.tex`, which contains the actual
material. It in turn includes other files, most of them from the
`OpenLogic` repository. So you won't get a complete book unless you
download into the right subdirectory of and compile from there.

[![Creative Commons License](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)](https://creativecommons.org/licenses/by/4.0/) 

_[Sets, Logic, Computation](https://slc.openlogicproject.org/)_ by [Richard
Zach](https://richardzach.org/) is licensed under a [Creative
Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
