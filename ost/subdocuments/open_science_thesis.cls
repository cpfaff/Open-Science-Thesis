%%------------------------------------------------------------------------------------%%
%%------------------------------------------------------------------------------------%%
%% Content : Open-Science-Thesis LateX-Class 
%% Use : Open-Sciene-Thesis formatting 
%% Author : Claas-Thido Pfaff
%%------------------------------------------------------------------------------------%%
%%------------------------------------------------------------------------------------%%

%%%-------------------------------------------------%%%
%%% Class requires format %%%
%%%-------------------------------------------------%%%

\NeedsTeXFormat{LaTeX2e}

%%%-------------------------------------------------%%%
%%% Provides class. Load options from class call %%%
%%%-------------------------------------------------%%%

\ProvidesClass{open-science-thesis}[2013/04/14 version 0.1 LaTeX class of the Open-Science-Thesis]

\RequirePackage{xkeyval} 

\define@boolkey[KV]{open-science-thesis}[ost@]{linenumbers}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{color}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{print}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{gitinfo}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{autolayout}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{twosidelayout}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{reversepagelayout}[false]{}  
\define@boolkey[KV]{open-science-thesis}[ost@]{resetdefaultclassoptions}[false]{}  
\define@boolkey[KV]{open-science-thesis}[ost@]{parindent}[false]{}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

\presetkeys{open-science-thesis}{%
   linenumbers=false, 
   color=false, 
   print=false, 
   gitinfo=false, 
   autolayout=true,
   twosidelayout=false,
   reversepagelayout=false, 
   resetdefaultclassoptions=false, 
   parindent=false,
}{}

\ProcessOptionsX[KV]<open-science-thesis>

\ifost@resetdefaultclassoptions%
   \LoadClass{scrartcl}   
\else% 
   \ifost@autolayout  
      \ifost@twosidelayout%
         \LoadClass[pagesize=auto, DIV=calc, BCOR=5mm, fontsize=12pt, headings=small, captions=tableheading, twoside, final]{scrreprt}   
      \else%
         \LoadClass[pagesize=auto, DIV=calc, BCOR=5mm, fontsize=12pt, headings=small, captions=tableheading, oneside, final]{scrreprt}   
      \fi%
   \else%
      \ifost@twosidelayout%
         \LoadClass[pagesize=auto, fontsize=12pt, headings=small, captions=tableheading, twoside, final]{scrreprt}
      \else%
         \LoadClass[pagesize=auto, fontsize=12pt, headings=small, captions=tableheading, oneside, final]{scrartcl}
      \fi%
      \RequirePackage{geometry}
   \fi% 
\fi%

%%%-------------------------------------------------%%%
%%% Input encodings fonts and symbols %%%
%%%-------------------------------------------------%%% 

%% input and font encoding %%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{luainputenc}

%% Fonts and math symbols %%
\RequirePackage{lmodern}

% \RequirePackage{libertine}
% \RequirePackage[libertine]{newtxmath}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb} 

\RequirePackage{textcomp}
% \RequirePackage{pifont}
% \RequirePackage{marvosym}
% \RequirePackage{dingbat}

%%%-------------------------------------------------%%%
%%% Patch some LaTeX shortcomings %%%
%%%-------------------------------------------------%%%

\RequirePackage{fixltx2e}
\RequirePackage{scrhack}
\RequirePackage{etex} 
\RequirePackage{etoolbox} 
\reserveinserts{30}

%%%-------------------------------------------------%%%
%%% Useful tools %%%
%%%-------------------------------------------------%%%

\RequirePackage{calc}
\RequirePackage{xifthen} 
\RequirePackage{ifluatex}
\RequirePackage{datatool} 
\RequirePackage{expl3} 

%%%-------------------------------------------------%%%
%%% Language adaption of the document %%%
%%%-------------------------------------------------%%%

\RequirePackage[ngerman, english]{babel} 
\RequirePackage[autostyle]{csquotes} 
% usage:
%  \enquote{} to put a text in the right quotes

%%%-------------------------------------------------%%%
%%% Lipsum %%%
%%%-------------------------------------------------%%%

\RequirePackage{lipsum}

