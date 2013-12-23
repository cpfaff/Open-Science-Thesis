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

\ProvidesClass{open-science-thesis}[2013/12/23 version 0.2 LaTeX class of the Open-Science-Thesis]

\RequirePackage{xkeyval} 

\define@boolkey[KV]{open-science-thesis}[ost@]{linenumbers}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{color}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{blue}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{orange}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{print}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{fancytocs}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{parttocs}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{backroundimage}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{gitinfo}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{sectionnumbers}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{autolayout}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{reversepagelayout}[false]{}  
\define@boolkey[KV]{open-science-thesis}[ost@]{resetdefaultclassoptions}[false]{}  
\define@boolkey[KV]{open-science-thesis}[ost@]{parindent}[false]{}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{scrbook}}

\presetkeys{open-science-thesis}{%
   linenumbers=false, 
   color=false, 
   blue=false,
   orange=true,
   print=false, 
   fancytocs=true,
   parttocs=true,
   backroundimage=false,
   gitinfo=false, 
   sectionnumbers=true,
   autolayout=true,
   reversepagelayout=false, 
   resetdefaultclassoptions=false, 
   parindent=false,
}{} 

\ProcessOptionsX[KV]<open-science-thesis>


\ifost@resetdefaultclassoptions%
  \LoadClass{scrbook}   
\else% 
  \ifost@autolayout  
    \LoadClass[12pt, headings=small, captions=tableheading, DIV=calc]{scrbook}   
  \else%
    \LoadClass[12pt, headings=small, captions=tableheading, DIV=17]{scrbook}
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
   \colorlet{ostColorTocRule}{LightGray}
   \colorlet{ostColorSubtitle}{black}
   \colorlet{ostColorAuthors}{black}
   \colorlet{ostColorInstitution}{black} 
   \colorlet{ostColorDate}{black} 
   \colorlet{ostColorTitle}{black}

   \colorlet{ostColorPartHeader}{black} 
   \colorlet{ostColorPartHeaderNumber}{LightGray}  

   \ifost@orange% 

     \colorlet{ostColorChapterHeader}{DarkOrange} 
     \colorlet{ostColorSectionHeader}{DarkOrange}  
     \colorlet{ostColorSubsectionHeader}{DarkOrange}
     \colorlet{ostColorSubSubsectionHeader}{DarkOrange}
     \colorlet{ostColorParagraphHeader}{DarkGrey}
   \else
     \relax
   \fi

  \ifost@blue  
     % \xdefinecolor{ostColorTitle}{RGB}{8,81,156} 

     \xdefinecolor{ostColorChapterHeader}{RGB}{8,81,156} 
     \xdefinecolor{ostColorSectionHeader}{RGB}{49,130,189} 
     \xdefinecolor{ostColorSubsectionHeader}{RGB}{107,174,214} 
     \xdefinecolor{ostColorSubSubsectionHeader}{RGB}{107,174,214} 
     \colorlet{ostColorParagraphHeader}{DarkGrey}
  \else
    \relax
  \fi

  \colorlet{ostColorChapterHeaderNumber}{gray}
  \colorlet{ostColorSectionHeaderNumber}{gray}
  \colorlet{ostColorSubsectionHeaderNumber}{gray}
  \colorlet{ostColorSubSubsectionHeaderNumber}{gray}
  \colorlet{ostColorParagraphHeaderNumber}{gray}

   \colorlet{ostColorLettrine}{DarkGray}  

   \colorlet{ostColorLineNumbers}{DarkGray} 

   \colorlet{ostColorFooterRule}{LightGray}
   \colorlet{ostColorPageNumbering}{DarkGray}
    
   \colorlet{ostColorLinks}{gray}

  \xdefinecolor{ostColor@ListingBackground}{gray}{.97} 
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
   \colorlet{ostColorTocRule}{black}
   \colorlet{ostColorTitle}{black} 

   \colorlet{ostColorSubtitle}{black}
   \colorlet{ostColorAuthors}{black}
   \colorlet{ostColorInstitution}{black} 
   \colorlet{ostColorDate}{black}  

   \colorlet{ostColorPartHeader}{black}
   \colorlet{ostColorPartHeaderNumber}{black}

   \colorlet{ostColorChapterHeader}{black}
   \colorlet{ostColorChapterHeaderNumber}{black}

   \colorlet{ostColorSectionHeader}{black}
   \colorlet{ostColorSectionHeaderNumber}{black}

   \colorlet{ostColorSubsectionHeader}{black}
   \colorlet{ostColorSubsectionHeaderNumber}{black}
   
   \colorlet{ostColorSubSubsectionHeader}{black}
   \colorlet{ostColorSubSubsectionHeaderNumber}{black}

   \colorlet{ostColorParagraphHeader}{black}
   \colorlet{ostColorParagraphHeaderNumber}{black}

   \colorlet{ostColorLettrine}{black}
   
   \colorlet{ostColorLineNumbers}{black} 
   
   \colorlet{ostColorFooterRule}{black}
   \colorlet{ostColorFullLeftFooter}{black}   
   \colorlet{ostColorPageNumbering}{black} 

   \colorlet{ostColorLinks}{black}

   \xdefinecolor{ostColor@ListingBackground}{gray}{.97} 
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

