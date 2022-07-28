% open-logic-book.cls
% Class file for producing textbooks from the Open Logic Project

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{open-logic-book}

% class option cover for KDP quarto book covers
\DeclareOption{cover}{
  % Load packages we need for the cover
  \AtEndOfClass{
  \usepackage[absolute,overlay]{textpos}
  \usepackage{rotating}
  \usepackage{xcolor}
  
  \usepackage{helvet,amsmath}
  \usepackage{textgreek}

  \newcommand*{\OLPtitlecoverfont}{\fontsize{65pt}{70pt}\sffamily\bfseries}
  \newcommand*{\OLPsubtitlecoverfont}{\fontsize{25pt}{28pt}\sffamily\bfseries}
}

  % Set the paper size for the cover
  % Assumes \OLPpagenumber is set, which should be done in the
  % preamble using \set\OLPpagenumber
  \AtBeginDocument{
  \newlength{\coverheight}
  \newlength{\coverwidth}
  \newlength{\spinewidth}
  \newlength{\spinepos} % spine starts here, width = \spinewidth
  \newlength{\coverpos} % front cover starts here, width = \spinepos
  \newlength{\sheetwidth}
  \setlength{\sheetwidth}{0.002252in}
  
  \setlength{\coverheight}{9.69in}  % trim height
  \setlength{\spinepos}{7.44in} % trim width
  \setlength{\spinewidth}{\OLPpagenumber\sheetwidth}
  
  % compute actual widths
  \addtolength{\coverheight}{.25in} % add bleed
  \addtolength{\spinepos}{.125in} % adjust for bleed
  \setlength{\coverwidth}{\spinepos}
  \addtolength{\coverwidth}{\coverwidth}
  \addtolength{\coverwidth}{\spinewidth}
  
  \newlength{\coverartpos}
  \newlength{\coverartheight}
  \setlength{\coverartpos}{3.646in}
  \addtolength{\coverartheight}{\coverheight}
  \addtolength{\coverartheight}{-\coverartpos}
  
  % \coverpos = \spinepso + \spinewidth
  \setlength{\coverpos}{\spinepos}
  \addtolength{\coverpos}{\spinewidth}
  
  %\setlength{\textwidth}{.8\spinepos}

  % set stock size to total width & height of cover 
  \setstocksize{\coverheight}{\coverwidth}
  
  % pagesize = stocksize
  \settrimmedsize{\stockheight}{\stockwidth}{*}
  \settrims{0pt}{0pt}
  
  % no margins or headers
  \setlrmarginsandblock{0pt}{0pt}{*}
  \setheadfoot{0pt}{0pt}
  \setulmarginsandblock{0pt}{0pt}{*}
  \setheadfoot{0pt}{0pt}
  \setlength{\headsep}{0pt}
  
  % finalize the page layout
  \checkandfixthelayout[fixed]
  \typeoutlayout
  
%  \RequirePackage[x-1a]{pdfx}
  }
}

% class option interior for tyepsetting the interior of a book
\DeclareOption{interior}{
  % Make sure standard packages are available
  \AtEndOfClass{
    \RequirePackage{xcolor}
    \RequirePackage{mdframed}
    \RequirePackage[full]{textcomp}
    \RequirePackage{gitinfo2}
    \RequirePackage{amsmath}
    % load ntheorem before newtxmath to avoid multiple definition of \openbox
    \RequirePackage[thmmarks,amsmath,amsthm,hyperref]{ntheorem}
    % redefine proof-end symbol; ntheorem's \openbox gives a hacek-C
    % after a cases environment for some reason
    \gdef\proofSymbol{\ensuremath{\Box}}

    % Set up fonts

    % Helvetica for sans-serif
    \usepackage[scaled=.92]{helvet}
    % Baskervald X for roman, with oldstyle figure
    \usepackage[osf]{Baskervaldx}
    % load amssymb before newtxmath to avoid problem with \Bbbk
    \usepackage{amssymb}
    % Nice math calligraphic font 
    \usepackage[cal=boondoxo]{mathalpha}
    % Math font to match
    \usepackage[bigdelims,baskervaldx]{newtxmath}
    % use Bodono greek for math
    \usepackage{textgreek}
  }

  \AtBeginDocument{
    \setlength{\olphotowidth}{.45\textwidth}

    % Make sure we have a copyright symbol
    \def\copyright{\textcircled{C}}

    \def\captionnamefont{\small\sffamily\color{OLPcolor}}
    \def\captiontitlefont{\small\itfamily}

    \def\figurename{Fig.}

    % Make justification a bit sloppy to avoid overfull lines
    \midsloppy
  }
}

