# What If?

![Book Cover](https://builds.openlogicproject.org/textbooks/what-if/wi.png)

A textbook on non-classical logics based on the Open
Logic Project. It is work in progress and not yet complete!

You can [download the
PDF](https://builds.openlogicproject.org/textbooks/what-if/wi-screen.pdf)
of the most recent version from the [Open Logic builds
site](https://builds.openlogicproject.org/textbooks/what-if/).

To install and compile:

- Download/install the _Open Logic Text_ from
  [GitHub](http://github.com/OpenLogicProject/OpenLogic/), including [photos](https://github.com/OpenLogicProject/photos) and [line art portraits](https://github.com/OpenLogicProject/portraits).
- Navigate to the subdirectory `textbooks/what-if`.

Inside `textbooks/what-if`, you can now compile:
```
# pdflatex wi-screen
```
or just `# make` if you have `latexmk` installed.

The file `wi-screen.tex` produces a color version of the text
with smaller margins for screen reading. `wi-print` produces a
black-and-white version designed for printing on Crown Quarto stock
(without cover).

Both versions load `wi.tex`, which contains the actual
material. It in turn includes other files, most of them from the
`content/` directory.

[![Creative Commons License](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)](http://creativecommons.org/licenses/by/4.0/) 

_[What If?](https://builds.openlogicproject.org/textbooks/what-if/)_ by [Audrey
Yap](https://audreysh.wordpress.com/) and [Richard
Zach](https://richardzach.org/) is licensed under a [Creative
Commons Attribution 4.0 International
License](http://creativecommons.org/licenses/by/4.0/).
