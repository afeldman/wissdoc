%% LaTeX2e Formatklasse für Diplom-, Studien- oder Doktorarbeit    -*-Mode: LaTeX;-*-
%% Autor: Anton Feldmann anton.feldmann@gmail.com
%% --
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01] % Basis Latex2e
\ProvidesClass{wissdoc}[2011/05/30 Anton Feldmann - Wissenschaftliches Dokument]

\LoadClass[a4paper,12pt,twoside,titlepage,toc=flat]{scrbook} % diese Klasse basiert auf ``scrbook''

\RequirePackage[automark,nouppercase]{scrpage2}
\RequirePackage{scrhack}

\usepackage{etex}

\RequirePackage{ifthen}
\RequirePackage{ifpdf}

\RequirePackage{makeidx}          % wir wollen auch einen Index
\RequirePackage[a4paper]{geometry} % Seitenränder einstellen leichtgemacht

% usepackages for mathamtics
\RequirePackage{amscd}
\RequirePackage{bbm}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{shadethm}
\RequirePackage{amsthm}

% litrature package
\RequirePackage{natbib}


% drawings package
\RequirePackage{color}
\RequirePackage{xcolor}
\RequirePackage{framed}
\RequirePackage{colortbl}
\RequirePackage{listings}
\RequirePackage{epsfig}
\RequirePackage{xy}
\RequirePackage{graphicx}  % um Graphiken einzubinden
%%drawings packages pdf/ps
\ifpdf
  \RequirePackage{pst-pdf}
\else
  \RequirePackage{pst-all}
\fi

