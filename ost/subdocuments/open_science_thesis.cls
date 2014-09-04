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

\ProvidesClass{open-science-thesis}[2014/01/06 version 0.6.5 LaTeX class of the Open-Science-Thesis]

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

\newif\ifost@loadgeometry% 

\define@boolkey[KV]{open-science-thesis}[ost@]{autolayout}[false]{
  \PassOptionsToClass{12pt, headings=small, captions=tableheading, DIV=calc}{scrbook}
  \ost@loadgeometryfalse
}

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
    \PassOptionsToClass{oneside, 12pt, headings=small, captions=tableheading, DIV=calc}{scrbook}
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

\newif\ifost@inlinecodestyleround% 
\newif\ifost@inlinecodestylebox% 
\newif\ifost@inlinecodestyleplain% 

\define@choicekey*[KV]{open-science-thesis}{inlinecodestyle}[\val\nr]{round, box, plain}{%
  \ifcase\nr\relax%
    \ost@inlinecodestyleroundtrue%
  \or%
    \ost@inlinecodestyleboxtrue%
  \or%
    \ost@inlinecodestyleplaintrue%
  \fi%
}

\define@choicekey*[KV]{open-science-thesis}{pagelayout}[\val\nr]{oneside, twoside}{%
  \ifcase\nr\relax%
    \PassOptionsToClass{oneside}{scrbook}
  \or%
    \PassOptionsToClass{twoside}{scrbook}
  \fi%
}