\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\chapterpagestyle}{fancy}
\fancyhf{}

%% Set the footer commands
\newcommand{\ostPageNumbering}{\color{ostColorPageNumbering}{\normalsize{\textbf{\textendash\hspace{1mm}{\thepage}\hspace{1mm}\textendash}}}}

\newcommand{\ostSetPageNumbering}[1]{\def\ostPageNumbering{#1}}

\if@twoside% 
  \fancyfoot[RO, LE]{\ostPageNumbering}
\else%
  \fancyfoot[C]{\ostPageNumbering}
\fi%

%% Set the footer rules 
\newcommand{\ostFooterRuleColor}{ostColorFooterRule} 
\newcommand{\ostSetFooterRuleColor}[1]{\gdef\ostFooterRuleColor{#1}}

\newlength{\ostLengthHeaderRuleWidth} 
\setlength{\ostLengthHeaderRuleWidth}{0pt} 
\renewcommand{\headrulewidth}{\ostLengthHeaderRuleWidth}

\newlength{\ostLengthFooterRuleWidth}
\setlength{\ostLengthFooterRuleWidth}{0.0pt} 
\renewcommand{\footrulewidth}{\ostLengthFooterRuleWidth} 

\patchcmd{\footrule}{\hrule}{\color{\ostFooterRuleColor}\hrule}{}{}


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

% override lists environment definitions with more compact versions
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
\RequirePackage{eso-pic} 
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

%% the table of contents 
\newenvironment{ostContentTables}{%
  \hypersetup{linkcolor=black}
}{%
  \hypersetup{linkcolor=ostColorLinks}
}

\newenvironment{ostContentTablesPartials}{%
  \hypersetup{linkcolor=black}
}{%
  \hypersetup{linkcolor=ostColorLinks}
}

%% Title header defaults %% 

% Define all fonts

\newcommand{\ostFontTitle}{\normalfont\sffamily\Huge\bfseries}  
\newcommand{\ostFontSubtitle}{\normalfont\sffamily\normalsize\bfseries}  
\newcommand{\ostFontAuthors}{\normalfont\sffamily\normalsize}   
\newcommand{\ostFontInstitution}{\normalfont\sffamily\normalsize}    
\newcommand{\ostFontDate}{\normalfont\sffamily\small}    

% Define all lengths

\newlength{\ostLengthOfTitleBeforeReduceFontSize} 
\setlength{\ostLengthOfTitleBeforeReduceFontSize}{0.6\textwidth} 

\newlength{\ostLengthTitleSpacerTitleRuleUpper} 
\setlength{\ostLengthTitleSpacerTitleRuleUpper}{2em} 

\newlength{\ostLengthTitleSpacerTitleRuleLower} 
\setlength{\ostLengthTitleSpacerTitleRuleLower}{2em} 

\newlength{\ostLengthTitleRuleWidth}
\setlength{\ostLengthTitleRuleWidth}{1.7pt}

\newcommand{\ostTitleStretchAbove}{\vspace*{\stretch{1}}}  
\newcommand{\ostSetTitleStretchAbove}[1]{\def\ostTitleStretchAbove{#1}} 

\newcommand{\ostTitleStretchBelow}{\vspace*{\stretch{2}}} 
\newcommand{\ostSetTitleStretchBelow}[1]{\def\ostTitleStretchBelow{#1}} 

\newcommand{\ostTitleSpacerTitleRuleUpper}{\vspace{\ostLengthTitleSpacerTitleRuleUpper}}
\newcommand{\ostTitleSpacerTitleRuleLower}{\vspace{\ostLengthTitleSpacerTitleRuleLower}}

% Define aesthetics 

\newcommand{\ostTitlePageBackgroundPic}[1]{
  \AddToShipoutPicture*{\AtPageCenter{%
    \makebox(0,0){\includegraphics[width=\paperwidth]{#1}
}}}}

\newcommand{\ostTitleRule}{\textcolor{ostColorTitleRule}{\noindent\rule{\linewidth}{\ostLengthTitleRuleWidth}}}

% Define all fields that are available and their default values

\newcommand{\ostTitle}{The open science thesis title} 
\newcommand{\ostSetTitle}[1]{%
  \def\ostTitle{#1} 
  \newlength{\ost@LenghtTitle} 
  \settowidth{\ost@LenghtTitle}{#1}   
  \ifdim\ost@LenghtTitle>\ostLengthOfTitleBeforeReduceFontSize
    \ostSetFont{\ostFontTitle}{\normalfont\sffamily\LARGE\bfseries}
  \else 
    \ostSetFont{\ostFontTitle}{\normalfont\sffamily\Huge\bfseries}
  \fi 
} 

\newcommand{\ostSubtitle}{This is a subtitle} 
\newcommand{\ostSetSubtitle}[1]{\def\ostSubtitle{#1}}

\newcommand{\ostAuthors}{Author one\textsuperscript{1,2,a}, Author two\textsuperscript{2}, \ldots} 
\newcommand{\ostSetAuthors}[1]{\def\ostAuthors{#1}}

\newcommand{\ostInsitution}{University of XY, Department Z} 
\newcommand{\ostSetInstitution}[1]{\def\ostInsitution{#1}}

\newcommand{\ostDate}{\today} 
\newcommand{\ostSetDate}[1]{\def\ostDate{#1}}

\ifost@backroundimage%
  \newcommand{\ostMakeTitle}{% 
    \begin{titlepage}
      \vspace*{\stretch{1}}
      % \ostTitleStretchAbove{}
        % \ostTitleRule%
          % \ostTitleSpacerTitleRuleUpper{}
            {\centering%
               \ostTitlePageBackgroundPic{ost/graphics/ostTitlePageBackground.pdf}
              {\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\ostFontTitle\ostTitle}}\par}}   
              {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\ostFontSubtitle\ostSubtitle}}\par}}     
              {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\ostFontAuthors\ostAuthors}}\par}}
              {\ifdefempty{\ostInsitution}{\relax}{\color{ostColorInstitution}{{\ostFontInstitution\ostInsitution}}}\par}
              {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\ostFontDate\ostDate}}}\par}
              \vspace{-1\baselineskip}
            }      
          % \ostTitleSpacerTitleRuleLower{} 
        % \ostTitleRule%
      % \ostTitleStretchBelow{}
      \vspace*{\stretch{1}}
  \end{titlepage}
  }
\else%
  \newcommand{\ostMakeTitle}{% 
    \begin{titlepage}
      \ostTitleStretchAbove{}
        \ostTitleRule%
          \ostTitleSpacerTitleRuleUpper{}
            {\centering%
              {\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\ostFontTitle\ostTitle}}\par}}   
              {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\ostFontSubtitle\ostSubtitle}}\par}}     
              {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\ostFontAuthors\ostAuthors}}\par}}
              {\ifdefempty{\ostInsitution}{\relax}{\color{ostColorInstitution}{{\ostFontInstitution\ostInsitution}}}\par}
              {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\ostFontDate\ostDate}}}\par}
              \vspace{-1\baselineskip}
            }      
          \ostTitleSpacerTitleRuleLower{} 
        \ostTitleRule%
      \ostTitleStretchBelow{}
  \end{titlepage}
  }
