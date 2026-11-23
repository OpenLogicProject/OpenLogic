# Set Theory: An Open Introduction

[![Book Cover](https://st.openlogicproject.org/settheory.png)](https://st.openlogicproject.org/settheory-screen.pdf)

_Set Theory: An Open Introduction_ is a brief introduction to the
philosophy of set theory. It is written for students with a little
background in logic, and some high school mathematics. By the end of
this book, students reading it might have a sense of:

- why set theory came about;
- how to reduce large swathes of mathematics to set theory + arithmetic;
- how to embed arithmetic in set theory;
- what the cumulative iterative conception of set amounts to;
- how one might try to justify the axioms of ZFC.

Most of the material making up the text comes from [Tim
Button](http://www.nottub.com/)'s _Open Set Theory_.

You can [download the
PDF](https://st.openlogicproject.org/settheory-screen.pdf)
from the [Open Logic builds
site](https://st.openlogicproject.org/).

You can order a hardcopy of the Fall 2021 edition from
Amazon [[US](https://www.amazon.com/dp/B09KN65FFQ)|[CA](https://www.amazon.ca/dp/B09KN65FFQ)|[UK](https://www.amazon.co.uk/dp/B09KN65FFQ)|[DE](https://www.amazon.de/dp/B09KN65FFQ)|[AU](https://www.amazon.com.au/dp/B09KN65FFQ)].


To install and compile:

- Download/install the _Open Logic Text_ from
  [GitHub](http://github.com/OpenLogicProject/OpenLogic/), including [photos](https://github.com/OpenLogicProject/photos) and [line art portraits](https://github.com/OpenLogicProject/portraits).
- Navigate to the subdirectory `textbooks/set-theory`.

Inside `textbooks/set-theory`, you can now compile:
```
# pdflatex settheory-screen
```
or just `# make` if you have `latexmk` installed. (You'll also have to
do `bibtex settheory-screen` for the bibliography.)

The file `settheory-screen.tex` produces a color version of the text
with smaller margins for screen reading.

The file loads `settheory.tex`, which contains the actual material. It
in turn includes other files, most of them from the `contents/`
directory.

[![Creative Commons License](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)](https://creativecommons.org/licenses/by/4.0/) 

_[Set Theory](https://st.openlogicproject.org/)_ by
[Tim Button](http://nottub.com/) is licensed under a [Creative Commons
Attribution 4.0 International
License](http://creativecommons.org/licenses/by/4.0/).