% class option print for KDP quarto print book interior
\DeclareOption{print}{
  \ExecuteOptions{interior}
  \def\OLPassetversion{print}
  \AtEndOfClass{
    % format the page
    \OLPbookformat{24.589cm}{18.91cm}{90pt}{1.3}

    % make sure PDF conforms to PDF/X standard
    \usepackage[x-1a]{pdfx}

    % chapter heads have bars on left
    \setlength{\barwidth}{7pt}
    }

  \AtBeginDocument{
    % make photos high resolution
    \tagfalse{olphotos-lowres}
    % make links black
    \hypersetup{hidelinks}

    \copypagestyle{OLPpage}{headings}

    \makepsmarks{OLPpage}{%
      \createmark{chapter}{both}{shownumber}{\@chapapp\ }{. \ }
      \createmark{section}{right}{shownumber}{}{. \ }
      \createplainmark{toc}{both}{\contentsname}
      \createplainmark{lof}{both}{\listfigurename}
      \createplainmark{lot}{both}{\listtablename}
      \createplainmark{bib}{both}{\bibname}
      \createplainmark{index}{both}{\indexname}
      \createplainmark{glossary}{both}{\glossaryname}
      \createplainmark{pcr}{both}{Photo Credits}
    }

    \makeoddhead{OLPpage}{\small\sffamily\color{OLPcolor}\rightmark}{}
      {\color{OLPcolor}\sffamily\bfseries\thepage}

    \makeevenhead{OLPpage}{\color{OLPcolor}\sffamily\bfseries\thepage}{}
      {\small\sffamily\color{OLPcolor}\leftmark}
  }
}

% class option screen for screen reading version in color
\DeclareOption{screen}{
  \ExecuteOptions{interior}
  \def\OLPassetversion{screen}
  \AtEndOfClass{
    \OLPbookformat{8in}{5in}{.6in}{1}
    \newcommand*{\OLPtitlecoverfont}{\fontsize{50pt}{54pt}\sffamily\bfseries}
    \newcommand*{\OLPsubtitlecoverfont}{\fontsize{25pt}{28pt}\sffamily\bfseries}
  }
  \AtBeginDocument{
    % make sure PDF conforms to PDF/A standard
    \RequirePackage[a-1b]{pdfx}
    % no bars next to chapter headings
    \setlength{\barwidth}{0pt}
    \RequirePackage[numbered]{bookmark}
    \hypersetup{
      pdfdisplaydoctitle,
      allcolors=OLPdkcolor,
  %    pdftitle={\OLPbooktitle. \OLPbooksubtitle{} (\OLPshortbookversion)},
  %    pdfauthor = {\OLPauthor, Open Logic Project}
    }
    \copypagestyle{OLPpage}{headings}

    \makeoddhead{OLPpage}{\small\sffamily\color{OLPcolor}\leftmark}{}{\color{OLPcolor}\sffamily\bfseries\thepage}

    \makeevenhead{OLPpage}{\small\sffamily\color{OLPcolor}\leftmark}{}{\color{OLPcolor}\sffamily\bfseries\thepage}

    \addtopsmarks{OLPpage}{}{\createplainmark{pcr}{both}{Photo Credits}}
  }
}

\DeclareOption*{\ClassError{open-logic-book}{You must specify an option!}}

\ProcessOptions\relax

% based on memoir class
\LoadClass[11pt,openany]{memoir}

% textpos for absolute positioning of boxes
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{xcolor}

% set default colors to black/grey
\colorlet{OLPcolor}{black}
\colorlet{OLPdkcolor}{black}
\colorlet{OLPltcolor}{black!5}