\fi%

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

  \ifost@parttocs%
    \titleformat{\part}[display]
    {\normalfont\sffamily\Large}{\hfill{\fontsize{110}{70}\selectfont\textcolor{ostColorPartHeaderNumber}{\textbf\thepart}}}{-2ex}
    {\filleft\fontsize{50}{70}\selectfont\textbf}
    [\vspace*{4pc}{\normalfont\large \begin{ostContentTablesPartials}\startcontents\printcontents{p-}{0}{}\end{ostContentTablesPartials}}\thispagestyle{empty}]
  \else%
    \titleformat{\part}[display]%
    {\normalfont\sffamily\Large}
    {%\Huge\textsc{\chaptertitlename}
    \hfill\fontsize{110}{70}\selectfont\color{ostColorPartHeaderNumber}\textbf\thepart}
    {-2ex}
    {\filleft\fontsize{50}{70}\selectfont\textbf}
    [\vspace*{4pc}\thispagestyle{empty}]
  \fi%

  \titleformat{\chapter}
  {\color{ostColorChapterHeader}\normalfont\huge\bfseries}{\color{ostColorChapterHeaderNumber}\thechapter}{0.5em}{\Huge}
  \titlespacing*{\chapter}{0pt}{50pt}{40pt} 

  \titleformat{\section}
  {\color{ostColorSectionHeader}\normalfont\sffamily\Large\bfseries}{\color{ostColorSectionHeaderNumber}\thesection}{0.5em}{}
   \titlespacing*{\section}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \AtBeginDocument{\renewcommand*{\refname}{\vspace*{-\baselineskip}}}

   \titleformat{\subsection}
   {\color{ostColorSubsectionHeader}\normalfont\sffamily\large\bfseries}{\color{ostColorSubsectionHeaderNumber}\thesubsection}{0.5em}{}
   \titlespacing*{\subsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\subsubsection}
   {\color{ostColorSubSubsectionHeader}\normalfont\sffamily\normalsize\bfseries}{\color{ostColorSubSubsectionHeaderNumber}\thesubsubsection}{0.5em}{}
   \titlespacing*{\subsubsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\paragraph}[runin]
   {\color{ostColorParagraphHeader}\normalfont\sffamily\normalsize\bfseries}{\color{ostColorParagraphHeaderNumber}\theparagraph}{0.5em}{}
   \titlespacing*{\paragraph}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