\RequirePackage{setspace}
\RequirePackage{lscape}		% landscape picture
\RequirePackage{longtable}     	% seiten{\"u}bergreifende Tabellen
\RequirePackage{tabularx} 		% automatische Spaltenbreite
\RequirePackage{supertabular} 	% mehrseitige tabellen
\RequirePackage{array}          	% fuer aufwändigere Tabellen
\RequirePackage{listings}
\RequirePackage[linesnumbered,ruled]{algorithm2e} % writing pseudo algorithms

\RequirePackage{capt-of}

% Use this form to include EPS (latex) or PDF (pdflatex) files:
\RequirePackage{leftidx}

%glossar
\usepackage[
nonumberlist, %keine Seitenzahlen anzeig%%----- nun ngerman laden
acronym,      %ein Abkürzungsverzeichnis erstellen
toc,          %Einträge im Inhaltsverzeichnis
section]      %im Inhaltsverzeichnis auf section-Ebene erscheinen
{glossaries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF dependent stuff (inspired by Frank Pählke)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[dvips,
		latex2html,
		ps2pdf,
		bookmarks]{hyperref}

\RequirePackage{bookmark}[2007/02/20]

\RequirePackage{float} %for floatting point environemts %Das Paket \usepackage{float} ergänzt die Positionierungsangeben für bewegliche Objekte (h, t, p ...) um die Variante H, die die Positionierung am exakt selben Ort wie im tex-Skript erzwingt.


% Schriftart
\usepackage{times}
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

%% Schusterjungen und Hurenkinder verhindern.
%% Siehe deutsches TeX-FAQ (6.1.3)
\RequirePackage{schuster}

%% ---------------- end of usepackages -------------

%german Option 
%\newif\ifuseGerman\useGerman
%\DeclareOption{usegerman}{\@useGerman}
%%----- nun ngerman laden
%\ifuseGerman\RequirePackage{ngerman}\fi
%\RequirePackage{ngerman}[1998/07/08] % (V2.5e) Neue Rechtschreibung!
%\usepackage[T1]{fontenc}      % T1-encoded fonts: auch Wörter mit Umlauten trennen


\setcounter{secnumdepth}{3} % Numerierung auch für \subsubsection
\setcounter{tocdepth}{3}    % nimm auch \subsubsections ins Inhaltsverz. auf

%% New Commands
\newcommand{\ifnotdraft}[1]{\ifx\@draft\@undefined #1 \fi}
\newcommand{\ifnotdraftelse}[2]{\ifx\@draft\@undefined #1 \else #2 \fi}

%% Seitengröße mit geometry-Paket einstellen
\geometry{left=3cm,right=3cm,top=23mm,bottom=25mm,head=14.5pt}

%% Stil
\parindent 0cm                     % Absatzanfang wird nicht eingerückt
\parskip1.5ex plus0.5ex minus0.5ex % Abstand zwischen zwei Absätzen

% \newcommand{\headfont}{\fontfamily{ppl}\selectfont}
% \newcommand{\headfont}{\sffamily}
% \newcommand{\headfont}{\slshape}
% \newcommand{\captionfont}{}
% \newcommand{\chapterheadfont}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geaenderte Headings:
%% Seitenzahl normal, Text in slanted und nicht in Grossbuchstaben
%%
%------Linien------
\setheadsepline{.5pt}
\setfootsepline{.5pt}
\pagestyle{scrheadings}


 % - Part Beginn - %
% \newcommand\TeilnummerAusgeschrieben{% Wird übergeben an \partformat, sodass es zB "Erster Teil" heißt.
%                                             \ifthenelse{\value{part}=1}{first}{%
%                                             \ifthenelse{\value{part}=2}{second}{%
%                                             \ifthenelse{\value{part}=3}{third}{%
%                                             \ifthenelse{\value{part}=4}{fourth}{%
%                                             \ifthenelse{\value{part}=5}{fifth}{%
%                                             \ifthenelse{\value{part}=6}{sixth}{%
%                                           {\typeout{to much}}}}}}}}}
% \renewcommand*{\partformat}{\fontsize{15pt}{\topskip}\selectfont\TeilnummerAusgeschrieben~\partname:\enskip} %im Vgl. zu KOMA Klasse autodot entfernt und Darstellung geändert. Es heißt jetzt zB "Erster Teil".
% \addtokomafont{part}{\fontsize{15pt}{\topskip}\selectfont}   %Schriftgröße Part-Überschrift
% \let\partheadmidvskip\relax  %\partheadmidvskip "geleert", damit alles in einer Zeile erscheint.
% \let\partheademptypage\relax %\partheademptypage geleert, damit nach der Titelüberschrift keine Leerseite eingefügt wird
% \renewcommand{\raggedpart}{\raggedright}   %Teileüberschrift linksbündig statt zentriert
% \renewcommand*{\partheadstartvskip}{%  
% \vspace{0pt}}% 
% \renewcommand*{\partheadendvskip}{%       
% \vspace{0pt}} 
% \setkomafont{partentry}{\usekomafont{disposition}}
 
% \makeatletter
%   \let\@endpart
% \makeatother
% \makeatletter
% \let\partbackup\l@part
% \renewcommand*\l@part[2]{\partbackup{#1}{}}
% \makeatother
% \makeatletter
% \renewcommand*\l@part{\@dottedtocline{-1}{0em}{5em}}
% \makeatother


%############################## Header and footer ##############################
% class scrbook
\pagestyle{scrheadings}
%\ifoot[\tiny\RCSId\\\tiny ]{\tiny\RCSId\\\tiny} 
\ifoot[]{} 
\ofoot[]{}
\cfoot[\pagemark]{\pagemark}

\ifnum 0 = 1
\newcommand{\HAVEVRMLTOEPS}[1]{#1}
\else
\newcommand{\HAVEVRMLTOEPS}[1]{}
\fi
%
\newcolumntype{d}[1]{D{.}{.}{#1}}

\renewcommand{\caplabelfont}{\normalfont\bfseries}
\setcapindent{0em}
\setcounter{secnumdepth}{3}
\setlength\parskip{\medskipamount}
\setlength\parindent{0pt}
\onehalfspacing
%
%\newcommand{\settocdepth}[1]{\addtocontents{toc}{\protect\setcounter{tocdepth}{#1}}}

\AtBeginDocument{
  \renewcommand{\labelitemi}{\normalfont\bfseries{--}}
}

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

\newcommand{\rD}{3D}
\newcommand{\wD}{2D}

\newcommand{\wrt}{with respect to}
\renewcommand{\th}{$^{\textrm{th}}$ }
\newcommand{\wolog}{without loss of generality}
\newcommand{\Wolog}{Without loss of generality}

\newcommand{\DT}[1]{\mathrm{DT}\nbrack{#1}}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Math environemts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%
% Kommentare 
%%%%%%%%%%%%%%%%%%%%%%%
\ifnotdraftelse{
\newcommand{\Kommentar}[1]{}
}{\newcommand{\Kommentar}[1]{{\em #1}}}
% Alles innerhalb von \Hide{} oder \ignore{} 
% wird von LaTeX komplett ignoriert (wie ein Kommentar)
\newcommand{\Hide}[1]{}
\let\ignore\Hide

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
\caption{#3} %
\label{#2} %
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
\caption{#5}%
\label{#4}%
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
\caption{#5}%
\label{#4}%
\end{center}
\end{figure}%
}
\let\Abbpf\Abbildungpf

%% **** END OF CLASS ****