\define@key[KV]{open-science-thesis}{fontsize}{\PassOptionsToClass{#1}{scrbook}}

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
  fontsize=12pt,
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
  inlinecodestyle=round,
}{}

\ProcessOptionsX[KV]<open-science-thesis>

\LoadClass{scrbook}

\ifost@loadgeometry%
  \RequirePackage{geometry}
\fi%

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
\newcommand{\ostSetWidth}[2]{\setlength{\csname ostWidth#1\endcsname}{#2}}

\newcommand{\ostSetColor}[2]{\colorlet{ostColor#1}{#2}} 
\newcommand{\ostSaveColor}[1]{\colorlet{ostColor@savecolor}{#1}} 
\newcommand{\ostSaveColorTo}[2]{\colorlet{#1}{#2}} 
\newcommand{\ostRestoreColor}[1]{\colorlet{#1}{ostColor@savecolor}} 
\newcommand{\ostDefineColor}[3]{\xdefinecolor{#1}{#2}{#3}}
\newcommand{\ostSetOpacity}[2]{\expandafter\def\csname ostOpacity#1\endcsname{#2}}
\newcommand{\ostSetFont}[2]{\expandafter\def\csname ostFont#1\endcsname{#2}}  
\newcommand{\ostSetSize}[2]{\expandafter\def\csname ostSize#1\endcsname{#2}}  
\newcommand{\ostSetStyle}[4]{\ostSetSize{#1}{#2}\ostSetFont{#1}{#3}\ostSetColor{#1}{#4}}

%%%-------------------------------------------------%%%
%%% Language adaption of the document %%%
%%%-------------------------------------------------%%%

\RequirePackage{babel} 
\RequirePackage[autostyle, german=guillemets]{csquotes}  

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
  \RequirePackage[svgnames, cmyk, pdftex, tables]{xcolor}  
\fi%

\ifost@rgb%
  \RequirePackage[svgnames, rgb, pdftex, tables]{xcolor} 
\fi% 

\colorlet{ostColorGlsLinkColor}{black}

\ifost@color%  
  \colorlet{ostColorTitleRuleHorizontal}{LightGray} 
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
  \colorlet{ostColorPartHeaderNumber}{LightGray}  
  \colorlet{ostColorQuoteRule}{LightGray!30}
  \colorlet{ostColorInlineCodeFrame}{LightGray}
  \colorlet{ostColorInlineCodeBackground}{LightGray!10}
  \ifost@orange%
    \colorlet{ostColorTitle}{DarkOrange}
    \colorlet{ostColorSubtitle}{DarkOrange}
    \colorlet{ostColorPartHeader}{DarkOrange} 
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
      \xdefinecolor{ostColorPartHeader}{RGB}{8,81,156}
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
     \xdefinecolor{ostColorPartHeader}{RGB}{0,109,44} 
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
     \xdefinecolor{ostColorPartHeader}{RGB}{165,15,21} 
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
  \colorlet{ostColorFooterMarks}{gray}

  \colorlet{ostColorHeaderRule}{LightGray!30}
  \colorlet{ostColorLinks}{black}
  \colorlet{ostColorCitationLinks}{black}
  \colorlet{ostColorFileLinks}{black}
  \colorlet{ostColorMenuLinks}{black}
  \colorlet{ostColorURLLinks}{gray}
  \colorlet{ostColorEmail}{gray}

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
  \colorlet{ostColorTitleRuleHorizontal}{black}
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
  \colorlet{ostColorQuoteRule}{black}
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
  \colorlet{ostColorFooterMarks}{black}

  \colorlet{ostColorLinks}{black}
  \colorlet{ostColorCitationLinks}{black}
  \colorlet{ostColorFileLinks}{black}
  \colorlet{ostColorMenuLinks}{black}
  \colorlet{ostColorURLLinks}{black}
  \colorlet{ostColorEmail}{black}

  \colorlet{ostColorInlineCodeFrame}{black}
  \colorlet{ostColorInlineCodeBackground}{white}
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

\colorlet{ostColorWarnings}{red}

% Predefined names
\let\ostcontentsname\contentsname%
\let\ostfiguresname\listfigurename%
\let\osttablesname\listtablename%
\let\ostbibname\bibname%

\newcommand{\ostTableOfContentsName}{\ostcontentsname}
\newcommand{\ostListOfFiguresName}{\ostfiguresname}
\newcommand{\ostListOfTablesName}{\osttablesname}
\newcommand{\ostBibliographyName}{\ostbibname}

% Font family, shapes, series sizes
\newcommand{\ostSizeGitInfo}{\tiny}
\newcommand{\ostFontGitInfo}{\normalfont}

\newcommand{\ostSizeEmail}{\relax}
\newcommand{\ostFontEmail}{\relax}

\newcommand{\ostFontHeaderMarks}{\itshape}
\newcommand{\ostSizeHeaderMarks}{\rmfamily}

\newcommand{\ostFontFooterMarks}{\bfseries}
\newcommand{\ostSizeFooterMarks}{\relax}

\newcommand{\ostFontTextOnBar}{\relax}
\newcommand{\ostSizeTextOnBar}{\huge}
 
\newcommand{\ostFontTitle}{\sffamily\bfseries}  
\newcommand{\ostSizeTitle}{\Huge}  

\newcommand{\ostFontSubtitle}{\bfseries\itshape}  
\newcommand{\ostSizeSubtitle}{\normalsize}  

\newcommand{\ostFontAuthors}{\rmfamily}   
\newcommand{\ostSizeAuthors}{\normalsize}   

\newcommand{\ostFontInstitution}{\rmfamily}    
\newcommand{\ostSizeInstitution}{\normalsize}    

\newcommand{\ostFontDate}{\rmfamily}    
\newcommand{\ostSizeDate}{\small}    

\newcommand{\ostFontAdvisors}{\sffamily}  
\newcommand{\ostSizeAdvisors}{\normalsize}  

\newcommand{\ostFontMarginNote}{\rmfamily} 
\newcommand{\ostSizeMarginNote}{\small} 

\newcommand{\ostFontLineNumber}{\sffamily}
\newcommand{\ostSizeLineNumber}{\tiny}

\newcommand{\ostSizePartHeader}{\hfill\fontsize{50}{70}\selectfont}
\newcommand{\ostFontPartHeader}{\sffamily\bfseries}
\newcommand{\ostFontPartHeaderNumber}{\sffamily\bfseries}
\newcommand{\ostSizePartHeaderNumber}{\hfill\fontsize{110}{70}\selectfont}

\newcommand{\ostFontChapterHeader}{\bfseries}
\newcommand{\ostFontChapterHeaderNumber}{\bfseries}
\newcommand{\ostFontSectionHeader}{\sffamily\bfseries}
\newcommand{\ostFontSectionHeaderNumber}{\sffamily\bfseries}
\newcommand{\ostFontSubsectionHeader}{\sffamily\bfseries}
\newcommand{\ostFontSubsectionHeaderNumber}{\sffamily\bfseries}
\newcommand{\ostFontSubSubsectionHeader}{\sffamily\bfseries}
\newcommand{\ostFontSubSubsectionHeaderNumber}{\sffamily\bfseries}
\newcommand{\ostFontParagraphHeader}{\sffamily\bfseries}
\newcommand{\ostFontParagraphHeaderNumber}{\sffamily\bfseries}

\newcommand{\ostSizeChapterHeader}{\huge}
\newcommand{\ostSizeChapterHeaderNumber}{\huge}
\newcommand{\ostSizeSectionHeader}{\Large}
\newcommand{\ostSizeSectionHeaderNumber}{\Large}
\newcommand{\ostSizeSubsectionHeader}{\large}
\newcommand{\ostSizeSubsectionHeaderNumber}{\large}
\newcommand{\ostSizeSubSubsectionHeader}{\normalsize}
\newcommand{\ostSizeSubSubsectionHeaderNumber}{\normalsize}
\newcommand{\ostSizeParagraphHeader}{\normalsize}
\newcommand{\ostSizeParagraphHeaderNumber}{\normalsize}


% normal toc
\newcommand{\ostFontTocPart}{\sffamily\bfseries}
\newcommand{\ostSizeTocPart}{\Large}
\newcommand{\ostFontTocChapter}{\bfseries}
\newcommand{\ostSizeTocChapter}{\relax}
\newcommand{\ostFontTocSection}{\relax}
\newcommand{\ostSizeTocSection}{\relax}
\newcommand{\ostFontTocSubsection}{\relax}
\newcommand{\ostSizeTocSubsection}{\relax}
\newcommand{\ostFontTocFigure}{\relax}
\newcommand{\ostSizeTocFigure}{\relax}
\newcommand{\ostFontTocTable}{\relax}
\newcommand{\ostSizeTocTable}{\relax}

%partial tocs
\newcommand{\ostFontPartPartialToc}{\normalfont}
\newcommand{\ostSizePartPartialToc}{\large}
\newcommand{\ostFontPartPartialTocChapter}{\bfseries}
\newcommand{\ostSizePartPartialTocChapter}{\relax}

\newcommand{\ostFontPartPartialTocSection}{\relax}
\newcommand{\ostSizePartPartialTocSection}{\relax}
\newcommand{\ostFontPartPartialTocSubsection}{\relax}
\newcommand{\ostSizePartPartialTocSubsection}{\relax}

\newcommand{\ostFontChapterPartialToc}{\normalfont}
\newcommand{\ostSizeChapterPartialToc}{\large}
\newcommand{\ostFontChapterPartialTocSection}{\relax}
\newcommand{\ostSizeChapterPartialTocSection}{\relax}
\newcommand{\ostFontChapterPartialTocSubsection}{\relax}
\newcommand{\ostSizeChapterPartialTocSubsection}{\relax}

\newcommand{\ostFont@ListingBasic}{\ttfamily}
\newcommand{\ostSize@ListingBasic}{\footnotesize}

% Predefined content and composites
\newcommand{\ostPageNumberSurrounding}{\textendash}
\newcommand{\ostPageNumber}{\thepage}

% Opacity 
\newcommand{\ostOpacityTitleOverlay}{0.7}

%%%-------------------------------------------------%%%
%%% Global spacing %%%
%%%-------------------------------------------------%%%

\ifost@setspacing
  \RequirePackage{setspace}
\fi

%%%-------------------------------------------------%%%
%%% Include Git information %%%
%%%-------------------------------------------------%%%

\ifost@gitinfo%
   \RequirePackage{gitinfo} 
   \newcommand{\ostGitUrl}{\ostSizeGitInfo\ostFontGitInfo{\href{ostGitUrl}{https://github.com/cpfaff/Open-Science-Thesis}}}
   \newcommand{\ostGitInfoLine}{{\ostSizeGitInfo\ostFontGitInfo Version from commit by \gitAuthorEmail~on~\gitAuthorDate; Source on: \ostGitUrl}\par}
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

% create lengths
\newlength{\ostHeightHeaderRule} 
\newlength{\ostHeightFooterRule}

\ifost@color
  \setlength{\ostHeightHeaderRule}{3.0pt} 
  \setlength{\ostHeightFooterRule}{3.0pt} 
\else
  \setlength{\ostHeightHeaderRule}{1.0pt} 
  \setlength{\ostHeightFooterRule}{1.0pt} 
\fi

% patch rule commands with color
\patchcmd{\footrule}{\hrule}{\color{ostColorFooterRule}\hrule}{}{}
\patchcmd{\headrule}{\hrule}{\color{ostColorHeaderRule}\hrule}{}{}

\ifost@fancyhf
  \fancypagestyle{pageStyleChapter}{%
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{\ostHeightFooterRule}
    \fancyhead{}
  } 
  \renewcommand{\headrulewidth}{\ostHeightHeaderRule}
  \renewcommand{\footrulewidth}{\ostHeightFooterRule}
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

\newlength{\ostLengthPageNumberSurroundingSep}
\setlength{\ostLengthPageNumberSurroundingSep}{{1mm}} 

\newcommand{\ostHeaderSetup}[2]{\fancyhead[#1]{{\ostSizeHeaderMarks\ostFontHeaderMarks\textcolor{ostColorHeaderMarks}{#2}}}}
\newcommand{\ostFooterSetup}[2]{\fancyfoot[#1]{{\ostSizeFooterMarks\ostFontFooterMarks\textcolor{ostColorFooterMarks}{#2}}}}

\newcommand{\ostPageNumbering}{\ostSizeFooterMarks\ostFontFooterMarks\textcolor{ostColorFooterMarks}{\ostPageNumberSurrounding\hspace{\ostLengthPageNumberSurroundingSep}\ostPageNumber\hspace{\ostLengthPageNumberSurroundingSep}\ostPageNumberSurrounding}}

\if@twoside%
  \setlength{\ostLengthPageNumberSurroundingSep}{{0mm}} 
  \renewcommand{\ostPageNumberSurrounding}{\relax}
  \ifost@fancyhf%
    \fancyhead[LE]{\ostSizeHeaderMarks\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\rightmark}}}}
    \fancyhead[RE]{\ostSizeHeaderMarks\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\leftmark}}}} 
    \fancyhead[LO]{\ostSizeHeaderMarks\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\leftmark}}}} 
    \fancyhead[RO]{\ostSizeHeaderMarks\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\rightmark}}}}
  \fi%
  % \ostFooterSetup[RO,LE]{\ostPageNumbering}
  \fancyfoot[RO,LE]{\ostPageNumbering}
\else%
  \fancyhead[L]{\ostSizeHeaderMarks\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\leftmark}}}}
  \fancyhead[R]{\ostSizeHeaderMarks\ostFontHeaderMarks{\nouppercase{\textcolor{ostColorHeaderMarks}{\rightmark}}}} 
  \fancyfoot[C]{\ostPageNumbering}
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

\newcommand{\ostSetOptions@Lettrine}[1]{%
   \ifstrequal{#1}{A}{
      \setlength{\ostLengthDefaultFindent}{-0.2em}
      \setlength{\ostLengthDefaultNindent}{0.5em}
   }{\relax}
   \ifstrequal{#1}{T}{
      \setlength{\ostLengthDefaultFindent}{0.27em}
      \setlength{\ostLengthDefaultNindent}{0.02em}
   }{\relax}
}

\newcommand{\intro}[1]{%
  \ostSetOptions@Lettrine{#1}
  \lettrine{\textcolor{ostColorLettrine}{#1}}
} 
\let\capital\intro

%%%-------------------------------------------------%%%
%%% Enable linenumbers %%%
%%%-------------------------------------------------%%%

\RequirePackage[pagewise]{lineno}

\newlength{\ostLengthLineNumberSep}

\ifost@linenumbers%
  \setlength{\ostLengthLineNumberSep}{0.2em}
  \renewcommand\linenumberfont{\color{ostColorLineNumber}\ostSizeLineNumber\ostFontLineNumber}
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
    \fi%
  \fi%
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
\RequirePackage{subcaption} 

% Load some tikz libraries
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
\tikzstyle{listinline} = [rectangle, inner sep = 2pt, rounded corners, draw=ostColorInlineCodeFrame, fill=ostColorInlineCodeBackground] 
\tikzstyle{titlepageoverlay} = [rectangle, fill=ostColorTitleOverlay, fill opacity=\ostOpacityTitleOverlay, text opacity=1, rounded corners]

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

% \newcommand{\ostFontCaption}{small, it}

%% Control caption layout %%
\RequirePackage[format=plain, margin=7pt, font={small,it}, labelformat=default, labelfont=bf]{caption}

\ifost@color
  \captionsetup{labelfont={color=ostColorCaptionLabel,bf}}
\fi

%% where to put this?
\RequirePackage{marginnote}

\ifost@setspacing
  \ifost@sensitivespacing
    \renewcommand*{\marginfont}{\singlespacing\color{ostColorMarginNote}\ostSizeMarginNote\ostFontMarginNote}
  \fi
\else
  \renewcommand*{\marginfont}{\color{ostColorMarginNote}\ostSizeMarginNote\ostFontMarginNote}
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
\RequirePackage{lstautogobble}

% \RequirePackage[scaled=0.83]{beramono}

\lstset{%
   upquote=true,%
   % columns=fixed,%
   columns=fullflexible,
   tabsize=2,%
   autogobble=true,
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
   basicstyle=\ifost@setspacing\ifost@sensitivespacing\singlespacing\fi\fi\ostSize@ListingBasic\ostFont@ListingBasic,%
   keywordstyle=\color{ostColor@ListingGreen},%
   stringstyle=\color{ostColor@ListingCyan}\ttfamily,%
   identifierstyle=\color{ostColor@ListingBlue},%
   commentstyle=\color{ostColor@ListingBase01},%
   emphstyle=\color{ostColor@ListingRed}
}

\lstset{literate=
  {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
  {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
  {à}{{\`a}}1 {è}{{\'e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
  {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
  {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
  {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
  {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
  {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
  {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
  {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
  {€}{{\EUR}}1 {£}{{\pounds}}1 {~}{{\textasciitilde}}1
}

\ifost@inlinecodestyleround
  \newcommand{\inlinecode}[1]{\raisebox{-0.27em}{\begin{tikzpicture}\node[listinline]{\lstinline|#1|};\end{tikzpicture}}}
\fi%

\ifost@inlinecodestylebox
  \newcommand{\inlinecode}[1]{\colorbox{ostColor@ListingBackground}{\lstinline|#1|}}
\fi%

\ifost@inlinecodestyleplain
  \newcommand{\inlinecode}[1]{\lstinline|#1|}
\fi%

% Usage: 
%       \inlinecode{a=a+b} 

%%%-------------------------------------------------%%%
%%% Bar-Quote  %%%
%%%-------------------------------------------------%%%

\providecommand*{\ostQuoteAuthor}{}
\define@key{ostQuote}{author}{\renewcommand*\ostQuoteAuthor{#1}}
\presetkeys{ostQuote}{author=}{}%

\newdimen\ostHeightQuoteRule
\newdimen\ostWidthQuoteRule 
\newdimen\ostLengthQuoteRuleSep 
\ostLengthQuoteRuleSep=-2.3em

\ifost@color%
  \ostWidthQuoteRule=5pt
\else%
  \ostWidthQuoteRule=2pt 
\fi%

\newcommand{\ostQuoteRule}{\textcolor{ostColorQuoteRule}{\rule{\ostWidthQuoteRule}{\ostHeightQuoteRule}}}

\newcommand{\ostquote}[2][]{
  \setkeys{ostQuote}{#1} 
  \def\ost@temp{\begin{minipage}{0.8\textwidth}% 
      {\small #2 \ifdefempty{\ostQuoteAuthor}{\relax}{\\[0.5em] \raggedright{\textbf{--}~\textit{\ostQuoteAuthor}~\textbf{--}}}}
    \end{minipage}
  }%
  \settototalheight\ostHeightQuoteRule\ost@temp
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
\let\ostQuote\ostquote

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
  \microtypesetup{protrusion=false}
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
  \microtypesetup{protrusion=true}
}

\preto{\listoffigures}{%
  \microtypesetup{protrusion=false}
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
  \microtypesetup{protrusion=true}
}

\preto{\listoftables}{
  \microtypesetup{protrusion=false}
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
  \microtypesetup{protrusion=false}
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

\newcommand{\ostAffidavitText}{
    I hereby declare that this document has been written only by the undersigned
    and without any assistance from third parties. Furthermore, I confirm that no
    sources have been used in the preparation of this document other than those
    indicated in the thesis itself. 
}

% \AtBeginDocument{
  % \iflanguage{ngerman}{\ostSetAffidavitText{
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
  \ostAffidavitText{} 

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

% lengths (between objects)

\newlength{\ostLengthTitleSpacerTitleRuleUpper} 
\setlength{\ostLengthTitleSpacerTitleRuleUpper}{2em} 
\newlength{\ostLengthTitleSpacerTitleRuleLower} 
\setlength{\ostLengthTitleSpacerTitleRuleLower}{2em} 

% dimensions (are part of an object)

\newlength{\ostWidthTitleRuleHorizontal}
\setlength{\ostWidthTitleRuleHorizontal}{\linewidth}
\newlength{\ostHeightTitleRuleHorizontal}
\setlength{\ostHeightTitleRuleHorizontal}{3pt}

\newlength{\ostWidthTitleRuleVertical}
\setlength{\ostWidthTitleRuleVertical}{3pt}
\newlength{\ostHeightTitleRuleVertical}
\setlength{\ostHeightTitleRuleVertical}{\textheight}

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
    \expandafter\savebox\csname ostImage#2\endcsname{\IfFileExists{#3}{\includegraphics[width=\widthOfTitlepageImage, keepaspectratio]{#3}}{\scalebox{2}{\color{ostColorWarnings}Image file not found or set!}}}
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

\newcommand{\ostTitleRule}{\textcolor{ostColorTitleRuleHorizontal}{\noindent\rule{\ostWidthTitleRuleHorizontal}{\ostHeightTitleRuleHorizontal}}}
\newcommand{\ostTitle}{The open science thesis} 
\newcommand{\ostSubtitle}{This is a subtitle}
\newcommand{\ostAuthors}{Author one\textsuperscript{1,2,a} and Author two\textsuperscript{2}, \ldots} 
\newcommand{\ostInstitution}{University of XY, Department Z} 
\newcommand{\ostEmail}[1]{\href{mailto:#1}{\ostSizeEmail\ostFontEmail\color{ostColorEmail}#1}} 
\newcommand{\ostDate}{\today} 
\newcommand{\ostTextOnBar}{\textcolor{LightGray}{Open~-~}\textcolor{gray}{Science}\textcolor{LightGray}{~-~Thesis}} 
\newcommand{\ostAdvisorOne}{Advisor:\\ Prof. Dr. M. Sickel\\Phone: 0234 97 38 59 1\\Fax: 0341 97 38 54 9\\E-Mail: \ostEmail{sickel@uni-fubar.de}}
\newcommand{\ostAdvisorTwo}{PD Dr. L. Dark\\Phone: 0234 44 36 33 9\\Fax: 0323 44 38 22 9\\E-Mail: \ostEmail{dark@uni-baz.de}}

\ifost@titlepagebackgroundimage%

\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing%
    \ifost@sensitivespacing%
    \begin{singlespace}
    \fi%
  \fi%
  \begin{titlepage}
    \ostTitlePageBackgroundPic{}
    {\centering% 
      \ostTitleStretchAbove{} 
      {\begin{tikzpicture}\node[titlepageoverlay]{\begin{minipage}{\textwidth}\begin{center} 
      {\par\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\noindent\ostSizeTitle\ostFontTitle\ostTitle}}\par}}\vspace{\baselineskip}   
      {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\noindent\ostSizeSubtitle\ostFontSubtitle\ostSubtitle}}\par}}\vspace{\baselineskip}
      {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\noindent\ostSizeAuthors\ostFontAuthors\ostAuthors}}\par}}
      {\ifdefempty{\ostInstitution}{\relax}{\color{ostColorInstitution}{{\noindent\ostSizeInstitution\ostFontInstitution\ostInstitution}}}\par}
      {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\noindent\ostSizeDate\ostFontDate\ostDate}}}\par}
      \ostGitInfoLine{} 
      \end{center}\end{minipage}};\end{tikzpicture}}\\
      \ostTitleStretchBelow{} 
      {\par\ifdefempty{\ostAdvisorOne}{\relax}{\begin{tikzpicture}\node[titlepageoverlay]{\begin{minipage}{\textwidth} \begin{center}{\color{ostColorAdvisors}\ostSizeAdvisors\ostFontAdvisors\ostAdvisorOne}\end{center}\end{minipage}};\end{tikzpicture}}\par} 
      \vspace{\baselineskip}
      {\par\ifdefempty{\ostAdvisorTwo}{\relax}{\begin{tikzpicture}\node[titlepageoverlay]{\begin{minipage}{\textwidth} \begin{center}{\color{ostColorAdvisors}\ostSizeAdvisors\ostFontAdvisors\ostAdvisorTwo}\end{center}\end{minipage}};\end{tikzpicture}}\par} 
    }      
  \end{titlepage}
  \ifost@setspacing%
    \ifost@sensitivespacing%
    \end{singlespace}
    \fi%
  \fi%
}
\fi%

\ifost@titlepagehorizontal  
\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing%
    \ifost@sensitivespacing%
    \begin{singlespace}
    \fi%
  \fi%
  \begin{titlepage}
    {\centering% 
      \ostTitleStretchAbove{}
      \ostTitleRule{}%
      \ostTitleSpacerTitleRuleUpper{}
      {\par\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\noindent\ostSizeTitle\ostFontTitle\ostTitle}}\par}}\vspace{\baselineskip}   
      {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\noindent\ostSizeSubtitle\ostFontSubtitle\ostSubtitle}}\par}}\vspace{\baselineskip}
      {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\noindent\ostSizeAuthors\ostFontAuthors\ostAuthors}}\par}}
      {\ifdefempty{\ostInstitution}{\relax}{\color{ostColorInstitution}{{\noindent\ostSizeInstitution\ostFontInstitution\ostInstitution}}}\par}
      {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\noindent\ostSizeDate\ostFontDate\ostDate}}}\par}
      \ostGitInfoLine{}
      \vspace{-1\baselineskip}
      \ostTitleSpacerTitleRuleLower{} 
      \ostTitleRule{}%
      \ostTitleStretchBelow{}
      {\par\ifdefempty{\ostAdvisorOne}{\relax}{\color{ostColorAdvisors}{{\ostSizeAdvisors\ostFontAdvisors\ostAdvisorOne}}}\par} 
      \vspace{\baselineskip}
      {\par\ifdefempty{\ostAdvisorTwo}{\relax}{\color{ostColorAdvisors}{{\ostSizeAdvisors\ostFontAdvisors\ostAdvisorTwo}}}\par} 
    }      
  \end{titlepage} 
  \ifost@setspacing%
    \ifost@sensitivespacing%
      \end{singlespace}
    \fi%
  \fi%
}
\fi

\ifost@titlepageplain
\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing%
    \ifost@sensitivespacing%
      \begin{singlespace}
    \fi%
  \fi%
  \begin{titlepage}
    {\centering%
      \ostTitleStretchAbove{}
      {\par\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\noindent\ostSizeTitle\ostFontTitle\ostTitle}}\par}}\vspace{\baselineskip}   
      {\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\noindent\ostSizeSubtitle\ostFontSubtitle\ostSubtitle}}\par}}\vspace{\baselineskip}
      {\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\noindent\ostSizeAuthors\ostFontAuthors\ostAuthors}}\par}}
      {\ifdefempty{\ostInstitution}{\relax}{\color{ostColorInstitution}{{\noindent\ostSizeInstitution\ostFontInstitution\ostInstitution}}}\par}
      {\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\noindent\ostSizeDate\ostFontDate\ostDate}}}\par}
      \ostGitInfoLine{} 
      \ostTitleStretchBelow{} 
      {\par\ifdefempty{\ostAdvisorOne}{\relax}{\color{ostColorAdvisors}{{\ostSizeAdvisors\ostFontAdvisors\ostAdvisorOne}}}\par} 
      \vspace{\baselineskip}
      {\par\ifdefempty{\ostAdvisorTwo}{\relax}{\color{ostColorAdvisors}{{\ostSizeAdvisors\ostFontAdvisors\ostAdvisorTwo}}}\par} 
    }
  \end{titlepage}
  \ifost@setspacing%
    \ifost@sensitivespacing%
      \end{singlespace}
    \fi%
  \fi%
}
\fi%

\ifost@titlepagevertical%
\newcommand{\ostMakeTitle}{% 
  \ifost@setspacing%
    \ifost@sensitivespacing%
    \begin{singlespace}
    \fi%
  \fi%
  \begin{titlepage}
    \mbox{
      \hspace*{0.2\textwidth}
      \rotatebox{90}{{\ostSizeTextOnBar\ostFontTextOnBar\color{ostColorTextOnBar}\ostTextOnBar}}
      \textcolor{ostColorTitleRuleVertical}{\rule{\ostWidthTitleRuleVertical}{\ostHeightTitleRuleVertical}}
      \hspace*{0.05\textwidth}
      \parbox[b]{0.75\textwidth}{
	{\par\ifdefempty{\ostTitle}{\relax}{\color{ostColorTitle}{{\noindent\ostSizeTitle\ostFontTitle\ostTitle}}\par}}\vspace{\baselineskip}   
	{\ifdefempty{\ostSubtitle}{\relax}{\color{ostColorSubtitle}{{\noindent\ostSizeSubtitle\ostFontSubtitle\ostSubtitle}}\par}}\vspace{\baselineskip}
	{\ifdefempty{\ostAuthors}{\relax}{\color{ostColorAuthors}{{\noindent\ostSizeAuthors\ostFontAuthors\ostAuthors}}\par}}
	{\ifdefempty{\ostInstitution}{\relax}{\color{ostColorInstitution}{{\noindent\ostSizeInstitution\ostFontInstitution\ostInstitution}}}\par}
	{\ifdefempty{\ostDate}{\relax}{\color{ostColorDate}{{\noindent\ostSizeDate\ostFontDate\ostDate}}}\par}
        \ostGitInfoLine{}
	\vspace{0.2\textheight}
	{\par\ifdefempty{\ostAdvisorOne}{\vspace{4\baselineskip}}{\color{ostColorAdvisors}{{\ostSizeAdvisors\ostFontAdvisors\ostAdvisorOne}}}\par}\vspace{\baselineskip}
	{\par\ifdefempty{\ostAdvisorTwo}{\vspace{4\baselineskip}}{\color{ostColorAdvisors}{{\ostSizeAdvisors\ostFontAdvisors\ostAdvisorTwo}}}\par} 
      }
    }
  \end{titlepage}
  \ifost@setspacing%
    \ifost@sensitivespacing%
    \end{singlespace}
    \fi%
  \fi%
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

\RequirePackage[noindentafter,calcwidth, compact]{titlesec}  

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

% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before-code>}[<after-code>]
% hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame

% \ifost@addtoctopart%
  % \titleformat{\part}[display]%
  % {\sffamily}%
  % {\filleft{\fontsize{110}{70}\selectfont\textcolor{ostColorPartHeaderNumber}%
  % {\bfseries\thepart}}}%
  % {-2ex}%
  % {\filleft\fontsize{50}{70}\selectfont\color{ostColorPartHeader}\bfseries}%
  % [\vspace*{4pc}{\ostSizePartPartialToc\ostFontPartPartialToc \begin{ostPartialToc}\startcontents\printcontents{p-}{0}{}\end{ostPartialToc}}\thispagestyle{empty}]
% \else%
  % \titleformat{\part}[display]%
  % {\sffamily}% influences all content 
  % {\filleft\fontsize{110}{70}\selectfont\color{ostColorPartHeaderNumber}\bfseries\thepart}% that is the part number
  % {-2ex}%
  % {\filleft\fontsize{50}{70}\selectfont\color{ostColorPartHeader}\bfseries}% that is influencing the header
  % [\thispagestyle{empty}]
% \fi%

\ifost@addtoctopart%
  \titleformat{\part}[display]%
  {\sffamily}
  {\ostSizePartHeaderNumber\color{ostColorPartHeaderNumber}\ostFontPartHeaderNumber\thepart}%
  {-2ex}%
  {\ostSizePartHeader\color{ostColorPartHeader}\ostFontPartHeader}%
  [\vspace*{4pc}{\color{ostColorPartialToc}\ostSizePartPartialToc\ostFontPartPartialToc \startcontents\printcontents{p-}{0}{}}\thispagestyle{empty}]
\else%
  \titleformat{\part}[display]%
  {\sffamily}% influences all content 
  {\ostSizePartHeaderNumber\color{ostColorPartHeaderNumber}\ostFontPartHeaderNumber\thepart}% that is the part number
  {-2ex}%
  {\ostSizePartHeader\color{ostColorPartHeader}\ostFontPartHeader}% that is influencing the header
  [\thispagestyle{empty}]
\fi%

\ifost@sectionnumbers% 
  \ifost@addtoctochapter%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\ostSizeChapterHeader\ostFontChapterHeader}
    {\color{ostColorChapterHeaderNumber}\thechapter}
    {0.5em}
    {\ostSizeChapterHeaderNumber\ostFontChapterHeaderNumber}
    [\ifost@chapterwithtoc\vspace*{3pc}{\color{ostColorPartialToc}\ostSizeChapterPartialToc\ostFontChapterPartialToc \begin{ostPartialToc}\startcontents\printcontents{c-}{1}{}\end{ostPartialToc}}\fi \thispagestyle{pageStyleChapter}]

    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \else%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\ostSizeChapterHeader\ostFontChapterHeader}
    {\color{ostColorChapterHeaderNumber}\thechapter}
    {0.5em}
    {\ostSizeChapterHeaderNumber\ostFontChapterHeaderNumber}
    [\thispagestyle{pageStyleChapter}]
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \fi%

  \titleformat{\section}
  {\color{ostColorSectionHeader}\ostSizeSectionHeader\ostFontSectionHeader}
  {\color{ostColorSectionHeaderNumber}\thesection}
  {0.5em}
  {\ostSizeSectionHeaderNumber\ostFontSectionHeaderNumber}
  \titlespacing*{\section}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\subsection}
  {\color{ostColorSubsectionHeader}\ostSizeSubsectionHeader\ostFontSubsectionHeader}
  {\color{ostColorSubsectionHeaderNumber}\thesubsection}
  {0.5em}
  {\ostSizeSubsectionHeaderNumber\ostFontSubsectionHeaderNumber}
  \titlespacing*{\subsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\subsubsection}
  {\color{ostColorSubSubsectionHeader}\ostSizeSubSubsectionHeader\ostFontSubSubsectionHeader}
  {\color{ostColorSubSubsectionHeaderNumber}\thesubsubsection}
  {0.5em}
  {\ostSizeSubSubsectionHeaderNumber\ostFontSubSubsectionHeaderNumber}
  \titlespacing*{\subsubsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\paragraph}[runin]
  {\color{ostColorParagraphHeader}\ostSizeParagraphHeader\ostFontParagraphHeader}
  {\color{ostColorParagraphHeaderNumber}\theparagraph}
  {0.5em}
  {\ostSizeParagraphHeaderNumber\ostFontParagraphHeaderNumber}
  \titlespacing*{\paragraph}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
\else%  
  
  \ifost@addtoctochapter%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\ostSizeChapterHeader\ostFontChapterHeader}
    {\color{ostColorChapterHeaderNumber}}
    {0em}
    {}
    [\ifost@chapterwithtoc\vspace*{3pc}{\color{ostColorPartialToc}\ostSizeChapterPartialToc\ostFontChapterPartialToc \begin{ostPartialToc}\startcontents\printcontents{p-}{1}{}\end{ostPartialToc}} \fi \thispagestyle{pageStyleChapter}]
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \else%
    \titleformat{\chapter}
    {\color{ostColorChapterHeader}\ostSizeChapterHeader\ostFontChapterHeader}
    {}
    {0em}
    {}
    [\thispagestyle{pageStyleChapter}]
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}
  \fi%

  \titleformat{\section}
  {\color{ostColorSectionHeader}\ostSizeSectionHeader\ostFontSectionHeader}
  {}{0em}{}
  \titlespacing*{\section}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\subsection}
  {\color{ostColorSubsectionHeader}\ostSizeSubsectionHeader\ostFontSubsectionHeader}{}{0em}{}
  \titlespacing*{\subsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\subsubsection}
  {\color{ostColorSubsectionHeader}\ostSizeSubSubsectionHeader\ostFontSubSubsectionHeader}{}{0em}{}
  \titlespacing*{\subsection}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

  \titleformat{\paragraph}[runin]
  {\color{ostColorParagraphHeader}\ostSizeParagraphHeader\ostFontParagraphHeader}{}{0em}{}
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

% style of tocs 
\ifost@fancytocs%
  \RequirePackage{titletoc}
  % \titlecontents{<section>}
		% [<left>]
		% {<above-code>}
		% {<numbered-entry-format>}
		% {<numberless-entry-format>}
		% {<filler-page-format>}[<below-code>]

  \contentsmargin{2.8em} 
  \newlength{\ostHeightTocRule}
  \newlength{\ostWidthTocRule}
  \setlength{\ostHeightTocRule}{1.8pt}
  \setlength{\ostWidthTocRule}{\linewidth}

  \newcommand{\ostTocRule}{\textcolor{ostColorTocRule}{\noindent\rule{\ostWidthTocRule}{\ostHeightTocRule}}}

  \titlecontents{part}
  [0em]
  {\addvspace{2pc}}
  {\ostSizeTocPart\ostFontTocPart\makebox[0pt][r]{\thecontentslabel\enspace}}
  {\ostSizeTocPart\ostFontTocPart}
  {\titlerule*{}\contentspage}[\ostTocRule\thispagestyle{pageStyleToc}]

  \titlecontents{p-chapter}
  [1.5em]
  {\addvspace{0.7pc}}
  {\ostSizePartPartialTocChapter\ostFontPartPartialTocChapter\makebox[0pt][r]{\thecontentslabel\enspace}}
  {\ostSizePartPartialTocChapter\ostFontPartPartialTocChapter\hspace*{-1.5em}}
  {\titlerule*[0.7em]{.}\contentspage}
  [\thispagestyle{pageStyleToc}]

  \titlecontents{p-section}
  [3.1em]
  {\ostSizePartPartialTocSection\ostFontPartPartialTocSection}
  {\ostSizePartPartialTocSection\ostFontPartPartialTocSection\makebox[0pt][r]{\thecontentslabel\enspace}}
  {}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{p-subsection}
  [5.44em]
  {\ostSizePartPartialTocSubsection\ostFontPartPartialTocSubsection}
  {\ostSizePartPartialTocSubsection\ostFontPartPartialTocSubsection\makebox[0pt][r]{\thecontentslabel\enspace}}
  {}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]
  
  \titlecontents{chapter}
  [1em]
  {\addvspace{0.7pc}}
  {\ostSizeTocChapter\ostFontTocChapter\makebox[0pt][r]{\thecontentslabel\enspace}}
  {\ostSizeTocChapter\ostFontTocChapter}
  {\titlerule*{}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{c-section}
  [1.9em]
  {\ostSizeChapterPartialTocSection\ostFontChapterPartialTocSection}
  {\ostSizeChapterPartialTocSection\ostFontChapterPartialTocSection\makebox[0pt][r]{\thecontentslabel\enspace}}
  {}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{c-subsection}
  [4.2em]
  {\ostSizeChapterPartialTocSubsection\ostFontChapterPartialTocSubsection}
  {\ostSizeChapterPartialTocSubsection\ostFontChapterPartialTocSubsection\makebox[0pt][r]{\thecontentslabel\enspace}}
  {}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{section}
  [2.6em]
  {\ostFontTocSection\ostSizeTocSection\makebox[0pt][r]{\thecontentslabel\enspace}}
  {\ostFontTocSection\ostSizeTocSection}
  {}
  {\titlerule*[0.7em]{.}\contentspage}
  [\thispagestyle{pageStyleToc}]
 
  \titlecontents{subsection}
  [4.9em]
  {\ostSizeTocSubsection\ostFontTocSubsection\makebox[0pt][r]{\thecontentslabel\enspace}}
  {\ostSizeTocSubsection\ostFontTocSubsection}
  {}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{figure}[2em]
  {\ostSizeTocFigure\ostFontTocFigure\addvspace{0.5pc}}
  {\ostSizeTocFigure\ostFontTocFigure\makebox[0pt][r]{\thecontentslabel\enspace}}
  {}
  {~\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]

  \titlecontents{table}[2em]
  {\ostSizeTocTable\ostFontTocTable\addvspace{0.5pc}}
  {\ostSizeTocTable\ostFontTocTable\makebox[0pt][r]{\thecontentslabel\enspace}}
  {}
  {\titlerule*[0.7em]{.}\contentspage}[\thispagestyle{pageStyleToc}]
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
\let\makealltables\makeallcontenttables
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

  \newcommand{\ostRevisionName}{Notes of Revisors}
  \def\todosectioning{\section{\ostRevisionName}}
  
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

%% Correction of white spaces
\RequirePackage{ellipsis}

%% To set right space after macros
\RequirePackage{xspace}

%% TeX fintuning parameters %%
\widowpenalty = 9999 % No widows
\clubpenalty = 9999 % No orphans 
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
   % \RequirePackage[protrusion=true,%
   % expansion=true,%
   % babel=true,%
   % final,%
   % tracking=true,% 
   % kerning=true,%
   % spacing=false]{microtype}     
   \RequirePackage[final, tracking=true]{microtype}
   \DeclareMicrotypeSet*[tracking]{my}% 
	  {font = */*/*/sc/*}% 
   \SetTracking{encoding = *, shape = sc}{40}

  % protusion for superscript numbers
  % \SetProtrusion{encoding={*},family={bch},series={*},size={6,7}}
		% {1={ ,750},2={ ,500},3={ ,500},4={ ,500},5={ ,500},
		 % 6={ ,500},7={ ,600},8={ ,500},9={ ,500},0={ ,500}}

\fi

% \RequirePackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10]{microtype}

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
