\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucsc}[2022/03/31 Thesis template for UCSC]

\newif\ifudraft
\udraftfalse
\DeclareOption{udraft}{\udrafttrue}
\ProcessOptions\relax

\LoadClass[12pt]{report}

\RequirePackage[
    a4paper,
    left= \ifudraft 25mm \else 37mm \fi,
    top=25mm,
    right=25mm,
    bottom=25mm,
]{geometry} % Sets margins and page size
\RequirePackage{graphicx, xcolor}
\RequirePackage{titlesec}
\RequirePackage{inputenc}
\RequirePackage{subcaption}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{hyperref}
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts} 
\RequirePackage[
backend=biber,
style=ieee,
]{biblatex}
\RequirePackage{lscape}
\RequirePackage{afterpage}
\RequirePackage[]{todonotes}
\RequirePackage{listings}
\RequirePackage{acronym}
\RequirePackage[toc]{appendix}

% Font
% Calibri only works with LuaLaTex or XeLaTex. 
% If you're using pdfLaTex, just comment out following.
% \RequirePackage{fontspec}
% \setmainfont[Path=fonts/,
%     BoldItalicFont=calibri-bold-italic.ttf,
%     BoldFont=calibri-bold.ttf,
%     ItalicFont=calibri-italic.ttf
% ]{calibri-regular.ttf}

% Chapter title styles
\makeatletter
\def\ttl@mkchap@i#1#2#3#4#5#6#7{%
    \ttl@assign\@tempskipa#3\relax\beforetitleunit
    \vspace{\@tempskipa}%<<<<<< REMOVE THE * AFTER \vspace
    \global\@afterindenttrue
    \ifcase#5 \global\@afterindentfalse\fi
    \ttl@assign\@tempskipb#4\relax\aftertitleunit
    \ttl@topmode{\@tempskipb}{%
        \ttl@select{#6}{#1}{#2}{#7}}%
    \ttl@finmarks  % Outside the box!
    \@ifundefined{ttlp@#6}{}{\ttlp@write{#6}}}
\makeatother
\titleformat{\chapter}
  {\normalfont\fontsize{24pt}{0pt}\selectfont\bfseries}
  {\chaptertitlename\ \thechapter \;-}{10pt}{\huge}
\titlespacing{\chapter}{0pt}{0pt}{18pt}

% Section title styles
\titleformat{\section}
  {\fontsize{16pt}{19.2pt}\selectfont\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
  {\fontsize{14pt}{16.8pt}\selectfont\bfseries}{\thesubsection}{0.5em}{}
  
\titleformat{\subsubsection}
  {\fontsize{12pt}{14.4pt}\selectfont\bfseries}{\thesubsubsection}{0.5em}{}

% Paragraph styles
\ifudraft
    \linespread{1}
\else
    \linespread{1.5}
\fi

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

% Lists
\RequirePackage{enumitem}
\setlist{itemsep=0pt,topsep=0pt,parsep=0pt,partopsep=0pt}

% Tables
\RequirePackage{etoolbox}
\AtBeginEnvironment{tabular}{\fontsize{11pt}{13.2pt}\selectfont}

% Math
\newtheorem{definition}{Definition}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Parameter:}}
