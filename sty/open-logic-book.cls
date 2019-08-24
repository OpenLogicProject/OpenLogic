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
    \RequirePackage{amsthm}
    \RequirePackage{xcolor}
    \RequirePackage{mdframed}
    \RequirePackage[full]{textcomp}
    \RequirePackage{gitinfo2}

    % Set up fonts

    % Helvetica for sans-serif
    \usepackage[scaled=.92]{helvet}
    % Baskervald X for roman, with oldstyle figure
    \usepackage[osf]{Baskervaldx}
    % Math font to match
    \usepackage[bigdelims,baskervaldx]{newtxmath}
    % Nice math calligraphic font 
    \usepackage[cal=boondoxo]{mathalfa}
    \usepackage{textgreek}
  }

  \AtBeginDocument{
    \setlength{\olphotowidth}{.45\textwidth}

    % Make sure we have a copyright symbol
    \def\copyright{\textcircled{C}}

    \def\captionnamefont{\small\sffamily\color{OLPcolor}}
    \def\captiontitlefont{\small\itfamily}

    \def\figurename{Fig.}
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
%    \RequirePackage[x-1a]{pdfx}
    \setlength{\barwidth}{7pt}
    }

  \AtBeginDocument{
    % make photos high resolution
    \tagfalse{olphotos-lowres}
    \copypagestyle{OLPpage}{headings}

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

    \makeoddhead{OLPpage}{\color{OLPcolor}\sffamily\bfseries\thepage}{}
      {\small\sffamily\color{OLPcolor}\rightmark}

    \makeevenhead{OLPpage}{\color{OLPcolor}\sffamily\bfseries\thepage}{}
      {\small\sffamily\color{OLPcolor}\leftmark}
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

    \setlxvchars

    % set the size of the type block to golden ratio calculated width

    \settypeblocksize{*}{1.05\lxvchars}{1.62}

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
        \sffamily\fontsize{65pt}{65pt}\selectfont
        \color{OLPcolor}
        \textbf{\OLPbooktitlecover}

        \vspace*{1cm}
        \color{black}
        \sffamily
        \fontsize{25pt}{25pt}\selectfont
        \textbf{\OLPbooksubtitlecover}\par
     \end{raggedleft}}
    \vbox to\coverartheight{%
      \begin{raggedleft}
        \vskip1cm\noindent
        #1

      \vfill
      \fontsize{16pt}{19pt}\selectfont
      \textbf{\OLPshortbookversion}\par
    \end{raggedleft}
    \vspace{1.5cm}}
  \end{minipage}
    \hspace{1.5cm}
  \end{textblock*}

  \textblockcolor{}

  % make back cover
  \begin{textblock*}{\spinepos}(0pt,0pt)
    \noindent\hspace{1.5cm}
    \begin{minipage}[b][\coverheight][b]{.85\spinepos}
      \begin{minipage}[b]{1.7cm}
        \includegraphics[width=1.1cm]{\olpath/assets/logos/cc.pdf}
        \includegraphics[width=1.1cm]{\olpath/assets/logos/by.pdf}
        \includegraphics[width=1.1cm]{\olpath/assets/logos/remix.pdf}
      \end{minipage}
      \hspace{.3cm}
      \begin{minipage}[b]{5.5cm}
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

\newcommand{\OLPscreencover}[1]{
    % Cover Page

\thispagestyle{empty}

\textblockcolor{OLPltcolor}
\begin{textblock*}{\stockwidth}(0in,3.5in)
  \vbox to 4.5in{\quad}
\end{textblock*}

\textblockcolor{}
% make front cover
\begin{textblock*}{\stockwidth}(0in,0in)
  \noindent\hfill
  \begin{minipage}[b][\stockheight][s]{.9\stockwidth}
    \begin{raggedleft}
      \vspace*{1.7cm}
      \hfill
      \sffamily\fontsize{50pt}{50pt}\selectfont
      \color{OLPcolor}
      \textbf{\OLPbooktitlecover}%
                    
      \vspace*{1cm}
      \color{black}
      \sffamily
      \fontsize{25pt}{25pt}\selectfont
      \textbf{\OLPbooksubtitlecover}
      \vskip2cm

      #1

      \vfill
      \fontsize{16pt}{19pt}\selectfont
      \textbf{\OLPshortbookversion}\par
      \vspace{.5cm}
    \end{raggedleft}
  \end{minipage}
  \hfill{}
\end{textblock*}
\ 
\newpage
\setcounter{page}{1}
}

\newcommand{\OLPfrontmatter}{
    % bastard title

\pagestyle{empty}

\vspace*{100pt}

\begin{raggedleft}

{\fontsize{24pt}{24pt}\selectfont\bfseries\sffamily%
\OLPbooktitle}

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

Andrew Arana, \emph{Universit\'e Paris I Panth\'enon--Sorbonne}

Jeremy Avigad, \emph{Carnegie Mellon University}

Walter Dean, \emph{University of Warwick}

Gillian Russell, \emph{University of North Carolina}

Nicole Wyatt, \emph{University of Calgary}

Audrey Yap, \emph{University of Victoria}

\bigskip

\textbf{\color{OLPcolor}Contributors}

\medskip

Samara Burns, \emph{University of Calgary}

Dana H\"agg, \emph{University of Calgary}

Zesen Qian, \emph{Carnegie Mellon University}

\newpage

% title

\vspace*{100pt}

\begin{raggedleft}

{\fontsize{24pt}{24pt}\selectfont\bfseries\sffamily%
\OLPbooktitle}

\bigskip

{\fontsize{18pt}{18pt}\selectfont\bfseries\itshape \OLPbooksubtitle{}}

\vspace{100pt}

\fontsize{14pt}{14pt}\selectfont Remixed by \OLPauthor{}

\vfill

\textsc{\OLPbookversion}

\end{raggedleft}


\newpage

% credits

\noindent
The Open Logic Project would like to acknowledge the generous support
of the \href{http://www.ucalgary.ca/taylorinstitute/}{Taylor Institute of
Teaching and Learning} of the University of Calgary,
and the \href{http://albertaoer.com}{Alberta Open Educational Resources
(ABOER) Initiative}, which is made possible through an investment from
the Alberta government.

\bigskip

\noindent\includegraphics[height=1cm]{\olpath/assets/logos/ti-\OLPassetversion}

\medskip

\noindent\includegraphics[width=4cm]{\olpath/assets/logos/aboer-\OLPassetversion}

\vfill

\noindent Cover illustrations by \href{http://mattleadbeater.com}{Matthew
  Leadbeater}, used under a
\href{http://creativecommons.org/licenses/by-nc/4.0/}{Creative Commons
  Attribution-NonCommercial 4.0 International License}.

\vfill

\noindent Typeset in Baskervald X and Nimbus Sans by
\LaTeX.

\vfill

\noindent This version of \emph{\OLPbooktitle} is
revision \gitAbbrevHash{} (\gitAuthorDate), with content generated
from \emph{Open Logic Text} revision
\input{olprevision}

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

\newpage
\pagestyle{OLPpage}
\currentpdfbookmark{Table of Contents}{name}
\tableofcontents*
}