%%%-------------------------------------------------%%%
%%% Color options %%%
%%%-------------------------------------------------%%%

\ifost@print%
   \RequirePackage[svgnames,cmyk]{xcolor}  
\else%
   \RequirePackage[svgnames,rgb]{xcolor} 
\fi%

\ifost@color%
   \colorlet{ostColor@TitleRule}{LightGray}
   \colorlet{ostColor@Title}{DarkRed}
   
   \colorlet{ostColor@AbstractHeader}{DarkGray}   
   \colorlet{ostColor@SubsectionHeader}{DarkOrange}
   \colorlet{ostColor@ParagraphHeader}{DarkGray}
   \colorlet{ostColor@SectionHeader}{DarkOrange}
   
   \colorlet{ostColor@Lettrine}{DarkGray} 
   
   \colorlet{ostColor@LineNumbers}{DarkGray} 

   \colorlet{ostColor@FooterTextSeparator}{DarkGray}
   \colorlet{ostColor@FooterRule}{LightGray}
   \colorlet{ostColor@FullLeftFooter}{DarkGray} 
   \colorlet{ostColor@FullRightFooter}{DarkGray} 
   \colorlet{ostColor@FooterPageNumbering}{DarkGray}

   \xdefinecolor{ostColor@Links}{rgb}{0,0,0.4} 
   \xdefinecolor{ostColor@ListingBackground}{gray}{.90} 
   \xdefinecolor{ostColor@ListingBase00}{HTML}{657b83}
   \xdefinecolor{ostColor@ListingBase01}{HTML}{586e75}
   \xdefinecolor{ostColor@ListingBase02}{HTML}{073642}
   \xdefinecolor{ostColor@ListingBase03}{HTML}{002B36}
   \xdefinecolor{ostColor@ListingBase0}{HTML}{839496}
   \xdefinecolor{ostColor@ListingBase1}{HTML}{93a1a1}
   \xdefinecolor{ostColor@ListingBase2}{HTML}{EEE8D5}
   \xdefinecolor{ostColor@ListingBase3}{HTML}{FDF6E3}
   \xdefinecolor{ostColor@ListingYellow}{HTML}{B58900}
   \xdefinecolor{ostColor@ListingOrange}{HTML}{CB4B16}
   \xdefinecolor{ostColor@ListingRed}{HTML}{DC322F}
   \xdefinecolor{ostColor@ListingMagenta}{HTML}{D33682}
   \xdefinecolor{ostColor@ListingViolet}{HTML}{6C71C4}
   \xdefinecolor{ostColor@ListingBlue}{HTML}{268BD2}
   \xdefinecolor{ostColor@ListingCyan}{HTML}{2AA198}
   \xdefinecolor{ostColor@ListingGreen}{HTML}{859900}
\else%
   \colorlet{ostColor@TitleRule}{black}
   \colorlet{ostColor@Title}{black} 

   \colorlet{ostColor@AbstractHeader}{black}  
   \colorlet{ostColor@SubsectionHeader}{black}
   \colorlet{ostColor@ParagraphHeader}{black}
   \colorlet{ostColor@SectionHeader}{black}

   \colorlet{ostColor@Lettrine}{black}
   
   \colorlet{ostColor@LineNumbers}{black} 
   
   \colorlet{ostColor@FooterRule}{black}
   \colorlet{ostColor@FullLeftFooter}{black}   
   \colorlet{ostColor@FullRightFooter}{black} 
   \colorlet{ostColor@FooterPageNumbering}{black} 
   \colorlet{ostColor@FooterTextSeparator}{black}

   \xdefinecolor{ostColor@Links}{rgb}{0,0,0.4} 
   \xdefinecolor{ostColor@ListingBackground}{gray}{.90} 
   \colorlet{ostColor@ListingBase00}{black}
   \colorlet{ostColor@ListingBase01}{black}
   \colorlet{ostColor@ListingBase02}{black}
   \colorlet{ostColor@ListingBase03}{black}
   \colorlet{ostColor@ListingBase0}{black}
   \colorlet{ostColor@ListingBase1}{black}
   \colorlet{ostColor@ListingBase2}{black}
   \colorlet{ostColor@ListingBase3}{black}
   \colorlet{ostColor@ListingYellow}{black}
   \colorlet{ostColor@ListingOrange}{black}
   \colorlet{ostColor@ListingRed}{black}
   \colorlet{ostColor@ListingMagenta}{black}
   \colorlet{ostColor@ListingViolet}{black}
   \colorlet{ostColor@ListingBlue}{black}
   \colorlet{ostColor@ListingCyan}{black}
   \colorlet{ostColor@ListingGreen}{black}
