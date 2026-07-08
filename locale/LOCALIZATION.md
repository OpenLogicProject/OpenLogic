# Localizing (Translating) the Open Logic Project

Localizations of the OLP live in subfolders of `locale/`. Names of
these folders are the [language
codes](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes)
of the corresponding localization, e.g., a French localization
would live in `locale/fr/`.

Assuming you're in the main directory of your local `OpenLogic` tree:
To start a new localization, navigate to `locale/` and create a new
subfolder, e.g.,
```
$ cd locale
$ mkdir fr
```
Or, if you want to keep track of versioning from the beginning, create
a new repository on GitHub (or your own favorite Git server), and
clone the (empty) repository into a subfolder of `locale/`. E.g., if
you have created a repository `OpenLogic-fr` on GitHub as `user`, say:
```
$ cd locale
$ git clone git@github.com:user/OpenLogic-fr.git fr
```
(The `fr` at the end is necessary so that the subfolder is called
`fr/` and not `OpenLogic-fr/`.)

Next, copy the contents of the top level folder, `include/`, and
`content/` into that directory:
```
$ cp ../* fr
$ cp -r ../include fr
$ cp -r ../content fr
```

Change the files in `locale/fr/include` and `locale/fr/`
according to the instructions at the top of those files. That is:

- Change what `\olpath` points to (add `/../..` at the end).
- Add lines of the form
  ```
  \newcommand*{\ollangid}{fr}
  \newcommand*{\ollanguage}{french}
  ```
  before `\input{\olpath/open-logic.sty}`
- Translate the English texts in `locale/fr/open-logic-locale.sty`.
- Put in `locale/fr/open-logic-config.sty` any redefinitions of tokens
  and commands, e.g., things like
  ```
  \RenewDocumentCommand \ran { m } {\operatorname{Im}(#1)}
  \settexttoken{language}{langage}{langages}
  \settexttoken{formula}{formule}{formules}
  ```
  (Note that in some languages it may be more appropriate to replace
  tokens with their unique standard translation.)

Finally, translate the actual OLP texts in `locale/fr/content/` you
want translated. Once a section file is translated, put the language id
as an optional parameter to the `\olfileid` command at the beginning
of the file, e.g.,
```
\olfileid[fr]{sfr}{siz}{int}
```

If you include photos from the [OLP photo
repository](https://github.com/OpenLogicProject/photos), you should
translate the photo credit files in
`assets/photos/<name>/<name>-credit.tex` and put those into a (new)
directory `locale/fr/photocredits`.

To prepare translations of textbooks, e.g., [_Set
Theory_](https://github.com/OpenLogicProject/set-theory), put the
contents of the corresponding repository in `locale/fr/courses/`. To
do this, either download the code as a ZIP file and uncompress it, or
make a fork of the repository, rename it by adding `-<langid>` to the
repository name, and then clone it into `locale/fr/courses/`. (To keep
the code in this directory separate from `OpenLogic-fr`, make sure to
not add any of its files to the outer Git tree. If you keep, say,
`locale/fr/courses/set-theory-fr` as its own Git repository, this will
be automatic.)

Once you have the English code of the textbook, make the following changes:

- Make `\documentclass` load `../../../../sty/open-logic-book`.
- Change what `\olpath` points to (add `/../..` at the end) in the
  driver files.
- Add lines of the form
  ```
  \newcommand*{\ollangid}{fr}
  \newcommand*{\ollanguage}{french}
  ```
  before `\input{\olpath/open-logic.sty}` in the main driver files.
- Translate English text in the driver files, metadata file, and any
  included files.