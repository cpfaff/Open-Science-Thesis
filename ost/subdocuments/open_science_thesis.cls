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

\ProvidesClass{open-science-thesis}[2014/01/06 version 0.6 LaTeX class of the Open-Science-Thesis]

\RequirePackage{xkeyval} 

\define@key[KV]{open-science-thesis}{language}{\PassOptionsToPackage{#1}{babel}}

\define@key[KV]{open-science-thesis}{style}{\PassOptionsToPackage{style = #1}{biblatex}}
\define@key[KV]{open-science-thesis}{bibstyle}{\PassOptionsToPackage{bibstyle = #1}{biblatex}}
\define@key[KV]{open-science-thesis}{citestyle}{\PassOptionsToPackage{citestyle = #1}{biblatex}}
\define@key[KV]{open-science-thesis}{natbib}{\PassOptionsToPackage{natbib = #1}{biblatex}}
\define@key[KV]{open-science-thesis}{backend}{\PassOptionsToPackage{backend = #1}{biblatex}}

\newif\ifost@setspacing% 

\define@key[KV]{open-science-thesis}{linespacing}{\PassOptionsToPackage{#1}{setspace}\ost@setspacingtrue}
\define@boolkey[KV]{open-science-thesis}[ost@]{sensitivespacing}[false]{}

\define@boolkey[KV]{open-science-thesis}[ost@]{linenumbers}[false]{}

\newif\ifost@cmyk% 
\newif\ifost@rgb% 

\define@choicekey*[KV]{open-science-thesis}{colormode}[\val\nr]{cmyk, rgb}{%
  \ifcase\nr\relax%
    \ost@cmyktrue%
  \or%
    \ost@rgbtrue%
  \fi%
}

\define@boolkey[KV]{open-science-thesis}[ost@]{fancytocs}[false]{}

\newif\ifost@addtoctopart% 
\newif\ifost@addtoctochapter% 
\newif\ifost@addstopcontenttoappendix% 

\define@choicekey*[KV]{open-science-thesis}{toctosection}[\val\nr]{part, chapter, false}{%
  \ifcase\nr\relax%
    \ost@addtoctoparttrue%
    \ost@addstopcontenttoappendixfalse% 
  \or%
    \ost@addtoctochaptertrue%
    \ost@addstopcontenttoappendixtrue% 
  \or%
    \ost@addtoctopartfalse%
    \ost@addtoctochapterfalse%
    \ost@addstopcontenttoappendixfalse% 
  \fi%
}

\newif\ifost@titlepagebackgroundimage%
\newif\ifost@titlepagehorizontal%
\newif\ifost@titlepageplain%
\newif\ifost@titlepagevertical%

\define@choicekey*[KV]{open-science-thesis}{titlepagetheme}[\val\nr]{image, horizontal, plain, vertical}{%
  \ifcase\nr\relax%
    \ost@titlepagebackgroundimagetrue%
  \or% 
    \ost@titlepagehorizontaltrue%
  \or% 
    \ost@titlepageplaintrue%
  \or%
    \ost@titlepageverticaltrue%
  \fi%
}

\newif\ifost@libertine%
\newif\ifost@lmodern%
\newif\ifost@times%
\newif\ifost@palatino%
\newif\ifost@utopia%

\define@choicekey*[KV]{open-science-thesis}{fontchoice}[\val\nr]{libertine, lmodern, times, palatino, utopia, false}{%
  \ifcase\nr\relax%
    \ost@libertinetrue%
  \or% 
    \ost@lmoderntrue%
  \or% 
    \ost@timestrue%
  \or% 
    \ost@palatinotrue%
  \or% 
    \ost@utopiatrue%
  \or% 
    \relax%
  \fi%
}

\define@boolkey[KV]{open-science-thesis}[ost@]{gitinfo}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{sectionnumbers}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{autolayout}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{resetdefaultclassoptions}[false]{}  
\define@boolkey[KV]{open-science-thesis}[ost@]{parindent}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{fancyhf}[false]{}

\define@boolkey[KV]{open-science-thesis}[ost@]{color}[false]{}

\newif\ifost@orange% 
\newif\ifost@blue%
\newif\ifost@green%
\newif\ifost@red%

\define@choicekey*[KV]{open-science-thesis}{colortheme}[\val\nr]{orange, blue, green, red}{%
  \ifcase\nr\relax% 
    \ost@colortrue%
    \ost@orangetrue%
  \or%
    \ost@colortrue%
    \ost@bluetrue%
  \or%
    \ost@colortrue%
    \ost@greentrue%
  \or%
    \ost@colortrue%
    \ost@redtrue%
  \fi%
}

\newif\ifost@revision

\define@choicekey*[KV]{open-science-thesis}{revision}[\val\nr]{true, false}{%
  \ifcase\nr\relax% 
    \ost@revisiontrue%
    \ost@linenumberstrue%
  \fi%
}

\define@boolkey[KV]{open-science-thesis}[ost@]{mathsupport}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{symbolsupport}[false]{}

\define@boolkey[KV]{open-science-thesis}[ost@]{compactlist}[false]{}
\define@boolkey[KV]{open-science-thesis}[ost@]{fancylist}[false]{}

\newif\ifost@raggedright%
\newif\ifost@raggedleft%
\newif\ifost@centered%

\define@choicekey*[KV]{open-science-thesis}{justification}[\val\nr]{raggedright, raggedleft, centered}{%
  \ifcase\nr\relax%
    \ost@raggedrighttrue%
  \or% 
    \ost@raggedlefttrue%
  \or%
    \ost@centeredtrue%
  \fi%
}

\newif\ifost@floatbarrier%
\newif\ifost@floatbarrierpart%
\newif\ifost@floatbarrierchapter%
\newif\ifost@floatbarriersection%

\define@choicekey*[KV]{open-science-thesis}{addfloatbarrierto}[\val\nr]{part, chapter, section}{%
  \ifcase\nr\relax%
    \ost@floatbarrierparttrue%
    \ost@floatbarriertrue%
  \or% 
    \ost@floatbarrierchaptertrue%
    \ost@floatbarriertrue%
  \or%
    \ost@floatbarriersectiontrue%
    \ost@floatbarriertrue%
  \fi%
}

\define@boolkey[KV]{open-science-thesis}[ost@]{floatafter}[false]{}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{scrbook}}

\presetkeys{open-science-thesis}{%
  linenumbers=false, 
  color=true, 
  colortheme=blue,
  colormode=rgb, 
  fancytocs=true, 
  fancyhf=true,
  toctosection=false,
  titlepagetheme=vertical,
  gitinfo=false, 
  sectionnumbers=true,
  fontchoice=libertine, 
  autolayout=true,
  resetdefaultclassoptions=false, 
  parindent=true,
  revision=false,
  mathsupport=true,
  symbolsupport=true,
  compactlist=true,
  fancylist=true,
  natbib=true,
  backend=biber,
  style=authoryear,
  language=english,
  sensitivespacing=true,
  floatafter=false,
}{}

\ProcessOptionsX[KV]<open-science-thesis>

\ifost@revision
  \LoadClass[oneside, 12pt, headings=small, captions=tableheading, DIV=calc]{scrbook}   
\else
  \ifost@resetdefaultclassoptions%
    \LoadClass{scrbook}   
  \else% 
    \ifost@autolayout  
      \LoadClass[12pt, headings=small, captions=tableheading, DIV=calc]{scrbook}   
    \else%
      \LoadClass[12pt, headings=small, captions=tableheading]{scrbook}
      \RequirePackage{geometry}
    \fi% 
  \fi%
\fi% 

\ifost@setspacing
  \RequirePackage{setspace}
\fi

% enable and disable chaptertocs as it is not required 
% to have them everywhere even if chapter toc is enabled
\newif\ifost@chapterwithtoc%
\ost@chapterwithtoctrue

%%%-------------------------------------------------%%%
%%% Input encodings fonts and symbols %%%
%%%-------------------------------------------------%%% 

%% input and font encoding %%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{luainputenc}

%% Fonts and math symbols %%

\ifost@libertine%
  \RequirePackage{libertine}
  \RequirePackage[libertine]{newtxmath}
\fi%

\ifost@lmodern%
  \RequirePackage{lmodern}
\fi%

\ifost@times%
  \RequirePackage{mathptmx}
  \RequirePackage[scaled=.90]{helvet}
  \RequirePackage{courier}
\fi%

\ifost@palatino%
  \RequirePackage{mathpazo}
  \RequirePackage[scaled=.95]{helvet}
  \RequirePackage{courier}
\fi%

\ifost@utopia%
  \RequirePackage{fourier}
\fi%

\ifost@mathsupport%
  \RequirePackage{amsmath} 
  \RequirePackage{amssymb}
  \RequirePackage{mathtools}
\fi%

\ifost@symbolsupport%
  \RequirePackage{wasysym}
  \RequirePackage{marvosym}
  \RequirePackage{textcomp}
\fi%

%%%-------------------------------------------------%%%
%%% Patches and tools %%%
%%%-------------------------------------------------%%%

\RequirePackage{fixltx2e}
\RequirePackage{scrhack}
\RequirePackage{etex} 
\RequirePackage{etoolbox} 
\reserveinserts{30}
\RequirePackage{morewrites}
\RequirePackage{calc}
\RequirePackage{xifthen}  
\RequirePackage{ifluatex} 
\RequirePackage{datatool} 
\RequirePackage{suffix}

%%%-------------------------------------------------%%%
%%% Helpers (unify commands to use in style file) %%%
%%%-------------------------------------------------%%%

\newcommand{\ostSetContent}[2]{\expandafter\def\csname ost#1\endcsname{#2}}
\newcommand{\ostSetLength}[2]{\setlength{\csname ostLength#1\endcsname}{#2}}
\newcommand{\ostSetHeight}[2]{\setlength{\csname ostHeight#1\endcsname}{#2}}
\newcommand{\ostSetColor}[2]{\colorlet{ostColor#1}{#2}} 
\newcommand{\ostSaveColor}[1]{\colorlet{ostColor@savecolor}{#1}} 
\newcommand{\ostSaveColorTo}[2]{\colorlet{#1}{#2}} 
\newcommand{\ostRestoreColor}[1]{\colorlet{#1}{ostColor@savecolor}} 
\newcommand{\ostDefineColor}[3]{\xdefinecolor{#1}{#2}{#3}}
\newcommand{\ostSetOpacity}[2]{\expandafter\def\csname ostOpacity#1\endcsname{#2}}
\newcommand{\ostSetFont}[2]{\expandafter\def\csname ostFont#1\endcsname{#2}}  

% usage:

%%%-------------------------------------------------%%%
%%% Language adaption of the document %%%
%%%-------------------------------------------------%%%

\RequirePackage{babel} 
\RequirePackage[autostyle]{csquotes}  

% usage:
%  \enquote{} to put a text in the right quotes

%%%-------------------------------------------------%%%
%%% Lipsum %%%
%%%-------------------------------------------------%%%

\RequirePackage{lipsum}

%%%-------------------------------------------------%%%
%%% Improved ragged %%%
%%%-------------------------------------------------%%%

\RequirePackage{ragged2e}
\let\raggedright\RaggedRight%
\let\raggedleft\RaggedLeft%
\ifost@raggedright%
  \AtBeginDocument{%
    \raggedright%
  }
\fi%
\ifost@raggedleft%
  \AtBeginDocument{%
    \raggedleft%
  }
\fi%

%%%-------------------------------------------------%%%
%%% Color options %%%
%%%-------------------------------------------------%%%

\ifost@cmyk%
  \RequirePackage[svgnames,cmyk, pdftex, tables]{xcolor}  
\fi%

\ifost@rgb%
  \RequirePackage[svgnames,rgb, pdftex, tables]{xcolor} 
\fi% 

\colorlet{ostColorGlsLinkColor}{black}

\ifost@color%  
  \colorlet{ostColorTitleRule}{LightGray} 
  \colorlet{ostColorTitleRuleVertical}{LightGray}  
  \colorlet{ostColorTextOnBar}{gray}  
  \colorlet{ostColorTitleOverlay}{white} 
  \colorlet{ostColorImageFrame}{LightGray} 
  \colorlet{ostColorTocRule}{LightGray}
  \colorlet{ostColorPartialToc}{black} 
  \colorlet{ostColorAuthors}{black}
  \colorlet{ostColorInstitution}{black} 
  \colorlet{ostColorAdvisors}{black} 
  \colorlet{ostColorDate}{black} 
  \colorlet{ostColorMarginNote}{DarkGray}
  \colorlet{ostColorAdvisors}{gray}
  \colorlet{ostColorPartHeader}{black} 
  \colorlet{ostColorPartHeaderNumber}{LightGray}  
    \ifost@orange%
      \colorlet{ostColorTitle}{DarkOrange}
      \colorlet{ostColorSubtitle}{DarkOrange}
      \colorlet{ostColorChapterHeader}{DarkOrange} 
      \colorlet{ostColorSectionHeader}{DarkOrange}  
      \colorlet{ostColorSubsectionHeader}{DarkOrange}
      \colorlet{ostColorSubSubsectionHeader}{DarkOrange}
      \colorlet{ostColorParagraphHeader}{DarkOrange} 
      \colorlet{ostColorCaptionLabel}{DarkOrange}
    \fi
  \ifost@blue
      \xdefinecolor{ostColorTitle}{RGB}{8,81,156}
      \xdefinecolor{ostColorSubtitle}{RGB}{49,130,189}
      \xdefinecolor{ostColorChapterHeader}{RGB}{8,81,156} 
      \xdefinecolor{ostColorSectionHeader}{RGB}{49,130,189} 
      \xdefinecolor{ostColorSubsectionHeader}{RGB}{49,130,189} 
      \xdefinecolor{ostColorSubSubsectionHeader}{RGB}{49,130,189} 
      \xdefinecolor{ostColorParagraphHeader}{RGB}{49,130,189} 
      \xdefinecolor{ostColorCaptionLabel}{RGB}{8,81,156}
  \fi
  \ifost@green
     \xdefinecolor{ostColorTitle}{RGB}{0,109,44}
     \xdefinecolor{ostColorSubtitle}{RGB}{49,163,84}
     \xdefinecolor{ostColorChapterHeader}{RGB}{0,109,44} 
     \xdefinecolor{ostColorSectionHeader}{RGB}{49,163,84} 
     \xdefinecolor{ostColorSubsectionHeader}{RGB}{49,163,84} 
     \xdefinecolor{ostColorSubSubsectionHeader}{RGB}{49,163,84} 
     \xdefinecolor{ostColorParagraphHeader}{RGB}{49,163,84} 
     \xdefinecolor{ostColorCaptionLabel}{RGB}{0,109,44}
  \fi
  \ifost@red
     \xdefinecolor{ostColorTitle}{RGB}{165,15,21}
     \xdefinecolor{ostColorSubtitle}{RGB}{222,45,38}
     \xdefinecolor{ostColorChapterHeader}{RGB}{165,15,21} 
     \xdefinecolor{ostColorSectionHeader}{RGB}{222,45,38} 
     \xdefinecolor{ostColorSubsectionHeader}{RGB}{222,45,38} 
     \xdefinecolor{ostColorSubSubsectionHeader}{RGB}{222,45,38} 
     \xdefinecolor{ostColorParagraphHeader}{RGB}{222,45,38} 
     \xdefinecolor{ostColorCaptionLabel}{RGB}{165,15,21}
  \fi
  \colorlet{ostColorChapterHeaderNumber}{gray}
  \colorlet{ostColorSectionHeaderNumber}{gray}
  \colorlet{ostColorSubsectionHeaderNumber}{gray}
  \colorlet{ostColorSubSubsectionHeaderNumber}{gray}
  \colorlet{ostColorParagraphHeaderNumber}{gray}
  \colorlet{ostColorLettrine}{DarkGray}  
  \colorlet{ostColorLineNumber}{DarkGray} 
  \colorlet{ostColorFooterRule}{LightGray!30} 
  \colorlet{ostColorHeaderMarks}{black}
  \colorlet{ostColorHeaderRule}{LightGray!30}
  \colorlet{ostColorPageNumber}{gray}
  \colorlet{ostColorPageNumberSurrounding}{gray}
  \colorlet{ostColorLinks}{black}
  \colorlet{ostColorCitationLinks}{black}
  \colorlet{ostColorFileLinks}{black}
  \colorlet{ostColorMenuLinks}{black}
  \colorlet{ostColorURLLinks}{black}

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
   \colorlet{ostColorTitleRuleVertical}{black} 
   \colorlet{ostColorTextOnBar}{black}  
   \colorlet{ostColorTocRule}{black} 
   \colorlet{ostColorPartialToc}{black} 
   \colorlet{ostColorTitleOverlay}{white} 
   \colorlet{ostColorImageFrame}{black} 
   \colorlet{ostColorTitle}{black} 
   \colorlet{ostColorSubtitle}{black}
   \colorlet{ostColorAuthors}{black}
   \colorlet{ostColorInstitution}{black} 
   \colorlet{ostColorAdvisors}{black} 
   \colorlet{ostColorDate}{black}  
   \colorlet{ostColorMarginNote}{black}
   \colorlet{ostColorAdvisors}{black}
   \colorlet{ostColorCaptionLabel}{black}
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
   \colorlet{ostColorLineNumber}{black} 
   \colorlet{ostColorHeaderRule}{black}
   \colorlet{ostColorFooterRule}{black}
   \colorlet{ostColorHeaderMarks}{black}
   \colorlet{ostColorPageNumber}{black} 
   \colorlet{ostColorPageNumberSurrounding}{black}
   \colorlet{ostColorLinks}{black}
   \colorlet{ostColorCitationLinks}{black}
   \colorlet{ostColorFileLinks}{black}
   \colorlet{ostColorMenuLinks}{black}
   \colorlet{ostColorURLLinks}{black}

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
   % TODO: make settable the font
   \newcommand{\ostGitUrl}{\tiny{\href{ostGitUrl}{https://github.com/cpfaff/Open-Science-Thesis}}}
   \newcommand{\ostGitInfoLine}{{\tiny Version from commit by \gitAuthorEmail~on~\gitAuthorDate; Source on: \ostGitUrl}\par}
\else%
   \newcommand{\ostGitInfoLine}{}
\fi%

%%%-------------------------------------------------%%%
%%% Define header and footer %%%
%%%-------------------------------------------------%%%

\RequirePackage{fancyhdr}
\AtBeginDocument{
  \pagestyle{fancy}
}
\fancyhf{}

\newcommand{\ostPageNumbering}{\relax}
\newcommand{\ostSetPageNumbering}[1]{\def\ostPageNumbering{#1}}
\newcommand{\ostFooterRuleColor}{ostColorFooterRule} 
\newcommand{\ostHeaderRuleColor}{ostColorHeaderRule} 

% create lengths
\newlength{\ostLengthHeaderRuleWidth} 
\newlength{\ostLengthFooterRuleWidth}

\ifost@color
  \setlength{\ostLengthHeaderRuleWidth}{3.0pt} 
  \setlength{\ostLengthFooterRuleWidth}{3.0pt} 
\else
  \setlength{\ostLengthHeaderRuleWidth}{1.0pt} 
  \setlength{\ostLengthFooterRuleWidth}{1.0pt} 
\fi

% patch rule commands with color
\patchcmd{\footrule}{\hrule}{\color{\ostFooterRuleColor}\hrule}{}{}
\patchcmd{\headrule}{\hrule}{\color{\ostHeaderRuleColor}\hrule}{}{}

\ifost@fancyhf
  \fancypagestyle{pageStyleChapter}{%
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{\ostLengthFooterRuleWidth}
    \fancyhead{}
  } 
  \renewcommand{\headrulewidth}{\ostLengthHeaderRuleWidth}
  \renewcommand{\footrulewidth}{\ostLengthFooterRuleWidth}
  \fancypagestyle{pageStyleToc}{%
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhead{}
  }
\else%
  \fancypagestyle{pageStyleChapter}{%
    \renewcommand{\chapterpagestyle}{fancy}
    \renewcommand{\headrulewidth}{0pt}
  } 
  \fancypagestyle{pageStyleToc}{%
    \renewcommand{\chapterpagestyle}{fancy}
    \renewcommand{\headrulewidth}{0pt}
  }
\fi%

\newcommand\ostFontPageNumber{\normalsize\textbf}
\newlength\ostLengthPageNumberSurroundingSep
\setlength{\ostLengthPageNumberSurroundingSep}{{1mm}} 

\newcommand\ostPageNumberSurrounding{\textendash}
\newcommand\ostFontHeaderMarks{\textit}

\if@twoside%  
  \setlength{\ostLengthPageNumberSurroundingSep}{{0mm}} 
  \renewcommand\ostPageNumberSurrounding{\relax}

\ostSetPageNumbering{\textcolor{ostColorPageNumber}{{\ostFontPageNumber{\textcolor{ostColorPageNumberSurrounding}{\ostPageNumberSurrounding}\hspace{\ostLengthPageNumberSurroundingSep}{\thepage}\hspace{\ostLengthPageNumberSurroundingSep}\textcolor{ostColorPageNumberSurrounding}{\ostPageNumberSurrounding}}}}} 
  \fancyfoot[RO, LE]{\ostPageNumbering}     
  \ifost@fancyhf
  \fancyhead[LE,RO]{\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\rightmark}}}}
  \fancyhead[LO,RE]{\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\leftmark}}}} 
  \fi
\else%
  \ostSetPageNumbering{\textcolor{ostColorPageNumber}{{\ostFontPageNumber{\textcolor{ostColorPageNumberSurrounding}{\ostPageNumberSurrounding}\hspace{\ostLengthPageNumberSurroundingSep}{\thepage}\hspace{\ostLengthPageNumberSurroundingSep}\textcolor{ostColorPageNumberSurrounding}{\ostPageNumberSurrounding}}}}} 
  \fancyfoot[C]{\ostPageNumbering} 
  \ifost@fancyhf
  \fancyhead[L]{\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\leftmark}}}}
  \fancyhead[R]{\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\rightmark}}}} 
  \fi
\fi%

%%%-------------------------------------------------%%%
%%% Control big starting letters (Lettrine) %%%
%%%-------------------------------------------------%%%

\RequirePackage{lettrine}

% set defaults
\newlength{\ostLengthDefaultFindent}
\setlength{\ostLengthDefaultFindent}{0.2em}

\newlength{\ostLengthDefaultNindent}
\setlength{\ostLengthDefaultNindent}{0.02em}

\newcommand{\ostSet@LettrineOptions}[1]{%
   \ifstrequal{#1}{A}{
      \setlength{\ostLengthDefaultFindent}{-0.2em}
      \setlength{\ostLengthDefaultNindent}{0.5em}
   }{\relax}
   \ifstrequal{#1}{T}{
      \setlength{\ostLengthDefaultFindent}{0.27em}
      \setlength{\ostLengthDefaultNindent}{0.02em}
   }{\relax}
   
}

\newcommand{\capital}[1]{%
  \ostSet@LettrineOptions{#1}
  \lettrine{\textcolor{ostColorLettrine}{#1}}
} 

%%%-------------------------------------------------%%%
%%% Enable linenumbers %%%
%%%-------------------------------------------------%%%

\newcommand{\ostFontLineNumber}{\normalfont\tiny\sffamily}

\newlength\ostLengthLineNumberSep
\setlength\ostLengthLineNumberSep{0.2em}

\RequirePackage[pagewise]{lineno}

\ifost@linenumbers%
   \renewcommand\linenumberfont{\color{ostColorLineNumber}\ostFontLineNumber}
   \AtBeginDocument{
     \setlength{\linenumbersep}{\ostLengthLineNumberSep}
     \linenumbers 
   }
\fi% 

%%%-------------------------------------------------%%%
%%% List options %%%
%%%-------------------------------------------------%%%

\RequirePackage[neverdecrease]{paralist}

\ifost@compactlist%
  \let\itemize\compactitem%
  \let\enditemize\endcompactitem%
  \let\enumerate\compactenum%
  \let\endenumerate\endcompactenum%
  \let\description\compactdesc%
  \let\enddescription\endcompactdesc%
  \plpartopsep=\smallskipamount
  \pltopsep=\smallskipamount
  \ifost@setspacing
    \ifost@sensitivespacing
      \newcounter{listingdepth}
      \setcounter{listingdepth}{0}
      \preto{\itemize}{%
	\ifnum\thelistingdepth=0
	  \begin{onehalfspace}
	\fi%
	\addtocounter{listingdepth}{1}
      }  
      \g@addto@macro{\enditemize}{%
	\ifnum\thelistingdepth=1
	  \end{onehalfspace}
	\fi%
	\addtocounter{listingdepth}{-1}
      }
      \preto{\enumerate}{%
	\ifnum\thelistingdepth=0
	  \begin{onehalfspace}
	\fi%
	\addtocounter{listingdepth}{1}
      }  
      \g@addto@macro{\endenumerate}{%
	\ifnum\thelistingdepth=1
	  \end{onehalfspace}
	\fi%
	\addtocounter{listingdepth}{-1}
      }
      \preto{\description}{%
	\ifnum\thelistingdepth=0
	  \begin{onehalfspace}
	\fi%
	\addtocounter{listingdepth}{1}
      }  
      \g@addto@macro{\enddescription}{%
	\ifnum\thelistingdepth=1
	  \end{onehalfspace}
	\fi%
	\addtocounter{listingdepth}{-1}
      }
    \fi
  \fi
\fi%

\ifost@fancylist%
  \newlength{\ostLengthListIndenti} 
  \setlength{\ostLengthListIndenti}{1.5em}
  \newcommand{\ostSymbolItemizei}{$\circ$}
  % \newcommand{\ostSymbolEnuneratei}{1.}
  \newlength{\ostLengthListIndentii} 
  \setlength{\ostLengthListIndentii}{1em}
  \newcommand{\ostSymbolItemizeii}{\textbullet}
  % \newcommand{\ostSymbolEnunerateii}{a)}
  \newlength{\ostLengthListIndentiii} 
  \setlength{\ostLengthListIndentiii}{0.9em}
  \newcommand{\ostSymbolItemizeiii}{\textperiodcentered}
  % \newcommand{\ostSymbolEnunerateii}{i.}
  \newlength{\ostLengthListIndentiv}
  \setlength{\ostLengthListIndentiv}{1.2em}
  \newcommand{\ostSymbolItemizeiv}{--}
  % \newcommand{\ostSymbolEnunerateii}{A)}
  \newlength{\ostLengthListIndentv}
  \setlength{\ostLengthListIndentv}{1em}
  \newlength{\ostLengthListIndentvi}
  \setlength{\ostLengthListIndentvi}{1em}

  \setdefaultitem{\ostSymbolItemizei}{\ostSymbolItemizeii}{\ostSymbolItemizeiii}{\ostSymbolItemizeiv}%
  \setdefaultleftmargin{\ostLengthListIndenti}{\ostLengthListIndentii}{\ostLengthListIndentiii}{\ostLengthListIndentiv}{\ostLengthListIndentv}{\ostLengthListIndentvi}%
  \setdefaultenum{1.}{a)}{i.}{A)}%
\fi

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
   \tikzstyle{imageframe} = [rectangle, rounded corners, draw=ostColorImageFrame, thick, fill=white] 
\else%
   \tikzstyle{imageframe} = [rectangle, rounded corners, draw=ostColorImageFrame, fill=white]
\fi

\tikzstyle{signbackground} = [rectangle, fill=white, fill opacity=0.7, text opacity=1, rounded corners]

\newcommand{\ostOpacityTitleOverlay}{0.7}

\tikzstyle{titlepageoverlay} = [rectangle, fill=ostColorTitleOverlay, fill opacity=\ostOpacityTitleOverlay, text opacity=1, rounded corners]

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

\RequirePackage{float} 

\ifost@floatbarrier
  \RequirePackage{placeins}
\fi

\ifost@floatafter
  \RequirePackage{flafter}
\fi

%% Control caption layout %%
\RequirePackage[format=plain, margin=7pt, font={small,it}, labelformat=default, labelfont=bf]{caption}

\ifost@color
  \captionsetup{labelfont={color=ostColorCaptionLabel,bf}}
\fi

%% where to put this?
\RequirePackage{marginnote}
\newcommand{\ostFontMarginNote}{\small}  

\ifost@setspacing
  \ifost@sensitivespacing
    \renewcommand*{\marginfont}{\singlespacing\color{ostColorMarginNote}\ostFontMarginNote}
  \fi
\else
  \renewcommand*{\marginfont}{\color{ostColorMarginNote}\ostFontMarginNote}
\fi

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

%% More column types %%

\RequirePackage{tabularx}

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% usage:
%  R{column width} for raggedright column in certain width
%  C{column width} for centered column in certain width

%% Collapse fields rowise %%

\RequirePackage{multirow}

% usage:
%  Horizontal aggregation of table cells
%	 \multicolumn{count of columns}{alignment}{text}

%  Vertical aggregation of table cells  
%	 \multirow{count of rows}{width}{text}

%% Tables over multiple pages %%
\RequirePackage{longtable}

%%%-------------------------------------------------%%%
%%% Multi column documents %%%
%%%-------------------------------------------------%%%

\RequirePackage{multicol}

% \newlength{\ostLengthColumnSeparator} 
% \setlength{\ostLengthColumnSeparator}{10pt} 
% \AtBeginDocument{\setlength\columnsep{\ostLengthColumnSeparator{}}}

% \newcommand{\ostColumnCount}{2} 
% \newcommand{\ostSetColumnCount}[1]{\def\ostColumnCount{#1}} 

% \newcommand{\ostColumnLayoutControlBegin}{
  % \ifnum\ostColumnCount\le1 
    % \relax 
  % \else 
    % \begin{multicols}{\ostColumnCount{}}
  % \fi
% }

% \newcommand{\ostColumnLayoutControlEnd}{
  % \ifnum\ostColumnCount=1 
    % \relax 
  % \else 
    % \end{multicols}
  % \fi
% }

% wrapper for the column layout in the root document
% \newenvironment{ostColumLayout}{%
  % \ostColumnLayoutControlBegin{}%
% }{%
  % \ostColumnLayoutControlEnd{}%
% }

%%%-------------------------------------------------%%%
%%% Bibliography %%%
%%%-------------------------------------------------%%%

\RequirePackage{biblatex}

\let\ostAddBibliography\addbibresource
\ifost@setspacing
  \ifost@sensitivespacing
    \preto{\printbibliography}{%
      \singlespacing
    }  
  \fi
\fi

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
%%% Code listings %%%
%%%-------------------------------------------------%%%

\RequirePackage{listings}

\def\ostFont@ListingBasic{\footnotesize\ttfamily}

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

% Inline code listings  (TODO: refine with tikz frame)
\newcommand{\inlinecode}[1]{\colorbox{ostColorAtListingBackground}{\lstinline|#1|}}

% Usage: 
%       \inlinecode{a=a+b} 

%%%-------------------------------------------------%%%
%%% Bar-Quote  %%%
%%%-------------------------------------------------%%%

\providecommand*{\ostQuoteAuthor}{}
\define@key{ostQuote}{author}{\renewcommand*\ostQuoteAuthor{#1}}
\presetkeys{ostQuote}{author=}{}%

\newdimen\ostLengthQuoteRuleHeight
\newdimen\ostLengthQuoteRuleWidth 
\newdimen\ostLengthQuoteRuleSep 
\ostLengthQuoteRuleSep=-2.3em

\ifost@color%
  \colorlet{ostColorQuoteRule}{LightGray!30}
  \ostLengthQuoteRuleWidth=5pt
\else%
  \colorlet{ostColorQuoteRule}{black}
  \ostLengthQuoteRuleWidth=2pt 
\fi%

\newcommand{\ostQuoteRule}{\textcolor{ostColorQuoteRule}{\rule{\ostLengthQuoteRuleWidth}{\ostLengthQuoteRuleHeight}}}

\newcommand{\ostquote}[2][]{
  \setkeys{ostQuote}{#1} 
  \def\ost@temp{\begin{minipage}{0.8\textwidth}% 
      {\small #2 \ifdefempty{\ostQuoteAuthor}{\relax}{\\[0.5em] \raggedright{\textbf{--}~\textit{\ostQuoteAuthor}~\textbf{--}}}}
    \end{minipage}
  }%
  \settototalheight\ostLengthQuoteRuleHeight\ost@temp
  \begin{center}
    \begin{minipage}{0.1\textwidth}
      \ostQuoteRule{}
    \end{minipage}
    \hspace{\ostLengthQuoteRuleSep}
    \begin{minipage}{0.8\textwidth}
      {\small #2 \ifdefempty{\ostQuoteAuthor}{\relax}{\\[0.5em] \raggedright{\textbf{--}~\textit{\ostQuoteAuthor}~\textbf{--}}}}
    \end{minipage}
  \end{center}
}

% provide alias
\let\barquote\ostquote

\g@addto@macro{\frontmatter}{
  \ost@chapterwithtocfalse
}

\g@addto@macro{\mainmatter}{
  \ost@chapterwithtoctrue
}

\g@addto@macro{\appendix}{
  \ost@chapterwithtocfalse
  \ifost@addstopcontenttoappendix% 
    \stopcontents
  \fi
}

\g@addto@macro{\backmatter}{
  \ost@chapterwithtocfalse
}

\preto{\tableofcontents}{
  \ifost@setspacing
    \ifost@sensitivespacing
    \begin{singlespace}
    \fi
  \fi
  \hypersetup{linkcolor=black} 
  \ost@chapterwithtocfalse
}  
\g@addto@macro{\tableofcontents}{
  \hypersetup{linkcolor=ostColorLinks} 
  \ost@chapterwithtocfalse
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}

\preto{\listoffigures}{%
  \ifost@setspacing%
    \ifost@sensitivespacing%
      \begin{singlespace}
    \fi%
  \fi%
  \hypersetup{linkcolor=black} 
  \ost@chapterwithtocfalse%
} 
\g@addto@macro{\listoffigures}{%
  \hypersetup{linkcolor=ostColorLinks} 
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}

\preto{\listoftables}{
  \ifost@setspacing
    \ifost@sensitivespacing
    \begin{singlespace}
    \fi
  \fi
  \hypersetup{linkcolor=black} 
} 
\g@addto@macro{\listoftables}{
  \hypersetup{linkcolor=ostColorLinks} 
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}

\newenvironment{ostPartialToc}{%
  \ifost@setspacing
    \ifost@sensitivespacing
      \begin{singlespace}
    \fi
  \fi
  \hypersetup{linkcolor=black}
}{%
  \hypersetup{linkcolor=ostColorLinks}
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}

%%%-------------------------------------------------%%%
%%% Definition of affidavit %%%
%%%-------------------------------------------------%%%

\newcommand{\ostAffidavitDeclaration}{
    I hereby declare that this document has been written only by the undersigned
    and without any assistance from third parties. Furthermore, I confirm that no
    sources have been used in the preparation of this document other than those
    indicated in the thesis itself. 
}

% \AtBeginDocument{
  % \iflanguage{ngerman}{\ostSetAffidavitDeclaration{
    % Hiermit erkläre ich, dass ich die vorliegende Hausarbeit selbständig verfasst
    % und keine anderen als die angegebenen Hilfsmittel benutzt habe. Die Stellen
    % der Hausarbeit, die anderen Quellen im Wortlaut oder dem Sinn nach entnommen
    % wurden, sind durch Angaben der Herkunft kenntlich gemacht. Dies gilt auch für
    % Zeichnungen, Skizzen, bildliche Darstellungen sowie für Quellen aus dem
    % Internet.
  % }}{\relax} 
% }

\newcommand{\ostAffidavitDate}{}
\newcommand{\ostAffidavitLocation}{}
\newcommand{\ostAffidavitSignatureLine}{\noindent Date:\ifdefempty{\ostAffidavitDate}{\textcolor{gray}{\dotfill}}{~\ostAffidavitDate},\hspace{0.7em}Location:\ifdefempty{\ostAffidavitLocation}{\textcolor{gray}{\dotfill}}{~\ostAffidavitLocation},\hspace{0.7em}Signature:\textcolor{gray}{\dotfill}}
\newcommand{\ostAffidavitName}{Affidavit}

\newcommand{\affidavitsectioning}{chapter}
\define@key{ostAffidavit}{sectioning}{\def\affidavitsectioning{#1}}
\presetkeys{ostAffidavit}{sectioning=chapter}{}%

\newcommand{\makeaffidavit}[1][]{
  \setkeys{ostAffidavit}{#1} 
  \ifost@setspacing
    \ifost@sensitivespacing
    \begin{singlespace}
    \fi
  \fi
  \csname\affidavitsectioning\endcsname{\ostAffidavitName} 
  \ostAffidavitDeclaration{} 

  \vspace{4\baselineskip}
  \ostAffidavitSignatureLine{}
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}

\let\printaffidavit\makeaffidavit

%%%-------------------------------------------------%%%
%%% Definition of titlepage %%%
%%%-------------------------------------------------%%%

% fonts

\newcommand{\ostFontTitle}{\normalfont\sffamily\Huge\bfseries}  
\newcommand{\ostFontSubtitle}{\normalsize\bfseries\textit}  
\newcommand{\ostFontAuthors}{\normalfont\normalsize}   
\newcommand{\ostFontInstitution}{\normalfont\sffamily\normalsize}    
\newcommand{\ostFontDate}{\normalfont\sffamily\small}    
\newcommand{\ostFontAdvisors}{\normalfont\sffamily\normalsize}  

% lengths

% \newlength{\ostHeightOfTitleBeforeReduceSize} 
% \setlength{\ostHeightOfTitleBeforeReduceSize}{2\baselineskip} 
\newlength{\ostLengthTitleSpacerTitleRuleUpper} 
\setlength{\ostLengthTitleSpacerTitleRuleUpper}{2em} 
\newlength{\ostLengthTitleSpacerTitleRuleLower} 
\setlength{\ostLengthTitleSpacerTitleRuleLower}{2em} 
\newlength{\ostLengthTitleRuleWidth}
\setlength{\ostLengthTitleRuleWidth}{3pt}
\newlength{\ostLengthTitleRuleWidthVertical}
\setlength{\ostLengthTitleRuleWidthVertical}{3pt}
\newlength{\ostLengthBackgroundPicVoffset} 
\setlength\ostLengthBackgroundPicVoffset{0pt}
\newlength{\ostLengthBackgroundPicHoffset} 
\setlength\ostLengthBackgroundPicHoffset{0pt}

% getter and setter
\newcommand{\ostTitleStretchAbove}{\vspace*{\stretch{1}}}  
\newcommand{\ostSetTitleStretchAbove}[1]{\def\ostTitleStretchAbove{#1}} 
\newcommand{\ostTitleStretchBelow}{\vspace*{\stretch{2}}} 
\newcommand{\ostSetTitleStretchBelow}[1]{\def\ostTitleStretchBelow{#1}} 
\newcommand{\ostTitleSpacerTitleRuleUpper}{\vspace{\ostLengthTitleSpacerTitleRuleUpper}}
\newcommand{\ostTitleSpacerTitleRuleLower}{\vspace{\ostLengthTitleSpacerTitleRuleLower}}

\providecommand*{\widthOfTitlepageImage}{}

\define@key{ostSetImage}{width}{\renewcommand*\widthOfTitlepageImage{#1}}
\define@key{ostSetImage}{voffset}{\setlength\ostLengthBackgroundPicVoffset{#1}}
\define@key{ostSetImage}{hoffset}{\setlength\ostLengthBackgroundPicHoffset{#1}}
\presetkeys{ostSetImage}{width=\textwidth, voffset=0pt, hoffset=0pt}{}%
\newsavebox\ostImageTitlepageBackground
\newcommand{\ostSetImage}[3][]{%
    \setkeys{ostSetImage}{#1}
    \expandafter\savebox\csname ostImage#2\endcsname{\IfFileExists{#3}{\includegraphics[width=\widthOfTitlepageImage, keepaspectratio]{#3}}{\scalebox{2}{\color{red}Image file not found or set!}}}
}
\newcommand{\ostTitlePageBackgroundPic}[1]{
  \AddToShipoutPicture*{\AtTextCenter{%
    \hspace*{\ostLengthBackgroundPicHoffset}\raisebox{\ostLengthBackgroundPicVoffset}{\makebox(0,0){\ostTitleStretchAbove{}\usebox\ostImageTitlepageBackground\ostTitleStretchBelow{}
}}}}}
\ostSetImage{TitlepageBackground}{ost/graphics/ostTitlePageBackground.pdf}

% \begin{tikzpicture}[remember picture, overlay]
% \node at (current page.north west){%
% \begin{tikzpicture}[overlay]
% \node[draw,anchor=west] at (0mm,0mm) {Some text};
% \end{tikzpicture}
% };
% \end{tikzpicture}

% \def\@oddhead{%
% \setlength\unitlength{1mm}%
% \begin{picture}(0,0)%
% \put(120,20){\fbox{A LOGO HERE}}%
% \put(-10,-200){\framebox(150,200)[tl]{}}%
% \end{picture}\hfill}

% \AtBeginShipout{%
  % \ifthenelse{\isodd{\value{page}}}%
    % { 
  % \AddToShipoutPicture*{%
    % \AtPageLowerLeft{%
      % \rotatebox{90}{%
          % \begin{minipage}{\paperheight}
            % \colorbox{black!05}{\parbox{\paperheight-2\fboxsep-2\fboxrule}{
              % \vspace{5pt}
                % \ostTextOnBar
              % \vspace{5pt}
            % }
          % }
          % \end{minipage} %
        % }
      % } %
  % }
    % }%
    % {
  % \AddToShipoutPicture*{%
    % \AtPageLowerLeft{%
      % \makebox[41cm]{\rotatebox{90}{%
          % \begin{minipage}{\paperheight}
            % \colorbox{black!05}{\parbox{\paperheight-2\fboxsep-2\fboxrule}{
              % \vspace{5pt}
                % \ostTextOnBar
              % \vspace{5pt}
            % }
          % }
          % \end{minipage} %
        % }}
      % } %
  % }
% }%
% }

\newcommand{\ostTitleRule}{\textcolor{ostColorTitleRule}{\noindent\rule{\linewidth}{\ostLengthTitleRuleWidth}}}
\newcommand{\ostTitle}{The open science thesis} 
\newcommand{\ostSubtitle}{This is a subtitle}
\newcommand{\ostAuthors}{Author one\textsuperscript{1,2,a} \and Author two\textsuperscript{2}, \ldots} 
\newcommand{\ostInsitution}{University of XY, Department Z} 
\newcommand{\ostEmail}[1]{\href{mailto:#1}{#1}} 
\newcommand{\ostDate}{\today} 
\newcommand{\ostFontTextOnBar}{\huge}
\newcommand{\ostTextOnBar}{\textcolor{LightGray}{Open~-~}\textcolor{gray}{Science}\textcolor{LightGray}{~-~Thesis}} 
\newcommand{\ostAdvisorOne}{Advisor:\\ Prof. Dr. M. Sickel\\Phone: 0234 97 38 59 1\\Fax: 0341 97 38 54 9\\E-Mail: \ostEmail{sickel@uni-fubar.de}}
\newcommand{\ostAdvisorTwo}{PD Dr. L. Dark\\Phone: 0234 44 36 33 9\\Fax: 0323 44 38 22 9\\E-Mail: \ostEmail{dark@uni-baz.de}}

\ifost@titlepagebackgroundimage%

\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing
    \ifost@sensitivespacing
    \begin{singlespace}
    \fi
  \fi
  \begin{titlepage}
    \ostTitlePageBackgroundPic{}
    {\centering% 
      \ostTitleStretchAbove{} 
      {\begin{tikzpicture}\node[titlepageoverlay]{\begin{minipage}{\textwidth}\begin{center} 
      {\noindent\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\ostFontTitle\ostTitle}}\par}}\vspace{\baselineskip}   
      {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\ostFontSubtitle\ostSubtitle}}\par}}\vspace{\baselineskip}
      {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\ostFontAuthors\ostAuthors}}\par}}
      {\ifdefempty{\ostInsitution}{\relax}{\color{ostColorInstitution}{{\ostFontInstitution\ostInsitution}}}\par}
      {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\ostFontDate\ostDate}}}\par}
      \ostGitInfoLine{} 
      \end{center}\end{minipage}};\end{tikzpicture}}\\
      \ostTitleStretchBelow{} 
      {\ifdefempty{\ostAdvisorOne}{\relax}{\begin{tikzpicture}\node[titlepageoverlay]{\begin{minipage}{\textwidth} \begin{center}{\color{ostColorAdvisors}\ostFontAdvisors\ostAdvisorOne}\end{center}\end{minipage}};\end{tikzpicture}}\par} 
      \vspace{\baselineskip}
      {\ifdefempty{\ostAdvisorTwo}{\relax}{\begin{tikzpicture}\node[titlepageoverlay]{\begin{minipage}{\textwidth} \begin{center}{\color{ostColorAdvisors}\ostFontAdvisors\ostAdvisorTwo}\end{center}\end{minipage}};\end{tikzpicture}}\par} 
    }      
  \end{titlepage}
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}
\fi%

\ifost@titlepagehorizontal  

\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing
    \ifost@sensitivespacing
    \begin{singlespace}
    \fi
  \fi
  \begin{titlepage}
    {\centering% 
      \ostTitleStretchAbove{}
      \ostTitleRule%
      \ostTitleSpacerTitleRuleUpper{}
      {\noindent\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\ostFontTitle\ostTitle}}\par}}\vspace{\baselineskip}   
      {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\ostFontSubtitle\ostSubtitle}}\par}}\vspace{\baselineskip}
      {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\ostFontAuthors\ostAuthors}}\par}}
      {\ifdefempty{\ostInsitution}{\relax}{\color{ostColorInstitution}{{\ostFontInstitution\ostInsitution}}}\par}
      {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\ostFontDate\ostDate}}}\par}
      \ostGitInfoLine{}
      \vspace{-1\baselineskip}
      \ostTitleSpacerTitleRuleLower{} 
      \ostTitleRule%
      \ostTitleStretchBelow{}
      {\ifdefempty{\ostAdvisorOne}{\relax}{\color{ostColorAdvisors}{{\ostFontAdvisors\ostAdvisorOne}}}\par} 
      \vspace{\baselineskip}
      {\ifdefempty{\ostAdvisorTwo}{\relax}{\color{ostColorAdvisors}{{\ostFontAdvisors\ostAdvisorTwo}}}\par} 
    }      
  \end{titlepage} 
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}
\fi

\ifost@titlepageplain

\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing
    \ifost@sensitivespacing
    \begin{singlespace}
    \fi
  \fi
  \begin{titlepage}
    {\centering% 
      \ostTitleStretchAbove{}
      {\noindent\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\ostFontTitle\ostTitle}}\par}}\vspace{\baselineskip}   
      {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\ostFontSubtitle\ostSubtitle}}\par}}\vspace{\baselineskip}
      {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\ostFontAuthors\ostAuthors}}\par}}
      {\ifdefempty{\ostInsitution}{\relax}{\color{ostColorInstitution}{{\ostFontInstitution\ostInsitution}}}\par}
      {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\ostFontDate\ostDate}}}\par}
      \ostGitInfoLine{}
      \ostTitleStretchBelow{}
      {\ifdefempty{\ostAdvisorOne}{\relax}{\color{ostColorAdvisors}{{\ostFontAdvisors\ostAdvisorOne}}}\par} 
      \vspace{\baselineskip}
      {\ifdefempty{\ostAdvisorTwo}{\relax}{\color{ostColorAdvisors}{{\ostFontAdvisors\ostAdvisorTwo}}}\par} 
    }      
  \end{titlepage} 
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}
\fi

\ifost@titlepagevertical%

\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing
    \ifost@sensitivespacing
    \begin{singlespace}
    \fi
  \fi
  \begin{titlepage}
    \mbox{ 
      \hspace*{0.2\textwidth} 
      \rotatebox{90}{{\ostFontTextOnBar\color{ostColorTextOnBar}\ostTextOnBar}}
      \textcolor{ostColorTitleRuleVertical}{\rule{\ostLengthTitleRuleWidthVertical}{\textheight}}  
      \hspace*{0.05\textwidth} 
      \parbox[b]{0.75\textwidth}{ 
        {\noindent\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\begin{flushleft}\ostFontTitle\ostTitle\end{flushleft}}}\par}}\vspace{2\baselineskip}
        {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\begin{flushleft}\ostFontSubtitle\ostSubtitle\end{flushleft}}}\par}}\vspace{4\baselineskip}
        {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\ostFontAuthors\ostAuthors}}\par}}
        {\ifdefempty{\ostInsitution}{\relax}{\color{ostColorInstitution}{{\ostFontInstitution\ostInsitution}}}\par}
        {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\ostFontDate\ostDate}}}\par} 
        \ostGitInfoLine{}
        \vspace{0.2\textheight} 
        {\ifdefempty{\ostAdvisorOne}{\vspace{4\baselineskip}}{\color{ostColorAdvisors}{{\ostFontAdvisors\ostAdvisorOne}}}\par}\vspace{\baselineskip}
        {\ifdefempty{\ostAdvisorTwo}{\vspace{4\baselineskip}}{\color{ostColorAdvisors}{{\ostFontAdvisors\ostAdvisorTwo}}}\par} 
      }
    }
  \end{titlepage}
  \ifost@setspacing
    \ifost@sensitivespacing
    \end{singlespace}
    \fi
  \fi
}
\fi% 