\fi%

%%%-------------------------------------------------%%%
%%% Include Git information %%%
%%%-------------------------------------------------%%%

\ifost@gitinfo%
   \RequirePackage{gitinfo} 

   \newcommand{\ostGitUrl}{\tiny{\href{ostGitUrl}{https://github.com/cpfaff/Open-Science-Thesis}}}
   \newcommand{\ostSetGitUrl}[1]{\def\ostGitUrl{#1}}

   \newcommand{\ostGitInfoLine}{{\tiny Version from commit by \gitAuthorEmail~on~\gitAuthorDate; Source on: \ostGitUrl}\par}
   \newcommand{\ostSetGitInfoLine}[1]{\def\ostGitInfo{#1}}
\else%
   \newcommand{\ostGitInfoLine}{}
   \newcommand{\ostSetGitInfoLine}[1]{\def\ostGitInfo{#1}}
\fi%

%%%-------------------------------------------------%%%
%%% Define header and footer %%%
%%%-------------------------------------------------%%%

% \usepackage{fancyhdr}
% \pagestyle{fancy}
% \fancyhf{}

% %% Set the footer contents
% \newcommand{\ostFooterTextLeftOfSeparator}{Open-Science-Thesis} 
% \newcommand{\ostSetFooterTextLeftOfSeparator}[1]{\def\ostFooterTextLeftOfSeparator{#1}}

% \newcommand{\ostFooterTextRightOfSeparator}{Compiled on \today} 
% \newcommand{\ostSetFooterTextRightOfSeparator}[1]{\def\ostFooterTextRightOfSeparator{#1}}

% \newcommand{\ostFooterLogo}{\relax}
% \newcommand{\ostSetFooterLogo}[1]{\gdef\ostFooterLogo{#1}}

% \ifost@color%
   % \ostSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{ost/graphics/open-science-thesis-footer-logo-gray.pdf}}}
% \else% 
   % \ostSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{ost/graphics/open-science-thesis-footer-logo-black.pdf}}}
% \fi%

% \newcommand{\ostFooterTextSeparator}{\textcolor{ostColor@FooterTextSeparator}{$\circ$}} 
% \newcommand{\ostSetFooterTextSeparator}[1]{\gdef\ostFooterTextSeparator{#1}}

% \newcommand{\ostFullLeftFooter}{\ostFooterLogo\xspace~ \textcolor{ostColor@FullLeftFooter}{{\normalsize \ostFooterTextLeftOfSeparator\xspace \ostFooterTextSeparator\xspace \ostFooterTextRightOfSeparator}}} 
% \newcommand{\ostSetFullLeftFooter}[1]{\gdef\ostFullLeftFooter{#1}}

% %% Style the footer and header elements 
% \newcommand{\ostFooterRuleColor}{ostColor@FooterRule} 
% \newcommand{\ostSetFooterRuleColor}[1]{\gdef\ostFooterRuleColor{#1}}

% \newlength{\ostLengthHeaderRuleWidth} 
% \setlength{\ostLengthHeaderRuleWidth}{0pt} 
% \renewcommand{\headrulewidth}{\ostLengthHeaderRuleWidth}

% \newlength{\ostLengthFooterRuleWidth} 
% \setlength{\ostLengthFooterRuleWidth}{0.4pt} 
% \renewcommand{\footrulewidth}{\ostLengthFooterRuleWidth} 

% \patchcmd{\footrule}{\hrule}{\color{\ostFooterRuleColor}\hrule}{}{}

% \newcommand{\ostFooterPageNumberingColor}{ostColor@FooterPageNumbering} 
% \newcommand{\ostSetFooterPageNumberingColor}[1]{\gdef\ostFooterPageNumberingColor{#1}} 

% \newcommand{\ostFooterPageNumberingStyle}{\normalsize\textbf} 
% \newcommand{\ostSetFooterPageNumberingStyle}[1]{\gdef\ostFooterPageNumberingStyle{#1}} 

% \newcommand{\ostFullRightFooter}{{\ostFooterPageNumberingStyle{\textcolor{\ostFooterPageNumberingColor}{{\thepage}}}}} 
% \newcommand{\ostSetFullRightFooter}[1]{\gdef\ostFullRightFooter{#1}}

% \ifost@twosidelayout% 
   % \ifost@reversepagelayout%
      % \fancyfoot[LO, RE]{\ostFullLeftFooter}
      % \fancyfoot[RO, LE]{\ostFullRightFooter} 
   % \else%
      % \fancyfoot[RO, LE]{\ostFullLeftFooter}
      % \fancyfoot[LO, RE]{\ostFullRightFooter} 
   % \fi%
% \else%
   % \fancyfoot[L]{\ostFullLeftFooter}
   % \fancyfoot[R]{\ostFullRightFooter} 
% \fi%

%%%-------------------------------------------------%%%
%%% Control big starting letters (Lettrine) %%%
%%%-------------------------------------------------%%%

\usepackage{lettrine} 

\ExplSyntaxOn%
\newcommand{\ostSet@LettrineOptions}[1]{%  
   \prg_case_str:nnn {#1}
   {%
      {A}{%
         \setlength{\DefaultFindent}{-0.2em}
         \setlength{\DefaultNindent}{0.5em}
      }
      {T}{%
         \setlength{\DefaultFindent}{0.27em}
         \setlength{\DefaultNindent}{0.02em}
      }
   }
   {%
      \setlength{\DefaultFindent}{0.2em}
      \setlength{\DefaultNindent}{0.02em}
   }
} 
\ExplSyntaxOff%

\newcommand{\capital}[1]{%
   \ostSet@LettrineOptions{#1}
   \lettrine{\textcolor{ostColor@Lettrine}{#1}}
}    

%%%-------------------------------------------------%%%
%%% Enable linenumbers %%%
%%%-------------------------------------------------%%%

\ifost@linenumbers%
   \RequirePackage[pagewise]{lineno}
   \RequirePackage{lineno}
   \setlength\linenumbersep{2pt}
   \renewcommand\linenumberfont{\normalfont\tiny\sffamily\color{ostColor@LineNumbers}}
   \AtBeginDocument{\linenumbers} 
\else% 
   \RequirePackage[pagewise]{lineno}
\fi% 

%%%-------------------------------------------------%%%
%%% List options %%%
%%%-------------------------------------------------%%%


\RequirePackage[neverdecrease]{paralist}

% override item lists 
\let\itemize\compactitem%
\let\enditemize\endcompactitem%
\let\enumerate\compactenum%
\let\endenumerate\endcompactenum%
\let\description\compactdesc%
\let\enddescription\endcompactdesc% 
\pltopsep=\medskipamount%
\setdefaultenum{1.}{a)~}{i.~}{A)~}%
\setdefaultleftmargin{1.5em}{1.2em}{1.2em}{1.2em}{1.2em}{1.2em}%
\setdefaultitem{$\circ$}{\textbullet}{\textperiodcentered}{--}%

%%%-------------------------------------------------%%%
%%% Graphic options %%%
%%%-------------------------------------------------%%%

%% Use and create graphics %%
\RequirePackage{graphicx}
\RequirePackage{overpic}
\RequirePackage{tikz}

%% Load some tikz libraries %%
\usetikzlibrary{spy,external,automata,patterns,shadows.blur,trees,mindmap,arrows,decorations.pathmorphing,backgrounds,positioning,fit,petri}
\pgfdeclarelayer{background}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,main,foreground}

%% Define tikz styles %% 
\ifost@color
   % \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=LightGray, fill=white, blur shadow={shadow blur steps=5, shadow blur extra rounding=1.3pt}] 
   \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=LightGray, thick, fill=white] 
\else
   \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=black, fill=white]
\fi

\tikzstyle{signbackground} = [rectangle, fill=gray!3, rounded corners, draw=gray, very thin]

\RequirePackage{subcaption} 
% usage:
%  \begin{figure}
%    \begin{subfigure}{Breite}
%      Bild
%      \caption{Text}
%    \end{subfigure}
%  \end{figure}

%%%-------------------------------------------------%%%
%%% Control floatings and captions %%%
%%%-------------------------------------------------%%%

%% Control float placement %%
\RequirePackage{float} 

% tune floating 
\RequirePackage{flafter} %floats appear after first referene on them not before
\RequirePackage[section]{placeins} % helps to place floats (here section with \floatbarrier)
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.85}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.7}
\setcounter{dbltopnumber}{2}    % for 2-column pages
\renewcommand{\dbltopfraction}{0.9}	% fit big float above 2-col. text
\renewcommand{\dblfloatpagefraction}{0.7}	% require fuller float pages

%% Control caption layout %%
\RequirePackage[format=plain, margin=7pt, font={small,it}, labelformat=default, labelfont=bf]{caption}

%%%-------------------------------------------------%%%
%%% Table related options %%%
%%%-------------------------------------------------%%%

%% Professional tables %%
\RequirePackage{booktabs}
% useage:
%	\toprule
%	\midrule
%	\bottomrule
% 	\cmidrule{from column #. - to column #}

%% Extended table functions %%
\RequirePackage{tabularx}

\newcolumntype{R}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
% usage:
%  R{column width} for raggedright column in certain width
%  C{column width} for centered column in certain width

%% Aggregate cells column and row wise %%
\RequirePackage{multirow}
% usage:
%  Horizontal aggregation of table cells
%	 \multicolumn{count of columns}{alignment}{text}
%  Vertical aggregation of table cells  
%	 \multirow{count of rows}{width}{text}

%% Tables spanning multiple pages %%
\RequirePackage{longtable}

%%%-------------------------------------------------%%%
%%% Multi column documents %%%
%%%-------------------------------------------------%%%

\RequirePackage{multicol}
% \setlength\columnseprule{0.5pt}
\newcommand{\ostColumnCount}{2} 
\newcommand{\ostSetColumnCount}[1]{\def\ostColumnCount{#1}} 

%%%-------------------------------------------------%%%
%%% Bibliography options %%%
%%%-------------------------------------------------%%%

%% citation management %%
\RequirePackage[backend=biber, natbib=true, style=authoryear, bibstyle=authoryear, hyperref=true]{biblatex}

% usage:
%  \citet{jon90} ⇒ Jones et al. (1990)
%  \citet[chap.~2]{jon90} ⇒ Jones et al. (1990, chap. 2)
%  \citep{jon90} ⇒ (Jones et al., 1990)
%  \citep[chap.~2]{jon90} ⇒ (Jones et al., 1990, chap. 2)
%  \citep[see][]{jon90} ⇒ (see Jones et al., 1990)
%  \citep[see][chap.~2]{jon90} ⇒ (see Jones et al., 1990, chap. 2)
%  \citet*{jon90} ⇒ Jones, Baker, and Williams (1990)
%  \citep*{jon90} ⇒ (Jones, Baker, and Williams, 1990)

%%%-------------------------------------------------%%%
%%% Typesetting of units %%%
%%%-------------------------------------------------%%%

\RequirePackage{siunitx}
% usage:
%  \si{kg.m/s^2}
%  \num{12345}
%  \num{0,1234}
%  \num{.12345}
%  \ang{12.3}
%  \ang{1;2;3}
%  \ang{;;-1}
%  \SI{-29}{\degreeCelsius}   
%  \SI{30000}{\kilogram}

%%%-------------------------------------------------%%%
%%% Display LaTeX code and compiled output %%%
%%%-------------------------------------------------%%%

\RequirePackage{showexpl}

%%%-------------------------------------------------%%%
%%% Options for references in the document %%%
%%%-------------------------------------------------%%%

\RequirePackage{prettyref}

\newrefformat{fig}{figure~\ref{#1}}
\newrefformat{Fig}{Figure~\lowercase{\ref{#1}}}
\newrefformat{cha}{chapter~\ref{#1}}
\newrefformat{Cha}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{sec}{chapter~\ref{#1}}
\newrefformat{Sec}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{sub}{chapter~\ref{#1}}
\newrefformat{Sub}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{subs}{chapter~\ref{#1}}
\newrefformat{Subs}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{tab}{table~\ref{#1}}
\newrefformat{Tab}{Table~\lowercase{\ref{#1}}}
\newrefformat{lst}{listing~\ref{#1}}
\newrefformat{Lst}{Listing~\lowercase{\ref{#1}}}
\newrefformat{equ}{equation~\ref{#1}}
\newrefformat{Equ}{Equation~\lowercase{\ref{#1}}}

% Usage:
%  \prettyref{fig:my_figure_label}
%  \prettyref{Fig:my_figure_label}

%%%-------------------------------------------------%%%
%%% Options for code listings in your document %%%
%%%-------------------------------------------------%%%

\RequirePackage{listings}
 
\lstset{%
   upquote=true,%
   columns=fixed,%
   tabsize=2,%
   showstringspaces=false,%
   flexiblecolumns=true,%
   extendedchars=true,%
   breaklines=true,%
   numbers=left,% 
   backgroundcolor=\color{ostColor@ListingBackground},%
   stepnumber=1,%
   numbersep=7pt,%
   xleftmargin=10pt,%
   % rulesepcolor=\color{ostColor@ListingBase03},%
   % numberblanklines=true,%
   numberstyle=\tiny\color{ostColor@ListingBase01},%
   basicstyle=\footnotesize\ttfamily,%
   keywordstyle=\color{ostColor@ListingGreen},%
   stringstyle=\color{ostColor@ListingCyan}\ttfamily,%
   identifierstyle=\color{ostColor@ListingBlue},%
   commentstyle=\color{ostColor@ListingBase01},%
   emphstyle=\color{ostColor@ListingRed}
}

\lstset{literate=%
   {Ö}{{\"O}}1
   {Ä}{{\"A}}1
   {Ü}{{\"U}}1
   {ß}{{\ss}}2 
   {ü}{{\"u}}1
   {ä}{{\"a}}1
   {ö}{{\"o}}1
   {~}{{\textasciitilde}}1
}

%highlight definition for XML in listings 
% \lstdefinelanguage{XML}
% {
  % morestring=[b],
  % morestring=[s]{>}{<},
  % morecomment=[s]{<?}{?>},
  % stringstyle=\color{black},
  % identifierstyle=\color{darkblue},
  % keywordstyle=\color{cyan},
  % morekeywords={xmlns,version,type}% list your attributes here
% }

%%%-------------------------------------------------%%%
%%% Definition of environments %%%
%%%-------------------------------------------------%%%

%% Title header defaults %%
\newcommand{\ostTitle}{The open science thesis title} 
\newcommand{\ostSetTitle}[1]{\def\ostTitle{#1}}

\newcommand{\ostFontTitle}{\normalfont\sffamily\Huge\bfseries} 
\newcommand{\ostSetFontTitle}[1]{\gdef\ostFontTitle{#1}} 

\newcommand{\ostAuthors}{Author one\textsuperscript{1,2,a}, Author two\textsuperscript{2,b}, \ldots} 
\newcommand{\ostSetAuthors}[1]{\def\ostAuthors{#1}}

\newcommand{\ostTitleSubTitle}{Universität Leipzig: \today} 
\newcommand{\ostSetTitleSubTitle}[1]{\def\ostTitle{#1}}

\newcommand{\ostTitleRule}{\textcolor{ostColor@TitleRule}{\noindent\rule{\linewidth}{1.7pt}}}


\newcommand{\ostMakeTitle}{%
  \begin{titlepage}
    %\CenterBackgroundPic{Bilder/yourpic.png}
    \vspace*{\stretch{1}}
      \ostTitleRule%
        \vspace{1em}
          \begin{center}
            \begin{LARGE}
              {\ostFontTitle\ostTitle}
            \end{LARGE} 
          \end{center} 
          \begin{center}
            \begin{normalsize}\ostAuthors\end{normalsize}
          \end{center} 
          \begin{center}
            \begin{footnotesize}
              \ostTitleSubTitle%
            \end{footnotesize} 
          \end{center}      
      \ostTitleRule%
    \vspace*{\stretch{2}}
  \end{titlepage}
}

%%%-------------------------------------------------%%%
%%% Typographical options of the headings %%%
%%%-------------------------------------------------%%%

% \RequirePackage[noindentafter,calcwidth]{titlesec}  

% \titleformat{\section}
% {\color{ostColor@SectionHeader}\normalfont\sffamily\large\bfseries}{\thesection}{0.5em}{}
% \titlespacing*{\section}
% {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

% \AtBeginDocument{\renewcommand*{\refname}{\vspace*{-\baselineskip}}}

% \titleformat{\subsection}[runin]
% {\color{ostColor@SubsectionHeader}\normalfont\sffamily\normalsize\bfseries}{\thesubsection}{0.5em}{}
% \titlespacing*{\subsection}
% {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

% \titleformat{\paragraph}[runin]
% {\color{ostColor@ParagraphHeader}\normalfont\sffamily\normalsize\bfseries}{\theparagraph}{0.5em}{}
% \titlespacing*{\paragraph}
% {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}

%%%-------------------------------------------------%%%
%%% Typographical fine-tuning %%%
%%%-------------------------------------------------%%%

%% No indent for new paragraph %% 
\ifost@parindent%
   \setlength{\parindent}{1em} 
\else%
   \setlength{\parindent}{0em} 
\fi% 

%% Correction of white spaces %%
\RequirePackage{ellipsis}

%% To set right space after macros %%
\RequirePackage{xspace}

%% TeX typesetting parameters %%
\clubpenalty = 9999 % No "Schusterjungen"
\widowpenalty = 9999 % No "Hurenkinder"
\displaywidowpenalty = 9999
\tolerance = 200
\hbadness = 1414
\emergencystretch = 1.5em
\hfuzz = 0.3pt

%% Microtype for fine-tuning of typesetting %%

\ifluatex% 
   \RequirePackage[protrusion=true,%
   expansion=true,%
   babel=true,%
   spacing=false]{microtype}     
\else%
   %% Microtype for fine-tuning of typesetting %%
   \RequirePackage[protrusion=true,%
   expansion=true,%
   babel=true,%
   tracking=true,% 
   spacing=false]{microtype}     

   \DeclareMicrotypeSet*[tracking]{my}% 
          {font = */*/*/sc/*}% 
   \SetTracking{encoding = *, shape = sc}{40}
\fi%

%%%-------------------------------------------------%%%
%%% PDF Options %%%
%%%-------------------------------------------------%%%

\RequirePackage[%
   plainpages=false,%
   bookmarks=true,%
   bookmarksopen=true,%
   pdfborder={0 0 0},%
   pdfpagemode=UseNone,%
   colorlinks=false,%
   linkcolor=ostColor@Links,
   citecolor=ostColor@Links,%
   filecolor=ostColor@Links,%
   menucolor=ostColor@Links,%	
   urlcolor=ostColor@Links,%
   breaklinks=true,%
   raiselinks=true,%
   pdfauthor={Open-Science-Thesis},%
   pdfcreator={Open-Science-Thesis},%
   pdfsubject={Open-Science-Thesis},%
   pdfkeywords={LaTeX, Tikz, Knitr, Scientific thesis, Open science}
]{hyperref}

% Usage:
%  \href{URL}{text} 
%  \url{URL}
%  \nolinkurl{URL}

%%%-------------------------------------------------%%%
%%% Do before the document starts %%%
%%%-------------------------------------------------%%%

%% Set typesetting area with last chosen options %%
\ifost@autolayout%
   \AtBeginDocument{\KOMAoptions{DIV=last}}
\else% 
   \relax
\fi% 

\ifost@reversepagelayout%
   \AtBeginDocument{
      \let\tmp\evensidemargin%
      \let\evensidemargin\oddsidemargin%
      \let\oddsidemargin\tmp%
      \reversemarginpar%
   }
\else% 
   \relax
\fi%
