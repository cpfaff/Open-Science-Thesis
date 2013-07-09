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

\ProvidesClass{open-science-thesis}[2013/03/03 version 0.9.2 LaTeX class of the Open-Science-Thesis]

\RequirePackage{xkeyval} 

\define@boolkey[KV]{open-science-thesis}[ost@]{linenumbers}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{color}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{print}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{gitinfo}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{csvdata}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{sectionnumbers}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{autolayout}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{twosidelayout}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{reversepagelayout}[false]{}  
\define@boolkey[KV]{open-science-thesis}[ost@]{resetdefaultclassoptions}[false]{}  
\define@boolkey[KV]{open-science-thesis}[ost@]{parindent}[false]{}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{scrreprt}}

\presetkeys{open-science-thesis}{%
   linenumbers=false, 
   color=false, 
   print=false, 
   gitinfo=false, 
   csvdata=false,
   sectionnumbers=false,
   autolayout=true,
   twosidelayout=false,
   reversepagelayout=false, 
   resetdefaultclassoptions=false, 
   parindent=false,
}{} 

\ProcessOptionsX[KV]<open-science-thesis>

% BCOR=5mm 

\ifost@resetdefaultclassoptions%
   \LoadClass{scrreprt}   
\else% 
   \ifost@autolayout  
      \ifost@twosidelayout%
         \LoadClass[12pt, headings=small, captions=tableheading, DIV=calc, twoside, final]{scrreprt}   
      \else%
         \LoadClass[12pt, headings=small, captions=tableheading, DIV=calc, oneside, final]{scrreprt}   
      \fi%
   \else%
      \ifost@twosidelayout%
         \LoadClass[12pt, headings=small, captions=tableheading, twoside, final]{scrreprt}
      \else%
         \LoadClass[12pt, headings=small, captions=tableheading, oneside, final]{scrreprt}
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
\RequirePackage{libertine}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{amssymb} 
\RequirePackage{textcomp}

%%%-------------------------------------------------%%%
%%% Patch some LaTeX shortcommings %%%
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
% \RequirePackage{expl3}  
% \RequirePackage{xstring} 
\RequirePackage{suffix}

%%%-------------------------------------------------%%%
%%% Helpers (unify commands to use in style file) %%%
%%%-------------------------------------------------%%%