% new definition old macro
\let\maketitle\ostMakeTitle
\let\printtitlepage\ostMakeTitle

%Set the Environments for Textsizes etc
\newenvironment{smallpar}{\par\small}{\par}
\newenvironment{centerpar}{\par\center}{\par}
\newenvironment{hugepar}{\par\huge}{\par}

% make the figure environment expand arguments first
\let\tmpfigure\figure
\let\endtmpfigure\endfigure
\renewenvironment{figure}[1][htbp]{%
   \expandafter\tmpfigure\expandafter[#1]%
}{%
   \endtmpfigure
}

\providecommand*{\placement}{}
\providecommand*{\envwidth}{}
\providecommand*{\mappath}{}
\providecommand*{\picturepath}{}
\providecommand*{\overlaytextname}{}
\providecommand*{\envlabel}{}
\providecommand*{\envcaption}{}

\define@key{framedfigureOverlay}{placement}{\renewcommand*\placement{#1}}
\define@key{framedfigureOverlay}{width}{\renewcommand*\envwidth{#1}}
\define@key{framedfigureOverlay}{mappath}{\renewcommand*\mappath{#1}}
\define@key{framedfigureOverlay}{picpath}{\renewcommand*\picturepath{#1}}
\define@key{framedfigureOverlay}{overlaytext}{\renewcommand*\overlaytextname{#1}}
\define@key{framedfigureOverlay}{label}{\renewcommand*\envlabel{#1}}

\presetkeys{framedfigureOverlay}{placement=H, width=0.95\textwidth, label=fig:DefaultLabel}{}%

\providecommand{\framedfigureOverlay}[2][]{
  \setkeys{framedfigureOverlay}{#1}
  \begin{figure}[\placement]
    \centering
    \begin{tikzpicture}
      \node[imageframe]{%
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

\WithSuffix\providecommand\framedfigureOverlay*[2][]{
  \setkeys{framedfigureOverlay}{#1}
  \begin{figure*}
    \centering
    \begin{tikzpicture}
      \node[imageframe]{%
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

% \framedfigureOverlay*[% 
	% mappath=ost/graphics/MapPelargoniumSidoides.pdf,% 
	% picpath=ost/graphics/Pelargoniumsidoides.png,%
	% overlaytext=Pelargonium sidoides,%
	% label=fig:KaplandPelargonie]{%  
	% Distribution of Pelargonium sidoides. Die maps was created from data
	% available via Global Biodiversity Information Facility database.  The
	% distribution is restricted to regions in Lesotho and South Africa.
	% (Rot).}  

% \framedfigureOverlay[% 
	% mappath=ost/graphics/MapPelargoniumSidoides.pdf,%
	% label=fig:KaplandPelargonie]{%   
	% Distribution of Pelargonium sidoides. Die maps was created from data
	% available via Global Biodiversity Information Facility database.  The
	% distribution is restricted to regions in Lesotho and South Africa.
	% (Rot).}  

\define@key{framedfigure}{placement}{\renewcommand*\placement{#1}}
\define@key{framedfigure}{label}{\renewcommand*\envlabel{#1}}
\presetkeys{framedfigure}{placement = htbp, label=none}{}%

\providecommand\framedfigure[3][]{
\setkeys{framedfigure}{#1}
  \begin{figure}[\placement]
    \centering
    \begin{tikzpicture}
      \node[imageframe]{%
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

\WithSuffix\providecommand\framedfigure*[3][]{%
\setkeys{framedfigure}{#1}
  \begin{figure*}[H]
    \centering
    \begin{tikzpicture}
      \node[imageframe]{%
        \begin{minipage}{0.97\textwidth}
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

% \framedfigure[label=type:name]{%
  % % Content here
% }{Caption here}

% Example usage:  

% \framedfigure*[label=fig:distmatwo]{   
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
  \centering
  \label{\envlabel}
  \caption{#3}
  {\small  
    #2
  }
\end{table*} 
} 

\lstnewenvironment{ostCodeEnv}[1][]{
  \vspace{.5em}
  \lstset{#1}
}{
  \vspace{.5em}
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

% Note: This are the default values
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

\ifost@addtoctopart%
  \titleformat{\part}[display]%
  {\normalfont\sffamily}%
  {\hfill{\fontsize{110}{70}\selectfont\textcolor{ostColorPartHeaderNumber}%
  {\textbf\thepart}}}%
  {-2ex}%
  {\filleft\fontsize{50}{70}\selectfont\color{ostColorPartHeader}\textbf}%
  [\vspace*{4pc}{\normalfont\large \begin{ostPartialToc}\startcontents\printcontents{p-}{0}{}\end{ostPartialToc}}\thispagestyle{empty}]
\else%
  \titleformat{\part}[display]%
  {\normalfont\sffamily}%
  {\hfill\fontsize{110}{70}\selectfont\color{ostColorPartHeaderNumber}\textbf\thepart}%
  {-2ex}%
  {\filleft\fontsize{50}{70}\selectfont\color{ostColorPartHeader}\textbf}%
  [\thispagestyle{empty}]
\fi%

\ifost@sectionnumbers% 
  \ifost@addtoctochapter%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\normalfont\huge\bfseries}
    {\color{ostColorChapterHeaderNumber}\thechapter}
    {0.5em}
    {\Huge}
    [\ifost@chapterwithtoc\vspace*{3pc}{\color{ostColorPartialToc}\normalfont\large \begin{ostPartialToc}\startcontents\printcontents{p-}{1}{}\end{ostPartialToc}}\fi \thispagestyle{pageStyleChapter}]
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \else%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\normalfont\huge\bfseries}
    {\color{ostColorChapterHeaderNumber}\thechapter}
    {0.5em}
    {\Huge}
    [\thispagestyle{pageStyleChapter}]
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \fi%
 
  \titleformat{\section}
  {\color{ostColorSectionHeader}\normalfont\sffamily\Large\bfseries}
  {{\color{ostColorSectionHeaderNumber}\thesection}}
  {0.5em}
  {}
  \titlespacing*{\section}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\subsection}
  {\color{ostColorSubsectionHeader}\normalfont\sffamily\large\bfseries}
  {\color{ostColorSubsectionHeaderNumber}\thesubsection}
  {0.5em}
  {}
  \titlespacing*{\subsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\subsubsection}
  {\color{ostColorSubSubsectionHeader}\normalfont\sffamily\normalsize\bfseries}
  {\color{ostColorSubSubsectionHeaderNumber}\thesubsubsection}
  {0.5em}
  {}
  \titlespacing*{\subsubsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\paragraph}[runin]
  {\color{ostColorParagraphHeader}\normalfont\sffamily\normalsize\bfseries}
  {\color{ostColorParagraphHeaderNumber}\theparagraph}
  {0.5em}
  {}
  \titlespacing*{\paragraph}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
\else%  
  \ifost@addtoctochapter%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\normalfont\huge\bfseries}
    {\color{ostColorChapterHeaderNumber}}
    {0em}
    {\Huge}
    [\ifost@chapterwithtoc\vspace*{3pc}{\color{ostColorPartialToc}\normalfont\large \begin{ostPartialToc}\startcontents\printcontents{p-}{1}{}\end{ostPartialToc}} \fi \thispagestyle{pageStyleChapter}]
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \else%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\normalfont\huge\bfseries}
    {}
    {0em}
    {\Huge}
    [\thispagestyle{pageStyleChapter}]
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \fi%

  \titleformat{\section}
  {\color{ostColorSectionHeader}\normalfont\sffamily\Large\bfseries}{}{0em}{}
  \titlespacing*{\section}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

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

\ifost@floatbarrierpart
  \preto{\part}{%
    \FloatBarrier
  }  
\fi

\ifost@floatbarrierchapter
  \preto{\chapter}{%
    \FloatBarrier
  }  
\fi

\ifost@floatbarriersection
  \preto{\section}{%
    \FloatBarrier
  }  
\fi

\RequirePackage{titletoc}

% \titlecontents{ <section> }[ <left> ]{ <above-code> }
              % { <numbered-entry-format> }{ <numberless-entry-format> }
              % { <filler-page-format> }[ <below-code> ]

% style of tocs 
\ifost@fancytocs%
  \contentsmargin{1.8em} 

  \newlength{\ostLengthTocRuleWidth}
  \setlength{\ostLengthTocRuleWidth}{1.8pt}

  \newcommand{\ostTocRule}{\textcolor{ostColorTocRule}{\noindent\rule{\linewidth}{\ostLengthTocRuleWidth}}}

  \titlecontents{part}
  [0em]
  {\addvspace{2pc}}
  {\contentslabel{0em}}
  {\Large\bfseries\textsf}
  {\titlerule*{}\bfseries\contentspage}[\vspace{-0.7em}\ostTocRule\thispagestyle{pageStyleToc}]

  \titlecontents{chapter}
  [1.5em]
  {\addvspace{0.7pc}}
  {\bfseries\contentslabel{1em}}
  {\bfseries\hspace*{-1em}}
  {\titlerule*{}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{p-chapter}
  [1.5em]
  {\addvspace{0.7pc}}
  {\bfseries\contentslabel{1em}}
  {\hspace*{-1.5em}}
  {\titlerule*[0.7em]{.}\contentspage}
  [\thispagestyle{pageStyleToc}]

  \titlecontents{section}
  [3em]
  {}
  {\contentslabel{1.6em}}
  {}
  {\titlerule*[0.7em]{.}\contentspage}
  [\thispagestyle{pageStyleToc}]
  
  \titlecontents{p-section}[3em]{}{\contentslabel{1.6em}}{}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{subsection}[5em]{}{\contentslabel{2.3em}}{}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{p-subsection}[5em]{}{\contentslabel{2.3em}}{}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{figure}[2em]{\addvspace{1pc}}{\contentslabel{2em}}{}
  {~\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{table}[2em]{\addvspace{1pc}}{\contentslabel{2em}}{}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]
\else%
  \relax%
\fi%

% create all content tables
\def\makeallcontenttables{
  \tableofcontents%
  \listoffigures%
  \listoftables%
  \ifost@revision%
    \listofrevisions%
  \fi%
}
\let\printallcontenttables\makeallcontenttables%


%%%-------------------------------------------------%%%
%%% Todonote based revision setup %%%
%%%-------------------------------------------------%%%

\newcounter{ostCounter@Revisor}

\ifost@revision 

  \RequirePackage[colorinlistoftodos, textwidth=7cm, shadow]{todonotes}
  \RequirePackage[a3,center]{crop}

  \newenvironment{formattodo}
		 {\list{}{\leftmargin2em \rightmargin0em}%
		  \item\relax}
		 {\endlist}
  % FIXME: todoname needs to be settable by interface
  \newcommand{\ostRevisionName}{Notes of Revisors}
  \def\todosectioning{\section{\ostRevisionName}}
  
  % \def\ostSetContent
  \renewcommand{\todosectioning}{\chapter{\ostRevisionName}}

  \renewcommand{\listoftodos}{{\todosectioning \begin{formattodo} \@starttoc{tdo} \end{formattodo} \vspace{\baselineskip}}}

  \let\revision\todo
  \let\listofrevisions\listoftodos

  \def\ostSetRevisor#1{ 
    \ifcase\value{ostCounter@Revisor}\relax
      \definecolor{ostColorRevisor0}{RGB}{153,216,201} 
      \expandafter\def\csname#1\endcsname##1{\todo[color=ostColorRevisor0]{{\sc#1}: ##1}}%
    \or%
      \definecolor{ostColorRevisor1}{RGB}{188,189,220}
      \expandafter\def\csname#1\endcsname##1{\todo[color= ostColorRevisor1]{{\sc#1}: ##1}}%
    \or%
      \definecolor{ostColorRevisor2}{RGB}{254,232,200}
      \expandafter\def\csname#1\endcsname##1{\todo[color= ostColorRevisor2]{{\sc#1}: ##1}}%
      \stepcounter{ostCounter@Revisor}%
    \or%
      \definecolor{ostColorRevisor3}{RGB}{253,224,221}
      \expandafter\def\csname#1\endcsname##1{\todo[color= ostColorRevisor3]{{\sc#1}: ##1}}%
      \stepcounter{ostCounter@Revisor}%
    \else%
      \definecolor{ostColorRevisor4}{RGB}{247,252,185}
      \expandafter\def\csname#1\endcsname##1{\todo[color= ostColorRevisor4]{{\sc#1}: ##1}}%
    \fi%
    \global\stepcounter{ostCounter@Revisor}%
  }

\else
  \let\revision\relax
  \let\listofrevisions\relax
  \def\ostSetRevisor#1{
    \ifcase\value{ostCounter@Revisor}\relax
      \expandafter\def\csname#1\endcsname##1{\relax}%
    \or%
      \expandafter\def\csname#1\endcsname##1{\relax}%
    \or%
      \expandafter\def\csname#1\endcsname##1{\relax}%
    \or%
      \expandafter\def\csname#1\endcsname##1{\relax}%
    \else%
      \expandafter\def\csname#1\endcsname##1{\relax}%
    \fi%
    \global\stepcounter{ostCounter@Revisor}%
  }
\fi

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

%% TeX fintuning parameters %%
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
   citecolor=ostColorCitationLinks,%
   filecolor=ostColorFileLinks,%
   menucolor=ostColorMenuLinks,%	
   urlcolor=ostColorURLLinks,%
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

% Note: load glossaries always after hyperref!
\RequirePackage[xindy, acronym, toc]{glossaries} 
\RequirePackage{glossaries-babel}

%package options

% xindy        = use xindy indexer instead of mkindex
% acronym      = make separate list for acronyms
% toc          = entry to table of contents
% nonumberlist = no page numbers in glossary

% modify the gls link color
\renewcommand*{\glstextformat}[1]{\textcolor{ostColorGlsLinkColor}{#1}}
\setglossarysection{chapter}

%print out abbreviations
% \deftranslation[to=German]{Acronyms}{Abkürzungsverzeichnis}

%print out symbols
%\printglossary[type=symbolslist,style=long]

%\cleardoublepage{}

% \cleardoublepage
% \setlength{\columnsep}{0.75cm}
% \addcontentsline{toc}{chapter}{\textcolor{ocre}{Index}}
% \printindex

% create an index
% \RequirePackage{makeidx}
% \makeindex

%%%-------------------------------------------------%%%
%%% Set the headings %%%
%%%-------------------------------------------------%%%

\let\ostcontentsname\contentsname%
\let\ostfiguresname\listfigurename%
\let\osttablesname\listtablename%
\let\ostbibname\bibname%

\newcommand{\ostTableOfContentsName}{\ostcontentsname}
\newcommand{\ostListOfFiguresName}{\ostfiguresname}
\newcommand{\ostListOfTablesName}{\osttablesname}
\newcommand{\ostBibliographyName}{\ostbibname}

\addto\captionsenglish{%
  \renewcommand{\contentsname}%
    {\ostTableOfContentsName}%
}

\addto\captionsenglish{%
  \renewcommand{\listfigurename}%
    {\ostListOfFiguresName}%
}

\addto\captionsenglish{%
  \renewcommand{\listtablename}%
    {\ostListOfTablesName}%
}

\DefineBibliographyStrings{english}{%
  bibliography = {\ostBibliographyName},%
}

\addto\captionsgerman{%
  \renewcommand{\contentsname}%
    {\ostTableOfContentsName}%
}

\addto\captionsgerman{%
  \renewcommand{\listfigurename}%
    {\ostListOfFiguresName}%
}

\addto\captionsgerman{%
  \renewcommand{\listtablename}%
    {\ostListOfTablesName}%
}

\DefineBibliographyStrings{german}{%
  bibliography = {\ostBibliographyName},%
}
