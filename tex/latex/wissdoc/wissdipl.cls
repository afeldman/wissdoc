%% LaTeX2e Formatklasse für die Diplomarbeit    -*-Mode: LaTeX;-*-
%%
%% Copyright (C) 2013 anton Feldmann
%%
%%Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%%
%%The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%%
%%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%%
%%
%% Autor: Anton Feldmann anton.feldmann@gmail.com
%% --
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01] % Basis Latex2e
\ProvidesClass{wissdipl}[2013/01/01 WissDoc Team - Diplomarbeit]

%% start options
\newif\if@math% usepackages for mathamtics
\newif\if@german
\newif\if@draft

\def\math{\global\@mathtrue}
\def\german{\global\@germanfalse}

%option of wissdoc class


\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{srcbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{srcbook}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{scrbook}}
\DeclareOption{titlepage}{\PassOptionsToClass{titlepage}{srcbook}}
\DeclareOption{draft}{\@drafttrue}
\DeclareOption{final}{\@draftfalse}
\DeclareOption{math}{\@mathtrue}
\DeclareOption{nomath}{\@mathfalse}
\DeclareOption{fgerman}{\@germantrue}
\DeclareOption*{\ClassWarningNoLine{wissdipl}{Unknown option `\CurrentOption' specified for 'wissdipl' class}}
%\ExecuteOptions{a4paper,12pt,twoside,titlepage}
\ProcessOptions


%% start super class
\LoadClass{scrbook} % diese Klasse basiert auf ``scrbook''

%% german language package
\if@german
 \RequirePackage{ngerman}
 \RequirePackage[utf8]{fontenc}      % T1-encoded fonts: auch Wörter mit Umlauten trennen
\fi

\RequirePackage{ifthen}
\RequirePackage{ifpdf}

\RequirePackage{makeidx}          % wir wollen auch einen Index
\RequirePackage[a4paper]{geometry} % Seitenränder einstellen leichtgemacht

\RequirePackage[automark,nouppercase]{scrpage2}
\RequirePackage{scrhack}

\RequirePackage{etex}

% litrature package
\RequirePackage{natbib}

%wisspackage
\RequirePackage{wissplot}
\RequirePackage{wisscolor}
\RequirePackage{wisstap}

%algorithm and listings
\RequirePackage{listings}
\RequirePackage[linesnumbered,ruled]{algorithm2e} % writing pseudo algorithms

\RequirePackage{capt-of}

%glossar
\RequirePackage[
nonumberlist, %keine Seitenzahlen anzeig%%----- nun ngerman laden
acronym,      %ein Abkürzungsverzeichnis erstellen
toc,          %Einträge im Inhaltsverzeichnis
section]      %im Inhaltsverzeichnis auf section-Ebene erscheinen
{glossaries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF dependent stuff (inspired by Frank Pählke)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[bookmarks]{hyperref}

%PDF Settings
\definecolor{listingsbg}{rgb}{0.9,0.9,0.9}
\definecolor{darkblue}{rgb}{0,0,.5}

\RequirePackage{bookmark}[2007/02/20]

\RequirePackage{float} %for floatting point environemts %Das Paket \usepackage{float} ergänzt die Positionierungsangeben für bewegliche Objekte (h, t, p ...) um die Variante H, die die Positionierung am exakt selben Ort wie im tex-Skript erzwingt.

\RequirePackage{wissplot}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{comment}
\ifx\@draft

 \RequirePackage[draft=true,allpages=true,fontfamily=cmr,angle=90,scale=0.2,mark={\fboxsep=35pt\fboxrule=0pt\relax\fbox{-- DRAFT -- }},
 color=red!75!green!50,xcoord=-80,ycoord=-20]{draftmark}

 \newcommand{\Kommentar}[1]{{\em{#1}}}}
 \includecomment{dontshow}
 \newcommand{\noshow}[2]{#1=#2 \if@draft #2=#1 \fi #1=#2}

\else
 \newcommand{\Kommentar}[1]{}
 % Alles innerhalb von \Hide{} oder \ignore{}
 % wird von LaTeX komplett ignoriert (wie ein Kommentar)
 \newcommand{\Hide}[1]{}
 \let\ignore\Hide

 \excludecomment{dontshow}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	             Math
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@math
\RequirePackage{wissmath}
\fi

%% ---------------- end of usepackages -------------


\setcounter{secnumdepth}{3} % Numerierung auch für \subsubsection
\setcounter{tocdepth}{2}    % nimm auch \subsubsections ins Inhaltsverz. auf

%% Seitengröße mit geometry-Paket einstellen
\geometry{left=3cm,
	  right=3cm,
	  top=23mm,
	  bottom=25mm,
	  head=14.5pt}

%% Stil
\parindent 0cm                     % Absatzanfang wird nicht eingerückt
\parskip 1.5ex plus 0.5ex minus 0.5ex % Abstand zwischen zwei Absätzen

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Einstellungen für Kopf- und Fußzeile ändern %%%%%%
%% Ich lasse das mal drin, um zu zeigen, dass es auch damit funktioniert.
%% Es geht aber genauso auch ohne scrpage2.

\clearscrheadfoot% Löscht vorige Einstellungen für Kopf und Fuß
\pagestyle{scrheadings}% Neuer Seitenstil
\setheadsepline{.5pt}
\setfootsepline{.5pt}
\ihead{\headmark}% Kolumnentitel oben, innen:
                   % Kapitel auf geraden Seiten
                   % Abschnitt auf ungeraden Seiten
\ohead[\pagemark]{\pagemark}
%\ofoot[\pagemark]{\pagemark}% Seitenzahl center
\setheadsepline{0.4pt}% Linie unter Kopfzeile
\onehalfspacing

\newcommand{\settocdepth}[1]{\addtocontents{toc}{\protect\setcounter{tocdepth}{#1}}}

\AtBeginDocument{
  \renewcommand{\labelitemi}{\normalfont\bfseries{--}}
}
 % - Part Beginn - %
\makeatletter

\renewcommand\part{%\if@openright\cleardoublepage\else\clearpage\fi
  \newpage
  \thispagestyle{\partpagestyle}
  \if@twocolumn
  \onecolumn
   \@tempswatrue
  \else
   \@tempswafalse
  \fi
  \rule{1.0\textwidth}{1.0pt}\newline
  \vskip-\baselineskip\nobreak%
  \secdef\@part\@spart}

\renewcommand*{\@endpart}{\vbox to\z@{\use@preamble{part@u}\vss}%
  \rule{1.0\textwidth}{1.0pt}
  \partheadendvskip
  \partheademptypage
  \if@tempswa
   \twocolumn
  \fi
  \partheadendvskip
  \setcounter{chapter}{0}
}

\makeatother

% - chapter Beginn - %
\makeatletter
\renewcommand\chapter{\noindent\if@openright\hspace{0mm}\else\hspace{0mm}\fi
\newpage
  \thispagestyle{\chapterpagestyle}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\makeatother

%########################### setup float positioning ###########################
\renewcommand{\topfraction}{0.9}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.85}

%############################### override symbols ##############################
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

%############################## more abbreviations #############################
\newcommand{\defsec}[1]{\section{#1%
}\vspace{-3ex}}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Leere Seite ohne Seitennummer, wird aber gezaehlt
%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\blankpage}{% Leerseite ohne Seitennummer, nächste Seite rechts
 \clearpage{\pagestyle{empty}\cleardoublepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flattersatz rechts und Silbentrennung, Leerraum nach rechts maximal 1cm
%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand{\myraggedright}{%
 \let\\\@centercr\@rightskip 0pt plus 1cm
 \rightskip\@rightskip
  \leftskip\z@skip
  \parindent\z@
  \spaceskip=.3333em
  \xspaceskip=.5em}
\makeatother

\makeatletter
\newcommand{\mynewline}{%
 \@centercr\@rightskip 0pt plus 1cm
}
\makeatother

%make title functions
\makeatletter
\def\maketitle{
%\renewcommand{\@maketitle}{
%\newpage
     \thispagestyle{empty}%
      \ifx\@titlehead\@empty \else
        \begin{minipage}[t]{\textwidth}%
        \@titlehead
        \end{minipage}\par
      \fi
 \null
 \begin{center}%
   \underline{\hspace{15cm}}
	\vskip 3cm
  		{\LARGE \@title \par}%
	\vskip 3cm
   \underline{\hspace{15cm}}
   \vskip 3cm
	{\large%start author table
       \lineskip .5em%
       \begin{tabular}[t]{c}%
         \@author
       \end{tabular}\par}%
   \vskip 3cm
   {\large {Diplomarbeit} \par}%
   \vskip 3em
   {\large \@date \par}%
 \end{center}%
   \vfill
  \null
 % \cleardoublepage
\newpage
\par}
\makeatother

\newcommand{\cbox}[1]{\parbox[c][1.3cm]{3cm}{\centering{#1}}}
\newcommand{\cfbox}[1]{\fbox{\parbox[c][1.3cm]{3cm}{\centering{#1}}}}
\newcommand{\wcfbox}[1]{\fbox{\parbox[c][1.3cm]{9.7cm}{\centering{#1}}}}

\newcommand{\trans}[3]{{}^{#1}_{#2}\hspace{-0.1em}#3\hspace{0.0em}}

\newcommand{\TODO}[1]{*\marginpar{* TODO: #1}}
\newcommand{\translate}[1]{{\bf \large #1\TODO{Translate #1}}}

%% **** END OF CLASS ****