\newcommand{\ostSetLength}[2]{\setlength{#1}{#2}}
\newcommand{\ostSetColor}[2]{\colorlet{#1}{#2}} 
\newcommand{\ostDefineColor}[3]{\xdefinecolor{#1}{#2}{#3}}

\newcommand{\ostSetFont}[2]{
  \def#1{#2} 
}  

\newcommand{\ostSetContent}[2]{
  \def#1{#2} 
}  


% usage:

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

% usage:

%%%-------------------------------------------------%%%
%%% Color options %%%
%%%-------------------------------------------------%%%

\ifost@print%
   \RequirePackage[svgnames,cmyk]{xcolor}  
\else%
   \RequirePackage[svgnames,rgb]{xcolor} 
\fi%

\ifost@color% 
   \colorlet{ostColorTitleRule}{LightGray}
   \colorlet{ostColorTitle}{DarkRed}
   \colorlet{ostColorAbstractHeader}{DarkGray}     

   \colorlet{ostColorPartHeader}{black} 
   \colorlet{ostColorPartHeaderNumber}{LightGray}  

   \colorlet{ostColorChapterHeader}{black} 
   % \colorlet{ostColorSectionHeader}{DarkOrange}  
   \xdefinecolor{ostColorSectionHeader}{RGB}{217,95,14} 
   % \colorlet{ostColorSubsectionHeader}{DarkOrange}
   \xdefinecolor{ostColorSubsectionHeader}{RGB}{254,196,79} 
   % \colorlet{ostColorParagraphHeader}{DarkGray}
   \xdefinecolor{ostColorParagraphHeader}{RGB}{255,247,188} 

   \colorlet{ostColorLettrine}{DarkGray}  

   \colorlet{ostColorLineNumbers}{DarkGray} 

   \colorlet{ostColorFooterTextSeparator}{DarkGray}
   \colorlet{ostColorFooterRule}{LightGray}
   \colorlet{ostColorFullLeftFooter}{DarkGray} 
   \colorlet{ostColorFullRightFooter}{DarkGray} 
   \colorlet{ostColorFooterPageNumber}{DarkGray}

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
   \colorlet{ostColorTitleRule}{black}
   \colorlet{ostColorTitle}{black} 

   \colorlet{ostColorPartHeader}{black}
   \colorlet{ostColorPartHeaderNumber}{black}
   \colorlet{ostColorChapterHeader}{black}
   \colorlet{ostColorSectionHeader}{black}
   \colorlet{ostColorSubsectionHeader}{black}
   \colorlet{ostColorParagraphHeader}{black}

   \colorlet{ostColorLettrine}{black}
   
   \colorlet{ostColorLineNumbers}{black} 
   
   \colorlet{ostColorFooterRule}{black}
   \colorlet{ostColorFullLeftFooter}{black}   
   \colorlet{ostColorFullRightFooter}{black} 
   \colorlet{ostColorFooterPageNumber}{black} 
   \colorlet{ostColorFooterTextSeparator}{black}

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

%% Set the footer contents
% \newcommand{\ostFooterTextLeftOfSeparator}{Open-Science-Theses} 
% \newcommand{\ostSetFooterTextLeftOfSeparator}[1]{\def\ostFooterTextLeftOfSeparator{#1}}

% \newcommand{\ostFooterTextRightOfSeparator}{Compiled on \today} 
% \newcommand{\ostSetFooterTextRightOfSeparator}[1]{\def\ostFooterTextRightOfSeparator{#1}}

% \newcommand{\ostFooterLogo}{\relax}
% \newcommand{\ostSetFooterLogo}[1]{\gdef\ostFooterLogo{#1}}

% \ifost@color%
   % \ostSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{ost/graphics/open-science-theses-footer-logo-gray.pdf}}}
% \else% 
   % \ostSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{ost/graphics/open-science-theses-footer-logo-black.pdf}}}
% \fi%

% \newcommand{\ostFooterTextSeparator}{\textcolor{ostColorFooterTextSeparator}{$\circ$}} 
% \newcommand{\ostSetFooterTextSeparator}[1]{\gdef\ostFooterTextSeparator{#1}}

% \newcommand{\ostFullLeftFooter}{\ostFooterLogo\xspace~ \textcolor{ostColorFullLeftFooter}{{\normalsize \ostFooterTextLeftOfSeparator\xspace \ostFooterTextSeparator\xspace \ostFooterTextRightOfSeparator}}} 
% \newcommand{\ostSetFullLeftFooter}[1]{\gdef\ostFullLeftFooter{#1}}

% %% Style the footer and header elements 
% \newcommand{\ostFooterRuleColor}{ostColorFooterRule} 
% \newcommand{\ostSetFooterRuleColor}[1]{\gdef\ostFooterRuleColor{#1}}

% \newlength{\ostLengthHeaderRuleWidth} 
% \setlength{\ostLengthHeaderRuleWidth}{0pt} 
% \renewcommand{\headrulewidth}{\ostLengthHeaderRuleWidth}

% \newlength{\ostLengthFooterRuleWidth} 
% \setlength{\ostLengthFooterRuleWidth}{0.4pt} 
% \renewcommand{\footrulewidth}{\ostLengthFooterRuleWidth} 

% \patchcmd{\footrule}{\hrule}{\color{\ostFooterRuleColor}\hrule}{}{}

% \newcommand{\ostFooterPageNumberingColor}{ostColorFooterPageNumber} 
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

% set defaults
\setlength{\DefaultFindent}{0.2em}
\setlength{\DefaultNindent}{0.02em}

\newcommand{\ostSet@LettrineOptions}[1]{%
   \ifstrequal{#1}{A}{
      \setlength{\DefaultFindent}{-0.2em}
      \setlength{\DefaultNindent}{0.5em}
   }{\relax}

   \ifstrequal{#1}{T}{
      \setlength{\DefaultFindent}{0.27em}
      \setlength{\DefaultNindent}{0.02em}
   }{\relax}
   
}

\newcommand{\capital}[1]{%
   \ostSet@LettrineOptions{#1}
   \lettrine{\textcolor{ostColorLettrine}{#1}}
} 

%%%-------------------------------------------------%%%
%%% Enable linenumbers %%%
%%%-------------------------------------------------%%%

\ifost@linenumbers%
   \RequirePackage[pagewise]{lineno}
   \RequirePackage{lineno}
   \setlength\linenumbersep{2pt}
   \renewcommand\linenumberfont{\normalfont\tiny\sffamily\color{ostColorLineNumbers}}
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
\else%
   \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=black, fill=white]
\fi

\tikzstyle{signbackground} = [rectangle, fill=gray!3, rounded corners, draw=gray, very thin]

\RequirePackage{subcaption} 

% usage:

% \begin{figure}
  % \centering
  % \begin{subfigure}[b]{0.3\textwidth}
    % \centering
    % \includegraphics[width=\textwidth]{path/to/figure.png}
    % \caption{Picture A}
    % \label{fig:pica}
  % \end{subfigure}%
  % ~ %add desired spacing between images, e. g. ~, \quad, \qquad etc.
  % %(or a blank line to force the subfigure onto a new line)
  % \begin{subfigure}[b]{0.3\textwidth}
    % \centering
    % \includegraphics[width=\textwidth]{path/to/figure.png}
    % \caption{Picture B}
    % \label{fig:picb}
  % \end{subfigure}
  % ~ %add desired spacing between images, e. g. ~, \quad, \qquad etc.
  % %(or a blank line to force the subfigure onto a new line)
  % \begin{subfigure}[b]{0.3\textwidth}
    % \centering
    % \includegraphics[width=\textwidth]{path/to/figure.png}
    % \caption{Picture C}
    % \label{fig:picc}
  % \end{subfigure}
  % \caption{Pictures of animals}\label{fig:allfigs}
% \end{figure}


%%%-------------------------------------------------%%%
%%% Control floatings and captions %%%
%%%-------------------------------------------------%%%

%% Control float placement %%
\RequirePackage{float} 

\RequirePackage{placeins}

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

\newlength{\ostLengthColumnSeparator} 
\setlength{\ostLengthColumnSeparator}{10pt} 
\AtBeginDocument{\setlength\columnsep{\ostLengthColumnSeparator{}}}

\newcommand{\ostColumnCount}{2} 
\newcommand{\ostSetColumnCount}[1]{\def\ostColumnCount{#1}} 

\newcommand{\ostColumnLayoutControlBegin}{
  \ifnum\ostColumnCount=1 
    \relax 
  \else 
    \begin{multicols}{\ostColumnCount{}}
  \fi
}

\newcommand{\ostColumnLayoutControlEnd}{
  \ifnum\ostColumnCount=1 
    \relax 
  \else 
    \end{multicols}
  \fi
}

% wrapper for the column layout in the root document
\newenvironment{ostColumLayout}{%
  \ostColumnLayoutControlBegin{}%
}{%
  \ostColumnLayoutControlEnd{}%
}


%%%-------------------------------------------------%%%
%%% Bibliography options %%%
%%%-------------------------------------------------%%%

%% citation management %%
\RequirePackage[backend = biber, bibstyle = authoryear, style = authoryear, natbib = true]{biblatex}
 
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

% For inline code listings (may be refined with a tikz frame)
\newcommand{\inlinecode}[1]{\colorbox{ostColorAtListingBackground}{\lstinline|#1|}}
% Usage: 
%       \inlinecode{a=a+b} 

%%%-------------------------------------------------%%%
%%% Definition of environments %%%
%%%-------------------------------------------------%%%

%% Title header defaults %%
\newcommand{\ostFontTitle}{\normalfont\sffamily\Huge\bfseries}  
% \newcommand{\ostSetFontTitle}[1]{\gdef\ostFontTitle{#1}} 

\newlength{\ostLengthOfTitleBeforeReduceFontSize} 
\setlength{\ostLengthOfTitleBeforeReduceFontSize}{0.6\textwidth} 

\newcommand{\ostTitle}{The open science thesis title} 
\newcommand{\ostSetTitle}[1]{%
  \def\ostTitle{#1} 
  \newlength{\ost@LenghtTitle} 
  \settowidth{\ost@LenghtTitle}{#1}   

  \ifdim\ost@LenghtTitle>\ostLengthOfTitleBeforeReduceFontSize
    % \ostSetFontTitle{\normalfont\sffamily\LARGE\bfseries} 
    \ostSetFont{\ostFontTitle}{\normalfont\sffamily\LARGE\bfseries}
  \else 
    % \ostSetFontTitle{\normalfont\sffamily\Huge\bfseries}
    \ostSetFont{\ostFontTitle}{\normalfont\sffamily\Huge\bfseries}
  \fi 
} 

% wrapper for the header content in root file
\newenvironment{ostHeader}{
  \relax
}{
  \ostTitleRule
}

\newcommand{\ostAuthors}{Author one\textsuperscript{1,2,a}, Author two\textsuperscript{2}, \ldots} 
\newcommand{\ostSetAuthors}[1]{\def\ostAuthors{#1}}

\newcommand{\ostInsitution}{University of XY, Department Z} 
\newcommand{\ostSetInstitution}[1]{\def\ostInsitution{#1}}

% \newcommand{\ostTitleKeywordContactName}{Corresponding:} 
% \newcommand{\ostSetTitleKeywordContactName}[1]{\gdef\ostTitleKeywordContactName{#1}}  

\newcommand{\ostContacts}{foo@bar.com\textsuperscript{a}} 
\newcommand{\ostSetContacts}[1]{\def\ostContacts{#1}}

\newcommand{\ostAffiliations}{University of XY departement of Z\textsuperscript{1}, \ldots} 
\newcommand{\ostSetAffiliations}[1]{\def\ostAffiliations{#1}}

\newcommand{\ostKeywords}{Open Science, Git, R, Knitr, ggplot2, tikz}
\newcommand{\ostSetKeywords}[1]{\def\ostKeywords{#1}}

\newcommand{\ostTitleRule}{\textcolor{ostColorTitleRule}{\noindent\rule{\linewidth}{1.7pt}}}

% \newcommand{\ostTitleLogo}{\includegraphics[scale=0.3]{ost/graphics/open-science-theses-title-header-logo.pdf}} 
% \newcommand{\ostSetTitleLogo}[1]{\gdef\ostTitleLogo{#1}} 

% \newcommand{\ostTitleKeywordAffiliationName}{Affiliation:} 
% \newcommand{\ostSetTitleKeywordAffiliationName}[1]{\gdef\ostTitleKeywordAffiliationName{#1}} 

% \newcommand{\ostTitleKeywordName}{Keywords:} 
% \newcommand{\ostSetTitleKeywordName}[1]{\gdef\ostTitleKeywordName{#1}}  

\newcommand{\ostHeaderInfoFilePath}{ost/data/ostHeaderTable.csv} 
\newcommand{\ostSetHeaderInfoFilePath}[1]{\gdef\ostHeaderInfoFilePath{#1}}  

\newcommand{\ostFontAuthors}{\normalfont\sffamily\normalsize} 
% \newcommand{\ostSetFontAuthors}[1]{\gdef\ostFontAuthors{#1}} 
\ostSetFont{\ostFontAuthors}{\normalfont\sffamily\normalsize}

\newlength{\ostLengtTitleLogoColwidth} 
\setlength{\ostLengtTitleLogoColwidth}{0.23\textwidth} 

\newlength{\ostLengtTitleTitleColwidth} 
\setlength{\ostLengtTitleTitleColwidth}{0.55\textwidth} 

\newlength{\ostLengtTitleSpaceAbove}
\setlength{\ostLengtTitleSpaceAbove}{0.5\baselineskip} 

\newlength{\ostLengtTitleSpaceBelow} 
\setlength{\ostLengtTitleSpaceBelow}{0\baselineskip}  

\ifost@csvdata
   \DTLloaddb{ostHeaderInfoFromTable}{\ostHeaderInfoFilePath}
   \DTLgetvalue{\ostTitleCsv}{ostHeaderInfoFromTable}{1}{\dtlcolumnindex{ostHeaderInfoFromTable}{ostTitle}}\par%
    \newcommand{\ostMakeTitle}{% 
      \ostTitleRule\par\vspace{\ostLengtTitleSpaceAbove}
         \begin{tabular}{p{\ostLengtTitleLogoColwidth}p{\ostLengtTitleTitleColwidth}}
            \begin{minipage}{0.25\textwidth}
               \ostTitleLogo%
            \end{minipage}&%
            \begin{minipage}{0.7\textwidth} 
               \vspace{\baselineskip}
                  {\color{ostColorTitle}{{\ostFontTitle\ostTitleCsv}}}\par%
                     \begin{normalsize}\textbf{%
                        \DTLsort{ostAuthorPriorityToAppear,ostAuthorFirstName}{ostHeaderInfoFromTable} 
                        \DTLforeach{ostHeaderInfoFromTable}{%
                           \firstName=ostAuthorFirstNameShort,% 
                           \lastName=ostAuthorLastName,%
                           \id=ostAuthorAffiliationIDs}{\ifdefempty{\firstName}{}{\DTLiflastrow{\firstName\xspace\lastName\textsuperscript{\id}}{\firstName\xspace\lastName\textsuperscript{\id},~}}}
                     }\end{normalsize}\par 
                  \begin{normalsize}\textbf{\ostTitleKeywordContactName}  
                     \DTLsort{ostAuthorEmailID}{ostHeaderInfoFromTable} 
                     \DTLforeach{ostHeaderInfoFromTable}{%
                        \email=ostAuthorEmail,%
                        \id=ostAuthorEmailID}{\ifdefempty{\email}{}{\DTLiflastrow{\href{mailto:\email}{\email}\textsuperscript{\id}}{\href{mailto:\email}{\email}\textsuperscript{\id},~}}}
                  \end{normalsize}\par%
                  \begin{normalsize}\textbf{\ostTitleKeywordAffiliationName}  
                     \DTLsort{ostAffiliationIDs}{ostHeaderInfoFromTable} 
                     \DTLforeach{ostHeaderInfoFromTable}{%
                        \affiliation=ostAffiliations,%
                        \id=ostAffiliationIDs}{\ifdefempty{\affiliation}{}{\DTLiflastrow{\affiliation\textsuperscript{\id}}{\affiliation\textsuperscript{\id},~}}}
                  \end{normalsize}\par%
                  \begin{normalsize}\textbf{\ostTitleKeywordName}% 
                     \DTLsort{ostKeywords}{ostHeaderInfoFromTable} 
                     \DTLforeach{ostHeaderInfoFromTable}{\keyword=ostKeywords}{\ifdefempty{\keyword}{}{\DTLiflastrow{\keyword}{\keyword,~}}} \end{normalsize}\par%
                  \ostGitInfoLine%
            \end{minipage}
         \end{tabular}\par\vspace{\ostLengtTitleSpaceBelow}
      }
\else%
   \newcommand{\ostMakeTitle}{% 
      \begin{titlepage}
      %\CenterBackgroundPic{Bilder/PowerPlant.png}
        \vspace*{\stretch{1}}
          \ostTitleRule\par
          \vspace{1em}
          \begin{center}
            \begin{LARGE}
              {\color{ostColorTitle}{{\ostFontTitle\ostTitle}}}\par
            \end{LARGE} 
        \end{center}
        \begin{center}
          \ifdefempty{\ostAuthors}{}{\begin{normalsize}\textbf{\ostAuthors}\end{normalsize}\par}
       \end{center} 
       \begin{center}
        \begin{footnotesize} 
          \ifdefempty{\ostInsitution}{}{\begin{normalsize}\ostInsitution\end{normalsize}\par}
      \end{footnotesize} 
       \end{center}      
          \ostTitleRule\par
        \vspace*{\stretch{2}}
      \end{titlepage}

      % \ostTitleRule\par\vspace{\ostLengtTitleSpaceAbove}
         % \begin{tabular}{p{\ostLengtTitleLogoColwidth}p{\ostLengtTitleTitleColwidth}}
            % \begin{minipage}{0.25\textwidth}
               % \ostTitleLogo%
            % \end{minipage}&	
            % \begin{minipage}{0.7\textwidth} 
               % \vspace{\baselineskip}
                  % \ifdefempty{\ostContacts}{}{\begin{normalsize}\textbf{\ostTitleKeywordContactName} \ostContacts\end{normalsize}\par}
                  % \ifdefempty{\ostAffiliations}{}{\begin{normalsize}\textbf{\ostTitleKeywordAffiliationName} \ostAffiliations\end{normalsize}\par}
                  % \ifdefempty{\ostKeywords}{}{\begin{normalsize}\textbf{\ostTitleKeywordName} \ostKeywords\end{normalsize}\par}
                  % \ostGitInfoLine%
            % \end{minipage}
         % \end{tabular}\par\vspace{\ostLengtTitleSpaceBelow}
      } 
\fi% 

%% Defines the abstract %%
\RequirePackage{abstract}
\renewcommand{\abstractnamefont}{\color{ostColorAbstractHeader}\normalfont\sffamily\large\bfseries}

%Set the Environments for Textsizes etc
\newenvironment{smallpar}{\par\small}{\par}
\newenvironment{centerpar}{\par\center}{\par}
\newenvironment{hugepar}{\par\huge}{\par}

%% definitions for framed environments
\providecommand*{\placement}{}
\providecommand*{\envwidth}{}
\providecommand*{\mappath}{}
\providecommand*{\picturepath}{}
\providecommand*{\overlaytextname}{}
\providecommand*{\envlabel}{}
\providecommand*{\envcaption}{}

\define@key{ostFramedEnvOverlay}{placement}{\renewcommand*\placement{#1}}
\define@key{ostFramedEnvOverlay}{width}{\renewcommand*\envwidth{#1}}
\define@key{ostFramedEnvOverlay}{mappath}{\renewcommand*\mappath{#1}}
\define@key{ostFramedEnvOverlay}{picpath}{\renewcommand*\picturepath{#1}}
\define@key{ostFramedEnvOverlay}{overlaytext}{\renewcommand*\overlaytextname{#1}}
\define@key{ostFramedEnvOverlay}{label}{\renewcommand*\envlabel{#1}}

\presetkeys{ostFramedEnvOverlay}{placement=H, width=0.95\textwidth, label=fig:DefaultLabel}{}%

\providecommand{\ostFramedEnvOverlay}[2][]{
  \setkeys{ostFramedEnvOverlay}{#1}
  \begin{figure}[H]
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        \begin{minipage}{0.47\textwidth}%
          \begin{centerpar}
            \begin{overpic}[keepaspectratio, keepaspectratio, trim=1.2cm 5.2cm 1.2cm 5.2cm, clip, width=\textwidth]{\mappath}
              \ifdefempty{\picturepath}{ 
                \ifdefempty{\overlaytextname}{  
                  \relax
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                  }
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \includegraphics[trim=0cm 0cm 0cm 0cm, clip, width=1cm]{\picturepath} \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                  }
                \end{overpic}
              \end{centerpar}
            \end{minipage}
          };
        \end{tikzpicture}
        \captionbelow{#2}
        \label{\envlabel}
      \end{figure}
    }

\WithSuffix\providecommand\ostFramedEnvOverlay*[2][]{
  \setkeys{ostFramedEnvOverlay}{#1}
  \begin{figure*}
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        \begin{minipage}{\textwidth}%
          \begin{centerpar}
            \begin{overpic}[keepaspectratio, keepaspectratio, trim=1.2cm 5.2cm 1.2cm 5.2cm, clip, width=\textwidth]{\mappath}
              \ifdefempty{\picturepath}{ 
                \ifdefempty{\overlaytextname}{  
                  \relax
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                 }
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \includegraphics[trim=0cm 0cm 0cm 0cm, clip, width=1cm]{\picturepath} \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                 }
                \end{overpic}
              \end{centerpar}
            \end{minipage}
          };
        \end{tikzpicture}
        \captionbelow{#2}
        \label{\envlabel}
      \end{figure*}
    }

% \ostFramedEnvOverlay*[% 
	% mappath=ost/graphics/MapPelargoniumSidoides.pdf,% 
	% picpath=ost/graphics/Pelargoniumsidoides.png,%
	% overlaytext=Pelargonium sidoides,%
	% label=fig:KaplandPelargonie]{%  
	% Distribution of Pelargonium sidoides. Die maps was created from data
	% available via Global Biodiversity Information Facility database.  The
	% distribution is restricted to regions in Lesotho and South Africa.
	% (Rot).}  

% \ostFramedEnvOverlay[% 
	% mappath=ost/graphics/MapPelargoniumSidoides.pdf,%
	% label=fig:KaplandPelargonie]{%   
	% Distribution of Pelargonium sidoides. Die maps was created from data
	% available via Global Biodiversity Information Facility database.  The
	% distribution is restricted to regions in Lesotho and South Africa.
	% (Rot).}  

\define@key{ostFramedEnv}{placement}{\renewcommand*\placement{#1}}
\define@key{ostFramedEnv}{label}{\renewcommand*\envlabel{#1}}
\define@key{ostFramedEnv}{caption}{\renewcommand*\envcaption{#1}}
\presetkeys{ostFramedEnv}{placement = H, label = nolabel, caption = fillme}{}%

\providecommand\ostFramedEnv[3][]{
\setkeys{ostFramedEnv}{#1}
  \begin{figure}[H]
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        % \begin{minipage}{0.47\textwidth}
        \begin{minipage}{0.97\columnwidth}
          \begin{center} 
            #2
          \end{center}
        \end{minipage}
      };
    \end{tikzpicture}
    \captionbelow{#3}
    \label{\envlabel}
  \end{figure}
} 

% \RequirePackage{environ} 
% \RequirePackage{newenviron} 

% \NewEnviron{ostFramedEn}[1][]{%
% \setkeys{ostFramedEnv}{#1}
  % \begin{figure}[H]
    % \centering
    % \begin{tikzpicture}
      % \node[pictureframe]{%
        % \begin{minipage}{0.97\columnwidth}
          % \begin{center}  
            % \BODY
          % \end{center}
        % \end{minipage}
      % };
    % \end{tikzpicture}
    % \captionbelow{\envcaption}
    % \label{\envlabel}
  % \end{figure}
% }

% \NewEnviron{ostFramedEn*}[1][]{%
% \setkeys{ostFramedEnv}{#1}
  % \begin{figure*}[\placement]
    % \centering
    % \begin{tikzpicture}
      % \node[pictureframe]{%
        % \begin{minipage}{0.98\textwidth} 
          % \centering
            % \BODY
        % \end{minipage}
      % };
    % \end{tikzpicture}
    % \captionbelow{\envcaption}
    % \label{\envlabel}
  % \end{figure*}
% }

% \newenviron{ostFramedEnv*}[1][]{%
% \setkeys{ostFramedEnv}{#1}
  % \begin{figure}[H]
    % \centering
    % \begin{tikzpicture}
      % \node[pictureframe]{%
        % \begin{minipage}{0.97\columnwidth}
          % \begin{center}  
            % \ostFramedEnvNbody
          % \end{center}
        % \end{minipage}
      % };
    % \end{tikzpicture}
    % \captionbelow{\envcaption}
    % \label{\envlabel}
  % \end{figure}
% }

\WithSuffix\providecommand\ostFramedEnv*[3][]{%
\setkeys{ostFramedEnv}{#1}
  \begin{figure*}[\placement]
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        \begin{minipage}{0.98\textwidth}
          \begin{center} 
            #2
          \end{center}
        \end{minipage}
      };
    \end{tikzpicture}
    \captionbelow{#3}
    \label{\envlabel}
  \end{figure*}
} 

% Usage: 

% \ostFramedEnv[label=type:name]{%
  % % Content here
% }{Caption here}

% Example usage:  

% \ostFramedEnv*[label=fig:distmatwo]{   
% <<distmap_two, fig.width=10, fig.height=5, echo=FALSE, message=FALSE>>=   
  % ost_distmap(species=c('Accipiter erythronemius', 'Junco hyemalis', 'Aix sponsa'))
% @  
% }{Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean
  % commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis
  % dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec,
  % pellentesque eu, pretium quis, sem.}

\define@key{ostTableEnv}{placement}{\renewcommand*\placement{#1}}
\define@key{ostTableEnv}{label}{\renewcommand*\envlabel{#1}}
\presetkeys{ostTableEnv}{placement = H, label = nolabel}{}%

\providecommand\ostTableEnv[3][]{
\setkeys{ostTableEnv}{#1}
\begin{table}[H]
% Label tab:test_plot_two 
  \centering
  \label{\envlabel}
  \caption{#3}
  {\small  
    #2
  }
\end{table} 
} 

\WithSuffix\providecommand\ostTableEnv*[3][]{
\setkeys{ostTableEnv}{#1}
\begin{table*}
% Label tab:test_plot_two 
  \centering
  \label{\envlabel}
  \caption{#3}
  {\small  
    #2
  }
\end{table*} 
} 

% \lstnewenvironment{\ostCodeEnv}{\noindent\minipage{\columnwidth}}{\endminipage} 

\lstnewenvironment{ostCodeEnv}[1][]{
  \lstset{#1}
}{
  \relax
} 

% usage: 

% \begin{ostCodeEnv}[options]
  % a + b = c
% \end{ostCodeEnv}

% example usage: 

% \begin{ostCodeEnv}[language = Ruby, label = code:testlabel]
  % a + b = c
% \end{ostCodeEnv}


%%%-------------------------------------------------%%%
%%% Typographical options of the headings %%%
%%%-------------------------------------------------%%%

\RequirePackage[noindentafter,calcwidth]{titlesec}  

\ifost@sectionnumbers%  
  \titleformat{\part}[display]%
     {\normalfont\sffamily\Large}
       {%\Huge\textsc{\chaptertitlename}
         \hfill\fontsize{110}{70}\selectfont\color{lightgray}\textbf\thepart}
           {-2ex}
             {\filleft\fontsize{50}{70}\selectfont\textbf}
  [\vspace*{4pc}\thispagestyle{empty}]

  \titleformat{\chapter}[display]
  {\color{ostColorChapterHeader}\normalfont\huge\bfseries}{\thechapter}{20pt}{\Huge}
  \titlespacing*{\chapter}{0pt}{50pt}{40pt} 

  \titleformat{\section}
   {\color{ostColorSectionHeader}\normalfont\sffamily\Large\bfseries}{\thesection}{0.5em}{}
   \titlespacing*{\section}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \AtBeginDocument{\renewcommand*{\refname}{\vspace*{-\baselineskip}}}

   \titleformat{\subsection}
   {\color{ostColorSubsectionHeader}\normalfont\sffamily\large\bfseries}{\thesubsection}{0.5em}{}
   \titlespacing*{\subsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\subsubsection}[runin]
   {\color{ostColorSubsectionHeader}\normalfont\sffamily\normalsize\bfseries}{\thesubsubsection}{0.5em}{}
   \titlespacing*{\subsubsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\paragraph}[runin]
   {\color{ostColorParagraphHeader}\normalfont\sffamily\normalsize\bfseries}{\theparagraph}{0.5em}{}
   \titlespacing*{\paragraph}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
\else%  
  \titleformat{\part}[display]%
     {\normalfont\sffamily\Large}
       {%\Huge\textsc{\chaptertitlename}
         \hfill\fontsize{110}{70}\selectfont\color{lightgray}\textbf\thepart}
           {-2ex}
             {\filleft\fontsize{50}{70}\selectfont\textbf}
  [\vspace*{4pc}\thispagestyle{empty}]

  \titleformat{\chapter}[display]
  {\color{ostColorChapterHeader}\normalfont\huge\bfseries}{}{20pt}{\Huge}
  \titlespacing*{\chapter}{0pt}{50pt}{40pt} 

  \titleformat{\section}
  {\color{ostColorSectionHeader}\normalfont\sffamily\Large\bfseries}{}{0em}{}
  \titlespacing*{\section}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \AtBeginDocument{\renewcommand*{\refname}{\vspace*{-\baselineskip}}}

  \titleformat{\subsection}
  {\color{ostColorSubsectionHeader}\normalfont\sffamily\large\bfseries}{}{0em}{}
  \titlespacing*{\subsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\subsubsection}[runin]
  {\color{ostColorSubsectionHeader}\normalfont\sffamily\normalsize\bfseries}{}{0em}{}
  \titlespacing*{\subsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\paragraph}[runin]
  {\color{ostColorParagraphHeader}\normalfont\sffamily\normalsize\bfseries}{}{0em}{}
  \titlespacing*{\paragraph}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
\fi%

% Note: This are the defaults
% \titleformat{\chapter}[display]
% {\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge} 

% \titleformat{\section} 
% {\normalfont\Large\bfseries}{\thesection}{1em}{} 

% \titleformat{\subsection}
% {\normalfont\large\bfseries}{\thesubsection}{1em}{} 

% \titleformat{\subsubsection}
% {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{} 

% \titleformat{\paragraph}[runin]
% {\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
% \titleformat{\subparagraph}[runin]
% {\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}
% \titlespacing*{\chapter} {0pt}{50pt}{40pt}
% \titlespacing*{\section} {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
% \titlespacing*{\subsection} {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
% \titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
% \titlespacing*{\paragraph} {0pt}{3.25ex plus 1ex minus .2ex}{1em}
% \titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}

% try to get a nice appendix section for graphics and tables 
\newenvironment{ostAppendix}{ 
  \titleformat{\chapter}[display]
  {\normalfont\huge\bfseries}{}{20pt}{\Huge}
  \titlespacing*{\chapter}{0pt}{50pt}{40pt} 


\titleformat{\section}
  {\FloatBarrier\color{ostColorSectionHeader}\normalfont\sffamily\large\bfseries}{\thesection}{0.5em}{}
\titlespacing*{\section}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}   
  \newpage 
  \appendix  
}{\relax}
 
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
\fi 

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