% \OLPbookformat{height}{width}{upper margin}{l/r margin ratio}
\newcommand{\OLPbookformat}[4]{
    \setstocksize{#1}{#2}

    \settrimmedsize{\stockheight}{\stockwidth}{*}
    \settrims{0pt}{0pt}

    % let's calculate the line length for 65 characters in \normalfont
    % \setlxvchars
    % we're hardcoding textwidth to 300pt

    % set the size of the type block to golden ratio calculated width

    \settypeblocksize{*}{300pt}{1.62}

    % set spine and and edge margin

    \setlrmargins{*}{*}{#4}
    \setulmargins{#3}{*}{*}
    \setheaderspaces{*}{*}{1}

    \checkandfixthelayout
}

% Define part and chapter styles

\newlength{\barwidth}

\makechapterstyle{OLPchapter}{%
  \setlength{\afterchapskip}{40pt}
  \setlength{\beforechapskip}{50pt}
  \setlength{\midchapskip}{10pt}
  \renewcommand*{\afterchapternum}{\par\nobreak\vskip 0pt}
  \renewcommand*{\chapnamefont}{\fontsize{14pt}{0pt}\selectfont\sffamily\bfseries}
  \let\chapnumfont\chapnamefont
  \renewcommand*{\chaptitlefont}{\normalfont\fontsize{44pt}{44pt}\selectfont\bfseries\itshape\color{OLPcolor}}
  \renewcommand*{\printchaptername}{%
    \chapnamefont\MakeUppercase{\@chapapp}}
  \renewcommand*{\printchaptertitle}[1]{%
    \chaptitlefont ##1\\[-\baselineskip]%
    \hspace*{-20pt}%
    \smash{\color{OLPcolor}\rule{\barwidth}{350pt}}}
}

\renewcommand*{\partnamefont}{\fontsize{24pt}{0pt}\selectfont\bfseries\sffamily}
\renewcommand*{\partnumfont}{\fontsize{24pt}{0pt}\selectfont\bfseries\sffamily}
\renewcommand*{\parttitlefont}{\normalfont\fontsize{54pt}{54pt}\selectfont\bfseries\itshape\color{OLPcolor}}
\renewcommand*{\printpartname}{%
  \partnamefont PART}

\chapterstyle{OLPchapter}

\captionnamefont{\footnotesize\itshape\color{OLPcolor}}
\captiontitlefont{\footnotesize}

\setlength{\cftbeforepartskip}{2em plus 0.5em minus 0.5em}
\setlength{\cftbeforechapterskip}{1.0em plus 0.5em minus 0.25em}


% Commands to set author, title, subtitle, bookversion

\RequirePackage{xparse}

\DeclareDocumentCommand \setOLPbooktitle { o m } {
    \IfNoValueTF {#1} 
        { \newcommand{\OLPbooktitlecover}{#2} }
        { \newcommand{\OLPbooktitlecover}{#1} }
    \newcommand{\OLPbooktitle}{#2}
}

\DeclareDocumentCommand \setOLPbooksubtitle { o m } {
    \IfNoValueTF {#1} 
        { \newcommand{\OLPbooksubtitlecover}{#2} }
        { \newcommand{\OLPbooksubtitlecover}{#1} }
    \newcommand{\OLPbooksubtitle}{#2}
}

\DeclareDocumentCommand \setOLPauthor { o m } {
    \IfNoValueTF {#1} 
        { \newcommand{\OLPauthorcover}{#2} }
        { \newcommand{\OLPauthorcover}{#1} }
    \newcommand{\OLPauthor}{#2}
}

\DeclareDocumentCommand \setOLPbookversion { m m } {
    \newcommand{\OLPbookversion}{#1}
    \newcommand{\OLPshortbookversion}{#2}
}

\newcommand{\setOLPsourcelink}[1]{
    \newcommand{\OLPsourcelink}{#1}}

\newcommand{\setOLPauthorlink}[1]{
  \newcommand{\OLPauthorlink}{#1}}

\newcommand{\setOLPpagenumber}[1]{
    \newcommand{\OLPpagenumber}{#1}}

\newcommand{\setOLPrevision}[1]{
    \newcommand{\OLPrevision}{#1}}

\IfFileExists{olprevision.tex}{\input{olprevision.tex}}
  {\setOLPrevision{unknown (\today)}}

% \OLPprintcover -- make a Quarto size cover PDF for KDP

\newcommand{\OLPprintcover}[1]{
  \color{black}
  \sffamily

  % no folios
  \pagestyle{empty}
        
  \textblockcolor{OLPltcolor}
          
  \begin{textblock*}{\coverwidth}(0in,\coverartpos)
    \vbox to \coverartheight{\quad}
  \end{textblock*}
        
  \textblockcolor{}
        
  % make a spine
  \begin{textblock*}{\spinewidth}(\spinepos,0bp)%
  \noindent\hfil
  \rotatebox{-90}{% make spine text readable when book is lying cover up
    \hbox to \coverheight{
      \fontsize{16pt}{19pt}\sffamily\bfseries\selectfont
      \color{black}
      \hbox to \coverartpos{%
        \hskip 1.5cm
        \OLPauthor\hfil}
      \hskip1cm
      \OLPbooktitle
      \hfil
      %\color{white}
      \OLPshortbookversion\hspace{1.1cm}}}%
  \hfil
  \end{textblock*}
  \newbox\adjust

  \textblockcolor{}

  % make front cover
  \begin{textblock*}{\spinepos}(\coverpos,0pt)
    \noindent\hfill
    \begin{minipage}[b][\coverartpos][s]{.8\spinepos}
    \vbox to\coverartpos{
    \begin{raggedleft}
      \vspace*{1.7cm}
      \OLPtitlecoverfont\selectfont
      \color{OLPcolor}
      \OLPbooktitlecover

      \vspace*{1cm}
      \color{black}
      \sffamily
      \OLPsubtitlecoverfont\selectfont
      \OLPbooksubtitlecover

    \end{raggedleft}}
    \vbox to\coverartheight{%
      \vfill
      \noindent #1{}

      \vfill
    \vspace{.125in}}
  \end{minipage}
  \hspace{1.5cm}
  \end{textblock*}

  \textblockcolor{}

  % place version number in bottom right corner

  \begin{textblock*}{\spinepos}(\coverpos,0pt)
    \vbox to \coverheight{
      \vfill
      \fontsize{16pt}{19pt}\selectfont
      \hfill\textbf{\OLPshortbookversion}\hspace*{1.5cm}\par
      \vspace*{1.5cm}}
  \end{textblock*}

  \textblockcolor{}

  % make back cover
  \begin{textblock*}{\spinepos}(0pt,0pt)
    \noindent\hspace{1.5cm}
    \begin{minipage}[t][\coverheight][b]{.85\spinepos}
      \begin{minipage}{1.7cm}
        \includegraphics[width=1.1cm]{\olpath/assets/logos/cc.pdf}
        \includegraphics[width=1.1cm]{\olpath/assets/logos/by.pdf}
        \includegraphics[width=1.1cm]{\olpath/assets/logos/remix.pdf}
      \end{minipage}
      \hspace{.3cm}
      \begin{minipage}{5.5cm}
        \begin{raggedright}
          \fontsize{14pt}{16pt}\selectfont\color{black}
          \textit{\OLPbooktitle} by \OLPauthor{} is
          licensed under a Creative Commons Attribution 4.0 International
          License.\par
        \end{raggedright}
      \end{minipage}
      \hfill
      \vspace*{2cm}
    \end{minipage}
    \hfill
  \end{textblock*}
}

% \OLPscreencover -- make a cover page for screen version

\newcommand{\OLPscreencover}[1]{
    % Cover Page

\thispagestyle{empty}

% front cover artwork
\textblockcolor{OLPltcolor}
\begin{textblock*}{\stockwidth}(0in,3.5in)
  \noindent\hfill
  \begin{minipage}{.9\stockwidth}
    \vbox to 4.5in{%
      \vfill
      \noindent #1{}
      
      \vfill}
  \end{minipage}
  \hfill{}
\end{textblock*}

% title and subtitle
\textblockcolor{}
\begin{textblock*}{\stockwidth}(0in,0in)
  \noindent\hfill
  \begin{minipage}[b][\stockheight][s]{.9\stockwidth}
    \begin{raggedleft}
      \vspace*{1.7cm}
      \hfill
      \OLPtitlecoverfont\selectfont
      \color{OLPcolor}
      \OLPbooktitlecover
                    
      \vspace*{1cm}
      \color{black}
      \OLPsubtitlecoverfont\selectfont
      \OLPbooksubtitlecover

    \end{raggedleft}
  \end{minipage}
  \hfill{}
\end{textblock*}

% place version number in bottom right corner
  \textblockcolor{}
  \begin{textblock*}{\stockwidth}(0pt,0pt)
    \vbox to \stockheight{
      \vfill
      \fontsize{16pt}{19pt}\sffamily\selectfont
      \hfill\textbf{\OLPshortbookversion}\hspace*{1cm}\par
      \vspace*{1cm}}
  \end{textblock*}
\ 
\newpage
\setcounter{page}{1}
}

% \OLPfrontmatter -- typeset bastard title, editorial board, title
% page, copyright page, and table of contents

\newcommand{\OLPfrontmatter}{

% bastard title

\pagestyle{empty}

\vspace*{100pt}

\begin{raggedleft}

{\fontsize{24pt}{28pt}\selectfont\bfseries\sffamily%
\OLPbooktitle\par}

\end{raggedleft}

\newpage

% editorial board

\vspace*{100pt}

{\bfseries\itshape The Open Logic Project}

\bigskip

\textbf{\color{OLPcolor}Instigator}

\medskip

Richard Zach, \emph{University of Calgary}

\bigskip

\textbf{\color{OLPcolor}Editorial Board}

\medskip

Aldo Antonelli,$^\dagger$ \emph{University of California, Davis}

Andrew Arana, \emph{Universit\'e de Lorraine}

Jeremy Avigad, \emph{Carnegie Mellon University}

Tim Button, \emph{University College London}

Walter Dean, \emph{University of Warwick}

Gillian Russell, \emph{Dianoia Institute of Philosophy}

Nicole Wyatt, \emph{University of Calgary}

Audrey Yap, \emph{University of Victoria}

\bigskip

\textbf{\color{OLPcolor}Contributors}

\medskip

Samara Burns, \emph{Columbia University}

Dana H\"agg, \emph{University of Calgary}

Zesen Qian, \emph{Carnegie Mellon University}

\newpage

% title page

\vspace*{100pt}

\begin{raggedleft}

{\fontsize{24pt}{28pt}\bfseries\sffamily\selectfont%
\OLPbooktitle\par}

\bigskip

{\fontsize{18pt}{22pt}\selectfont\bfseries\itshape \OLPbooksubtitle\par}

\vspace{100pt}

\fontsize{14pt}{14pt}\selectfont Remixed by \OLPauthor{}

\vfill

\textsc{\OLPbookversion}

\end{raggedleft}

\newpage

% copyright page

\noindent
The Open Logic Project would like to acknowledge the generous support
of the \href{https://taylorinstitute.ucalgary.ca/}{Taylor Institute
of Teaching and Learning} of the University of Calgary, and the
Alberta Open Educational Resources (ABOER) Initiative, which is made
possible through an investment from the Alberta government.

\bigskip

\noindent
\includegraphics[height=1.2cm]{\olpath/assets/logos/ti-\OLPassetversion}

\bigskip

\noindent
\includegraphics[height=1.5cm]{\olpath/assets/logos/aboer-\OLPassetversion}

\vfill

\noindent Cover illustrations by \href{http://mattleadbeater.com}{Matthew
  Leadbeater}, used under a
\href{https://creativecommons.org/licenses/by-nc/4.0/}{Creative Commons
  Attribution-NonCommercial 4.0 International License}.

\vfill

\noindent Typeset in Baskervald X and Nimbus Sans by
\LaTeX.

\vfill

\noindent This version of \emph{\OLPbooktitle} is
revision \gitAbbrevHash{} (\gitAuthorDate), with content generated
from \emph{Open Logic Text} revision
\OLPrevision. Free download at:\\[.5ex]
\url{\OLPsourcelink}

\vfill

% oluselicense generates a license mark that a) licenses the result
% under a CC-BY licence and b) acknowledges the original source (the
% OLP).  Acknowledgment of the source is a requirement under the
% conditions of the CC-BY license used by the OLP, but you are not
% required to license the product itself under CC-BY.

\renewcommand{\ollicensefont}{\fontsize{8.5pt}{11pt}\selectfont}

\noindent
\oluselicense
% Title of this version of the OLT with link to source
{\href{\OLPsourcelink}{\textit{\OLPbooktitle}}}
% Author of this version
{\href{\OLPauthorlink}{\OLPauthor}}

% table of contents

\newpage
\pagestyle{OLPpage}
\currentpdfbookmark{Table of Contents}{name}
\tableofcontents*
}