\else%  

  \ifost@parttocs%
    \titleformat{\part}[display]
    {\normalfont\sffamily\Large}{\hfill{\fontsize{110}{70}\selectfont\textcolor{ostColorPartHeaderNumber}{\textbf\thepart}}}{-2ex}
    {\filleft\fontsize{50}{70}\selectfont\textbf}
    [\vspace*{4pc}{\normalfont\large \begin{ostContentTablesPartials}\startcontents\printcontents{p-}{0}{}\end{ostContentTablesPartials}}\thispagestyle{empty}]
  \else%
    \titleformat{\part}[display]%
    {\normalfont\sffamily\Large}
    {%\Huge\textsc{\chaptertitlename}
    \hfill\fontsize{110}{70}\selectfont\color{ostColorPartHeaderNumber}\textbf\thepart}
    {-2ex}
    {\filleft\fontsize{50}{70}\selectfont\textbf}
    [\vspace*{4pc}\thispagestyle{empty}]
  \fi%

  \titleformat{\chapter}
  {\color{ostColorChapterHeader}\normalfont\huge\bfseries}{}{0em}{\Huge}
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

  \titleformat{\subsubsection}
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
% \newenvironment{ostAppendix}{\relax}{\relax}

\ifost@fancytocs%
  \RequirePackage{titletoc}  

  \contentsmargin{1.8em} 

  \newcommand{\ostTocRule}{\textcolor{ostColorTocRule}{\noindent\rule{\linewidth}
  {\ostLengthTitleRuleWidth}}}

  \titlecontents{part}[0em]{\addvspace{2pc}}{\contentslabel{0em}}
  {\Large\bfseries}{\titlerule*{}\bfseries\contentspage}[\vspace{-0.7em}\ostTocRule]

  \titlecontents{chapter}[1.5em]{\addvspace{0.7pc}}{\bfseries\contentslabel{1em}}
  {\hspace*{-1.5em}}{\titlerule*{}\contentspage}

  \titlecontents{p-chapter}[1.5em]{\addvspace{0.7pc}}{\bfseries\contentslabel{1em}}
  {\hspace*{-1.5em}}{\titlerule*[0.7em]{.}\contentspage}

  \titlecontents{section}[3em]{}{\contentslabel{1.6em}}{}
  {\titlerule*[0.7em]{.}\contentspage}
  
  \titlecontents{p-section}[3em]{}{\contentslabel{1.6em}}{}
  {\titlerule*[0.7em]{.}\contentspage}

  \titlecontents{subsection}[5em]{}{\contentslabel{2.3em}}{}
  {\titlerule*[0.7em]{.}\contentspage}

  \titlecontents{p-subsection}[5em]{}{\contentslabel{2.3em}}{}
  {\titlerule*[0.7em]{.}\contentspage}

  \titlecontents{figure}[2em]{\addvspace{1pc}}{\contentslabel{2em}}{}
  {~\titlerule*[0.7em]{.}\contentspage}[]

  \titlecontents{table}[2em]{\addvspace{1pc}}{\contentslabel{2em}}{}
  {\titlerule*[0.7em]{.}\contentspage}[]
\else%
  \relax%
\fi%


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
   colorlinks=true,%
   linkcolor=ostColorLinks,
   citecolor=ostColorLinks,%
   filecolor=ostColorLinks,%
   menucolor=ostColorLinks,%	
   urlcolor=ostColorLinks,%
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
% \ifost@autolayout%
   % \AtBeginDocument{\KOMAoptions{DIV=last}}
% \else% 
   % \relax
% \fi% 

% \ifost@reversepagelayout%
   % \AtBeginDocument{
      % \let\tmp\evensidemargin%
      % \let\evensidemargin\oddsidemargin%
      % \let\oddsidemargin\tmp%
      % \reversemarginpar%
   % }
% \else% 
   % \relax
% \fi%
