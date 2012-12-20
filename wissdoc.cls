%% LaTeX2e Formatklasse für Diplom-, Studien- oder Doktorarbeit    -*-Mode: LaTeX;-*-
%%
%% Copyright (C) 2012 anton Feldmann
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
\ProvidesClass{wissdoc}[2012/10/25 Anton Feldmann - Wissenschaftliches Dokument]

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
\DeclareOption*{\ClassWarningNoLine{wissdoc}{Unknown option `\CurrentOption' specified for 'wissdoc' class}}
%\ExecuteOptions{a4paper,12pt,twoside,titlepage}
\ProcessOptions


%% start super class
\LoadClass[toc=flat]{scrbook} % diese Klasse basiert auf ``scrbook''


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

% drawings package
\RequirePackage{color}
\RequirePackage{xcolor}
\RequirePackage{framed}
\RequirePackage{colortbl}
\RequirePackage{listings}
\RequirePackage{epsfig,wrapfig}
\RequirePackage{graphicx}  % um Graphiken einzubinden
\RequirePackage{setspace}
\RequirePackage{lscape}		% landscape picture
\RequirePackage{longtable}     	% seiten{\"u}bergreifende Tabellen
\RequirePackage{tabularx} 		% automatische Spaltenbreite
\RequirePackage{supertabular} 	% mehrseitige tabellen
\RequirePackage{array}          	% fuer aufwändigere Tabellen
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

\hypersetup{
      pdftoolbar=true,        % show Acrobat’s toolbar?
      pdfmenubar=true,        % show Acrobat’s menu?
      pdffitwindow=true,      % window fit to page when opened
      pdfstartview={Fit},     % fits the width of the page to the window
      pdftitle={Robust and Accurate Self Calibration of Stereo Camera Systems},    % title
      pdfauthor={Anton Feldmann},     % author
      pdfsubject={Accurate Calibration},   % subject of the document
      pdfcreator={LiveTex},   % creator of the document
      pdfproducer={Anton Feldmann}, % producer of the document
      pdfkeywords={epipolar geometrie, bundel adjustement, prediction bands}, % list of keywords
      pdfnewwindow=true,      % links in new window
      pdfborder={0 0 0.5},
      colorlinks=true,        % false: boxed links; true: colored links
      linkcolor=darkblue,     % color of internal links
      citecolor=blue,         % color of links to bibliography
      filecolor=magenta,      % color of file links
      urlcolor=darkblue,
      unicode=true,           % non-Latin characters in Acrobat’s bookmarks
      breaklinks=true,
      menucolor=darkblue,
      plainpages=false,       % correct hyperlinks
      bookmarksopen=true,
      bookmarksnumbered=true,
      raiselinks=true,%
}

\RequirePackage{bookmark}[2007/02/20]

\RequirePackage{float} %for floatting point environemts %Das Paket \usepackage{float} ergänzt die Positionierungsangeben für bewegliche Objekte (h, t, p ...) um die Variante H, die die Positionierung am exakt selben Ort wie im tex-Skript erzwingt.


% Schriftart
\RequirePackage{times}
%\usepackage{palatino}
%\usepackage{newcent}      %for sophisticated font style
%\usepackage{helvet}
%\renewcommand{\familydefault}{\sfdefault}
%\usepackage{courier} \raggedright
%\renewcommand{\familydefault}{\ttdefault}

%Danach muss man die Standardschriftart setzen mit dem Befehl \fontfamily{abr}\selectfont, der für das gesamte restliche Dokument gilt, oder mit {\fontfamily{abr}\selectfont Some Text} um nur den eingeklammerten Bereich zu betreffen. abr ist die Abkürzung für die Schriftart. Die häufigsten sind ptm (Times), phv (Helvetica), pcr (Courier), pbk (Bookman), pag (Avant Garde), ppl (Palatino), bch (Charter), pnc (New Century Schoolbook), pzc (Zapf Chancery), put (Utopia ).

% mathfonts
%\usepackage{mathpazo}
%\usepackage{euler}
%\usepackage{cmbright}
%\usepackage{ccfonts,eulervm}
%\usepackage[math]{iwona}
%\usepackage[math]{kurier}
%\usepackage{kmath,kerkis}
%\usepackage{millennial}
%\usepackage{fouriernc}
%\usepackage{pxfonts}
%\usepackage{mathpple}
%\usepackage{arev}
%\usepackage[charter]{mathdesign}
%\usepackage{comicsans}
%\usepackage[garamond]{mathdesign}
%\usepackage{fourier}

%\usepackage[T1]{fontenc}

% other interesting packages:
\RequirePackage{varioref}
\RequirePackage{verbatim}
\RequirePackage{subfigure}
\RequirePackage{shadow} % für schattierte Boxen etc.
\RequirePackage{placeins}

%%% PSTricks for PDFLatex
%%drawings packages pdf/ps
\ifpdf
  \RequirePackage{pstricks}
%   \RequirePackage[dvips={-o -Ppdf},
% 	      pspdf={-dAutoRotatePages=/None},
% 	      pdfcrop={},
% 	      cleanup={log,aux,dvi,ps,pdf},
% 	      latex={-interaction=nonstopmode},
% 	      final]{auto-pst-pdf}%set "-shell-escape in pdflatex options"
  \RequirePackage{pst-pdf}
\else
  \RequirePackage{pstricks}
\fi

%% Schusterjungen und Hurenkinder verhindern.
%% Siehe deutsches TeX-FAQ (6.1.3)
\clubpenalty = 10000% Disable single lines at the start of a paragraph (Schusterjungen)
\widowpenalty = 10000 \displaywidowpenalty = 10000% Disable single lines at the end of a paragraph (Hurenkinder)

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
 \typeout{***** **** **** **** ****}
 \typeout{***** use math ****}
 \typeout{***** start read packages ****}

 \RequirePackage{bbm,amsfonts,amsmath,amscd,amssymb,shadethm,amsthm} %ams math bib
 \RequirePackage[all,color]{xy}

 \typeout{***** setup enviroments ****}
 \newshadetheorem{thms}{Theorem}[chapter]
 \newshadetheorem{definitions}{Definition}[chapter]
 \newshadetheorem{cors}{Corollar}[chapter]
 \newshadetheorem{zuss}{Sammary}[chapter]
 \newshadetheorem{axioms}{Axiom}[chapter]
 \newshadetheorem{profs}{Proof}[chapter]

\makeatletter
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{#1}}
\makeatother

\newenvironment{prof}[1][]{%
  \definecolor{shadethmcolor}{rgb}{1.,1.,1.}%{.9,.9,.95}%
  \definecolor{shaderulecolor}{rgb}{0.0,0.0,0.0}%
  %\setlength{\shadeboxrule}{1.5pt}%
  \begin{profs}[#1]\hspace*{1mm}%
}{{\hfill\qed\vspace{1ex}}\end{profs}}

\newenvironment{thm}[1][]{%
  \definecolor{shadethmcolor}{rgb}{1.0,1.0,1.0}%{.9,.9,.95}%
  \definecolor{shaderulecolor}{rgb}{0.0,0.0,0.0}%
  \setlength{\shadeboxrule}{1.5pt}%
  \begin{thms}[#1]\hspace*{1mm}%
}{\end{thms}}

\newenvironment{definition}[1][]{%
  \definecolor{shadethmcolor}{rgb}{1.0,1.0,10.}%
%  \definecolor{shadethmcolor}{rgb}{1.,1.,1.}%
  \definecolor{shaderulecolor}{rgb}{0.0,0.0,0.0}%
  \setlength{\shadeboxrule}{1.5pt}%
  \begin{definitions}[#1]\hspace*{1mm}%
}{\end{definitions}}

\newenvironment{corr}[1][]{%
  \definecolor{shadethmcolor}{rgb}{1.0,1.0,1.0}%
  \definecolor{shaderulecolor}{rgb}{0.0,0.0,0.0}%
  \setlength{\shadeboxrule}{1.5pt}%
  \begin{cors}[#1]\hspace*{1mm}%
}{\end{cors}}

\newenvironment{summary}[1][]{%
  \definecolor{shadethmcolor}{rgb}{1.0,1.0,1.0}%
  \definecolor{shaderulecolor}{rgb}{0.0,0.0,0.0}%
  \setlength{\shadeboxrule}{1.5pt}%
  \begin{zuss}[#1]\hspace*{1mm}%
}{\end{zuss}}

\newenvironment{axiom}[1][]{%
  \definecolor{shadethmcolor}{rgb}{1.0,1.0,1.0}%
  \definecolor{shaderulecolor}{rgb}{0.0,0.0,0.0}%
  \setlength{\shadeboxrule}{1.5pt}%
  \begin{axioms}[#1]\hspace*{1mm}%
}{\end{axioms}}

 \typeout{ make ensuremath function to ensure mathmode}
 \newcommand{\emath}[1]{\ensuremath{{#1}}\xspace}

 \newcommand{\DT}[1]{\emath{\mathrm{DT}\nbrack{#1}}}
 \newcommand{\rD}{\emath{\textrm{3D}}}
 \newcommand{\wD}{\emath{\textrm{2D}}}
 \renewcommand{\th}{\emath{^{\textrm{th}}}}

 % Number of cameras
 \newcommand{\Nc}{\emath{N_c}}

 % Number of DoFs
 \newcommand{\Nd}{\emath{N_d}}

 % Number of detected image features
 \newcommand{\Nf}{\emath{N_f}}

 % Number of edge orientations
 \newcommand{\No}{\emath{N_o}}

 % Point in camera coordinates
 \newcommand{\camPt}{\emath{\vec{P}}}
 \newcommand{\camPti}[1]{\emath{\vec{P}_{#1}}}

 % Measured point in camera coordinates
 \newcommand{\msdCamPt}{\emath{\tilde{\vec{P}}}}

 % Point in image coordinates
 \newcommand{\imgPt}{\emath{\vec{p}}}
 \newcommand{\imgPti}[1]{\emath{\vec{p}_{#1}}}

 % Measured point in image coordinates
 \newcommand{\msdPt}{\emath{\tilde{\vec{p}}}}
 \newcommand{\msdPti}[1]{\emath{\tilde{\vec{p}}_{#1}}}

 % Optimisation result
 \newcommand{\optRes}{\emath{\tilde{\vec{\Phi}}}}

 % Optimisation parameter
 \newcommand{\optPrm}{\emath{\vec{\Phi}}}
 \newcommand{\optPrmi}[1]{\emath{\vec{\Phi}^{#1}}}

 % Quantised optimisation parameter
 \newcommand{\optQnt}{\emath{\lfloor\optPrm\rfloor}}
 \newcommand{\optQnti}[1]{\emath{{\lfloor\optPrm\rfloor}^{#1}}}

 % Camera parameter
 \newcommand{\camPrm}{\emath{\kappa}}

 % Estimated camera parameter
 \newcommand{\camCal}{\emath{\tilde{\kappa}}}

 % Pose
 \newcommand{\pose}{\emat{\vec{\Phi}}}
 \newcommand{\poseCmp}[1]{\emath{\Phi_{#1}}}

 % Model
 \newcommand{\model}{\emath{\mathcal{M}}}

 % Template
 \newcommand{\templ}{T}

 % Template set
 \newcommand{\templSet}{\emath{\mathcal{T}}}

 % Lattice limits
 \newcommand{\latMin}{\emath{\underline{\vec{\Lambda}}}}
 \newcommand{\latMini}[1]{\emath{\underline{\Lambda}_{#1}}}
 \newcommand{\latMax}{\emath{\overline{\vec{\Lambda}}}}
 \newcommand{\latMaxi}[1]{\emath{\overline{\Lambda}_{#1}}}

 % CCD density parameters
 \newcommand{\ccdMu}{\emath{{\vec{\mu}}_{\optPrm}}}
 \newcommand{\ccdSigma}{\emath{{\mat{\Sigma}}_{\optPrm}}}
 \newcommand{\ccdMuPrior}{\emath{\vec{\mu}_{\optPrm}^{0}}}
 \newcommand{\ccdSigmaPrior}{\emath{\mat{\Sigma}_{\optPrm}^{0}}}

 % CCD curve normal
 \newcommand{\ccdNs}{\emath{\vec{n}_s}}

 \newcommand{\partialdiff}[2]{\emath{\frac{\partial {#1}}{\partial {#2}}}}

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Gauß-Klammern
 %%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\ceil}[1]{\emath{\lceil{#1}\rceil}}
 \newcommand{\floor}[1]{\emath{\lfloor{#1}\rfloor}}

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Average Operator (analog zu min, max)
 %%%%%%%%%%%%%%%%%%%%%%%%%%
 \def\avg{\emath{\mathop{\mathgroup\symoperators avg}}}

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tools %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\rowvector}[2]{%
   \emath{\begin{pmatrix}#1\\#2\end{pmatrix}}
 }
 \newcommand{\rowvectorT}[2]{\emath{\left(#1,#2\right)^t}}

 \newcommand{\rowvectorthree}[3]{\emath{\begin{pmatrix}#1\\#2\\#3\end{pmatrix}}}
 \newcommand{\rowvectorthreeT}[3]{\emath{\left( #1 #2 #3\right)^t}}

 \newcommand{\rowvectorfour}[4]{\emath{\begin{pmatrix}#1\\#2\\#3\\#4\end{pmatrix}}}

 % Scalar product
 \newcommand{\scp}[2]{\emath{\left<#1,#2\right>}}

 \newcommand{\minop}[2]{\emath{\mathop{\mathrm{#1}}\limits_{#2}\},}}

 \newcommand{\sgn}[1]{\emath{\mathop{\mathrm{sgn}{#1}}}}
 \newcommand{\argmin}[1]{\emath{\minop{arg min}{#1}}}
 \newcommand{\minn}[1]{\emath{\minop{min}{#1}}}
 \newcommand{\maxx}[1]{\emath{\minop{max}{#1}}}
 \newcommand{\maxquant}[1]{\emath{\minop{max quant}{#1}}}

 \newcommand{\df}[2]{\emath{{\frac{\partial{}{#1}}{\partial{}{#2}}}}}
 \newcommand{\dR}[2]{\emath{\df{\trans{#1}{#2}{R}}{\trans{#1}{#2}{\omega}}}}

 \newcommand{\nbrack}[1]{\emath{\left(#1\right)}}
 \newcommand{\sbrack}[1]{\emath{\left[#1\right]}}
 \newcommand{\cbrack}[1]{\emath{\left\{#1\right\}}}
 \newcommand{\abrack}[1]{\emath{\left<#1\right>}}

 \typeout{ mathsymbols }
 \newcommand{\degree}{\emath{^{\circ}}}
 \newcommand{\reel}{\in\mathbbm{R} }
 \newcommand{\reelt}{\in\mathbbm{R}^{3\times 3} }
 \newcommand{\reeltu}[1]{\in\mathbbm{R}^{3\times 3}_{#1} }
 \newcommand{\reeln}[1]{\in\mathbbm{R}^{#1} }
 \newcommand{\compln}[1]{\in\mathbbm{C}^{#1} }

 \newcommand{\reeldimn}[1]{\emath{\mathbbm{R}^{#1}}}
 \newcommand{\compldimn}[1]{\emath{\mathbbm{C}^{#1}}}

 \newcommand{\ident}{\emath{\mathbb{1}}}

 \newcommand{\La}{\emath{\mathcal{L}^1}}
 \newcommand{\Lb}{\emath{\mathcal{L}^2}}

 \newcommand{\landau}[1]{\emath{\mathcal{O}(#1)}}%landau

 % Evaluate #1 at position #2
 \newcommand{\atpos}[2]{\emath{\left.{#1}\right|_{#2}}}

 \typeout{ tools }
 \newcommand{\mat}[1]{\emath{\vec{#1}}}

 %%%%%%%%%%%%%%%%%%% rotation matrix
 \newcommand{\rotmat}{\emath{\begin{bmatrix}
       \cos{\alpha}\cos{\beta} & \cos{\alpha}\sin{\beta}\sin{\gamma}-\sin{\alpha}\cos{\gamma} & \cos{\alpha}\sin{\beta}\cos{\gamma}+\sin{\alpha}\sin{\gamma}\\
       \sin{\alpha}\cos{\beta} & \sin{\alpha}\sin{\beta}\sin{\gamma}+\cos{\alpha}\cos{\gamma} & \sin{\alpha}\sin{\beta}\cos{\gamma}-\cos{\alpha}\sin{\gamma}\\
       -\sin{\beta} & \cos{\beta}\sin{\gamma} & \cos{\beta}\cos{\gamma}
     \end{bmatrix}}}

%
%%left indeces
%

 \newcommand\leftidx[3]{%
   {\vphantom{#2}}#1#2#3%
 }
 \newcommand{\ltrans}[1]{\leftidx{^\mathrm{t}}{\!#1}{}}


% Consistent index scheme: top left: Tgt coordinate system, bottom left: src
% coordinate system, bottom right: point index
 \newcommand{\idx}[4]{{}^{#2}_{#3}\hspace{-0.1em}#1_{#4}}

 \typeout{**** End Math Environemt **** }
 \typeout{***** **** **** **** ****}
\fi

%% ---------------- end of usepackages -------------

\setcounter{secnumdepth}{3} % Numerierung auch für \subsubsection
\setcounter{tocdepth}{3}    % nimm auch \subsubsections ins Inhaltsverz. auf

%% Seitengröße mit geometry-Paket einstellen
\geometry{left=3cm,
	  right=3cm,
	  top=23mm,
	  bottom=25mm,
	  head=14.5pt}

%% Stil
\parindent 0cm                     % Absatzanfang wird nicht eingerückt
\parskip 1.5ex plus 0.5ex minus 0.5ex % Abstand zwischen zwei Absätzen

% \newcommand{\headfont}{\fontfamily{ppl}\selectfont}
% \newcommand{\headfont}{\sffamily}
% \newcommand{\headfont}{\slshape}
% \newcommand{\captionfont}{}
% \newcommand{\chapterheadfont}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Einstellungen für Kopf- und Fußzeile ändern %%%%%%
%% Ich lasse das mal drin, um zu zeigen, dass es auch damit funktioniert.
%% Es geht aber genauso auch ohne scrpage2.
%\RequirePackage{scrpage2}

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

\newcommand{\Mo}{Multiocular}
\newcommand{\mo}{multiocular}

\newcommand{\defref}[1]{Def.~\ref{#1}}
\newcommand{\partref}[1]{Part~\ref{#1}}
\newcommand{\chpref}[1]{Chap.~\ref{#1}}
\newcommand{\secref}[1]{Sec.~\ref{#1}}
\newcommand{\equref}[1]{Eq.~\eqref{#1}}
\newcommand{\figref}[1]{Fig.~\ref{#1}}
\newcommand{\tabref}[1]{Table~\ref{#1}}
\newcommand{\algoref}[1]{Algorithm~\ref{#1}}
\newcommand{\appref}[1]{Appendix~\ref{#1}}

\newcommand{\wrt}{with respect to}
\newcommand{\wolog}{without loss of generality}

% Segment subfigure
\newcommand{\segsf}[3]{\subfigure[#1\label{#2}]{%
\begin{tabular}{c}%
\includegraphics[width=0.44\columnwidth]{#3}%
\end{tabular}%
}}

%================= Add a shaded background to floating figures =================
\makeatletter
\newenvironment{myfloatingfigure}[2][v]%
{\@tfor \@tempa :=#1\do
         {\if\@tempa r\global\oddpagestrue\fi
          \if\@tempa l\global\oddpagesfalse\fi
          \if\@tempa p%
              \ifodd\c@page\global\oddpagestrue
                \else\global\oddpagesfalse\fi
          \fi
          \if\@tempa v%
             \ifnum\theOptionTest=0
                 \ifodd\c@page\global\oddpagestrue
                   \else\global\oddpagesfalse\fi
             \else
                  \ifodd\theOptionTest\global\oddpagestrue
                    \else\global\oddpagesfalse\fi
             \fi
          \fi
         }
 \expandafter\ifx\csname oldoutput\endcsname\relax% ref. TeXbook Ex.7.7
    \PackageError{floatflt}{The `floatflt' package is not initialized}
     {Try to reinstall the `floatflt' package.\MessageBreak
      Type `x' to quit or <Return> to try to go on.}\@@end\fi
 \global\everypar={\tryfig\oldeverypar}% must be set globally!
 \global\advance\ffigcount by 1
 \iffigprocessing
    {\count0=\ffigcount\advance\count0 by -1
     \PackageWarningNoLine{floatflt}{Floating figures \the\count0\space%
       \space and \the\ffigcount\space colliding}%
    }%
 \fi
 \iftabprocessing \PackageWarningNoLine{floatflt}{Floating figure %
   \the\ffigcount\space and floating table \the\ftabcount\space colliding}
 \fi
 \def\@captype{figure}
 \global\setlength{\floatfltwidth}{#2}
 \global\figprocessingtrue
 \setbox2=\vbox\bgroup% begin of figbox
                               \hrule height 0pt width #2 depth 0pt%
                               \hsize=#2%

}
{
\egroup
\global\setbox\figbox=\hbox{\colorbox[gray]{0.95}{\box2}}%
\figinsert\par%
}
\makeatother


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

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tabellenspaltentypen (benoetigt colortbl)
%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\PBS}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{y}{>{\PBS{\raggedright\hspace{0pt}}}p{1.35cm}}
\newcolumntype{z}{>{\PBS{\raggedright\hspace{0pt}}}p{2.5cm}}
\newcolumntype{q}{>{\PBS{\raggedright\hspace{0pt}}}p{6.5cm}}
\newcolumntype{g}{>{\columncolor[gray]{0.8}}c} % Grau
\newcolumntype{G}{>{\columncolor[gray]{0.9}}c} % helleres Grau

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tiefstellen von Text
%%%%%%%%%%%%%%%%%%%%%%%%%%
% S\tl{0} setzt die 0 unter das S (ohne Mathemodus!)
% zum Hochstellen gibt es uebrigens \textsuperscript
\makeatletter
\DeclareRobustCommand*\textlowerscript[1]{%
  \@textlowerscript{\selectfont#1}}
\def\@textlowerscript#1{%
  {\m@th\ensuremath{_{\mbox{\fontsize\sf@size\z@#1}}}}}
\let\tl\textlowerscript
\let\ts\textsuperscript
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Einbinden von Graphiken
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% global scaling factor
\def\gsf{0.9}
%% Graphik,
%% 3 Argumente: Datei, Label, Unterschrift
\newcommand{\Abbildung}[3]{%
	\begin{figure}[tbh] %
	\centerline{\scalebox{\gsf}{\includegraphics*{#1}}} %
	\caption{#2} %
	\label{#3} %
	\end{figure} %
}
\let\Abb\Abbildung

%% Abbps
%% Graphik, skaliert, Angabe der Position
%% 5 Argumente: Position, Breite (0 bis 1.0), Datei, Label, Unterschrift
\newcommand{\Abbildungps}[5]{%
	\begin{figure}[#1]%
	\begin{center}
	\scalebox{\gsf}{\includegraphics*[width=#2\textwidth]{#3}}%
	\caption{#4}%
	\label{#5}%
	\end{center}
	\end{figure}%
}
\let\Abbps\Abbildungps

%% Graphik, Angabe der Position, frei wählbares Argument für includegraphics
%% 5 Argumente: Position, Optionen, Datei, Label, Unterschrift
\newcommand{\Abbildungpf}[5]{%
\begin{figure}[#1]%
\begin{center}
\scalebox{\gsf}{\includegraphics*[#2]{#3}}%
\caption{#4}%
\label{#5}%
\end{center}
\end{figure}%
}
\let\Abbpf\Abbildungpf

%% include Graphic with fixed size,
%% @param Position
%% @param path to file
%% @param Label
%% @param text
\newcommand{\Abbildungfps}[4]{%
	\begin{figure}[#1]%
	\begin{center}
	\scalebox{\gsf}{\includegraphics*[width=1.0\textwidth]{#2}}%
	\caption{#3}%
	\label{#4}%
	\end{center}
	\end{figure}%
}
\let\Abbps\Abbildungfps

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
   {\large {Dissertation} \par}%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wortabkürzungen
%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\eg{e.\,g.\ } %z.B. 'exempli gratia'
\def\zb{e.\,g.\ }
\def\ie{i.\,e.\ } %d.h. id est'
\def\vi{vide\,infra\ }%siehe unten
\def\su{vide\,infra\ }%siehe unten


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Index
%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\indexen}[1]{\index{\MakeLowercase{#1}} \textit{#1}}%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Glossar
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\glos}[2]{\gls{#1} #2}


%% **** END OF CLASS ****
