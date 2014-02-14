## Open-Science-Thesis

### About

The Open-Science-Thesis
[repository](https://github.com/cpfaff/Open-Science-Thesis) contains a LaTeX
document scaffold which is thought to be forked and used for scientific thesis
writing on GitHub. The document combines the typesetting capabilities of LaTeX
with the R programming language for statistics, using the
[Knitr](http://yihui.name/knitr/) package. This combination allows for the
creation of executable documents that enhance the reproducibility of your
research documents.

The Open-Science-Thesis offers a clean and logical folder structure and lots of
examples of typical typesetting requirements to help you typeset your thesis.
It comes with a makefile that helps you to compile, clean and archive the
document. For an example see the PDF file inside of the repository or have a
look into the impressions section below.

### Development Note

This project is still in lively development and the commands, environments and
the layout provided by the LaTeX class are subject to change. You might also
find the current version in master branch in unstable state so a compilation to
PDF is not possible!

### Use LaTeX-Class only

If you do not like to use the the complete document scaffold presented here you
can also use stand along LaTeX-Class in your documents. You need to
[download](http://bit.ly/1dowUNP) the class file save it next to your document
tex file and then include and load it in your preamble with:

```
\documentclass[options]{open_science_thesis}
...
```

## User interface

The open_science_thesis latex class is based on several fine LaTeX packages and
serves you a nice and clean user interface to handle most of your typesetting
requirements. You can handle linespacing, justification and various other
paramters globally by class options. Additionally there are a handful of
commands that you can use in your preamble to set content, control the color or
size of literally any element in your document.

* Example for the user interface:

```
\ostSetContent{Title}{This is the title of my document}
\ostSetFont{Title}{\Huge}
\ostSetColor{Title}{green}
```

As you can see you can set content, font and color on of an element here the
`Title` that appears on the titlepage. For more see sections below.


### Titlepages

In order to get a titlepage you need to set the contents of the titlepage
fields in your preamble. As the class defines defaults for the fields you need
to set the content to empty if you decide not to use a field.

```
\ostSetContent{Title}{My own title}
\ostSetContent{Subtitle}{The subtitle}
\ostSetContent{Authors}{Authors}
\ostSetContent{Date}{10.10.1983}
\ostSetContent{AdvisorOne}{Advisor: \\ Markus Muggel\\ Hogstreet 1\\ Telephone 1234234}
\ostSetContent{AdvisorTwo}{Alexus Quercus\\ Hogstreet 1\\ Telephone 1234234}
% example where advisor two is not used
\ostSetContent{AdvisorTwo}{}
```

In your document body then use the command `\maketitle` to print out the
titlepage. There is also an alias called `\printtitle` which does exactly the
same.

```
\begin{document}
	% printtitle
	\maketitle
\end{document}
```

You can change the titlepage layout to four predefined styles via a class
option:

```
\documentclass[titlepagetheme=vertical]{open_science_thesis}
```

An set the contents for all titlepages with:


- vertical

```
% set the text on the bar
\ostSetContent{TextOnBar}{Text on vertical bar}
```

![vertical](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_vertical_blue.png)

- horizontal

![horizontal](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_horizontal_blue.png)

- image

```
% set image
\ostSetImage{TitlepageBackground}{pathto/image.png}
% or
\ostSetImage[width=5cm, voffset=1cm, hoffset=1cm]{TitlepageBackground}{pathto/image.png}

% set opacity of overlay for better reading of title content
% set between 0-1
\ostSetOpacity{TitleOverlay}{0.7}

% set color of overlay
\ostSetColor{TitleOverlay}{gray}
```

![image](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_image_blue.png)

- plain

![plain](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_plain_blue.png)

#### Colors and fonts

You can set the font shapes sizes and colors on the title page:

* colors

```
\ostSetColor{Title}{SteelBlue}
\ostSetColor{Subtitle}{SteelBlue}
\ostSetColor{Authors}{SteelBlue}
\ostSetColor{Date}{SteelBlue}
\ostSetColor{Advisor}{SteelBlue}
```

* fonts

```
\ostSetFont{Title}{\Huge}
\ostSetFont{Subtitle}{\Large\textbf}
\ostSetFont{Authors}{...}
\ostSetFont{Date}{...}
\ostSetFont{Advisor}{...}
```

### Table of Contents

- fancy main tocs

![fancytoc](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/toc_fancy_blue.png)

- Nice formatted parts and partial tocs either on part

```
\documentclass[toctosection=part]{open_science_thesis}
```

![parttocs](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_parttoc.png)

- or chapter sections

```
\documentclass[toctosection=chapter]{open_science_thesis}
```

![chaptertocs](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_chaptertoc.png)

### Lettrines + coloring

The class comes with four predefined color schemes. You can choose by class option:

```
\documentclass[colortheme=orange]{open_science_thesis}
```

* orange

![orange](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_colortheme_orange.png)

* blue

![blue](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_colortheme_blue.png)

* green

![green](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_colortheme_green.png)

* red

![red](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_colortheme_red.png)

#### Own color theme

You can set the color of almost any element in the document. The most prominent
elements that follow the color theme are the title page elements, sections and
the label for the captions. You can set your own colortheme by setting the
following elements colors in your preamble:

```
\ostSetColor{Title}{DarkOrange}
\ostSetColor{Subtitle}{DarkOrange}
\ostSetColor{ChapterHeader}{DarkOrange}
\ostSetColor{SectionHeader}{DarkOrange}
\ostSetColor{SubsectionHeader}{DarkOrange}
\ostSetColor{SubSubsectionHeader}{DarkOrange}
\ostSetColor{ParagraphHeader}{DarkOrange}
\ostSetColor{CaptionLabel}{DarkOrange}
```

Other elements you can change directly:

```
\ostSetColor{ostColorTitleRule}{black}
\ostSetColor{ostColorTitleRuleVertical}{black}
\ostSetColor{ostColorTextOnBar}{black}
\ostSetColor{ostColorTocRule}{black}
\ostSetColor{ostColorPartialToc}{black}
\ostSetColor{ostColorTitleOverlay}{white}
\ostSetColor{ostColorImageFrame}{black}
\ostSetColor{ostColorTitle}{black}
\ostSetColor{ostColorSubtitle}{black}
\ostSetColor{ostColorAuthors}{black}
\ostSetColor{ostColorInstitution}{black}
\ostSetColor{ostColorAdvisors}{black}
\ostSetColor{ostColorDate}{black}
\ostSetColor{ostColorMarginNote}{black}
\ostSetColor{ostColorAdvisors}{black}
\ostSetColor{ostColorCaptionLabel}{black}
\ostSetColor{ostColorPartHeader}{black}
\ostSetColor{ostColorPartHeaderNumber}{black}
\ostSetColor{ostColorChapterHeader}{black}
\ostSetColor{ostColorChapterHeaderNumber}{black}
\ostSetColor{ostColorSectionHeader}{black}
\ostSetColor{ostColorSectionHeaderNumber}{black}
\ostSetColor{ostColorSubsectionHeader}{black}
\ostSetColor{ostColorSubsectionHeaderNumber}{black}
\ostSetColor{ostColorSubSubsectionHeader}{black}
\ostSetColor{ostColorSubSubsectionHeaderNumber}{black}
\ostSetColor{ostColorParagraphHeader}{black}
\ostSetColor{ostColorParagraphHeaderNumber}{black}
\ostSetColor{ostColorLettrine}{black}
\ostSetColor{ostColorLineNumber}{black}
\ostSetColor{ostColorHeaderRule}{black}
\ostSetColor{ostColorFooterRule}{black}
\ostSetColor{ostColorHeaderMarks}{black}
\ostSetColor{ostColorPageNumber}{black}
\ostSetColor{ostColorPageNumberSurrounding}{black}
\ostSetColor{ostColorLinks}{black}
\ostSetColor{ostColorCitationLinks}{black}
\ostSetColor{ostColorFileLinks}{black}
\ostSetColor{ostColorMenuLinks}{black}
\ostSetColor{ostColorURLLinks}{black}
```

The colors for the solarize themed code listings are protected in the class.
You can change them for example using a style file. That you include into the
preamble then. Or use the `\makeatletter .... \makeatother` combination in your
preamble to allow the use of at to set them:

```
\makeatletter
\ostSetColor{@ListingBackground}{gray}
\ostSetColor{@ListingBase00}{gray}
\ostSetColor{@ListingBase01}{gray}
\ostSetColor{@ListingBase02}{gray}
\ostSetColor{@ListingBase03}{gray}
\ostSetColor{@ListingBase0}{gray}
\ostSetColor{@ListingBase1}{gray}
\ostSetColor{@ListingBase2}{gray}
\ostSetColor{@ListingBase3}{gray}
\ostSetColor{@ListingYellow}{gray}
\ostSetColor{@ListingOrange}{gray}
\ostSetColor{@ListingRed}{gray}
\ostSetColor{@ListingMagenta}{gray}
\ostSetColor{@ListingViolet}{gray}
\ostSetColor{@ListingBlue}{gray}
\ostSetColor{@ListingCyan}{gray}
\ostSetColor{@ListingGreen}{gray}
\makeatother
```

### Fonts

You can modify fonts globally by class option.

```
\documentclass[fontchoice={lmodern, libertine, times, palatino, utopia}]{open_science_thesis}
% defaults to libertine fonts
```

### Global formatting

You can change the linespacing globally by `linespacing` class option.

```
\documentclass[linespacing={onehalfspacing, doublespacing}]{open_science_thesis}
```

* `onehalfspacing` switches globally to onehalfspacing
* `doublespacing` switches globally doublespacing

But globally does not mean it affekts all elements. I is sentitively applied to
text elements only. It will not be applied on titlepage any of the table of
contents, marginnotes or bullet and numbered lists. There is also no
doublespace in affidavit and in the bibliography.

If you prefer to have more linespacing on any element in the document you have
to add the class option `sentivspacing`.

```
\documentclass[sentivspacing=false]{open_science_thesis}
```

You can change the justification globally by `justification` class option.

```
\documentclass[justification={centered, raggedleft, raggedright}]{open_science_thesis}
```

### Float control

You can add float barriers to various headers so you get a better control over
floats.  That will ensure floats will not float over one of these and will just
printed out before latex goes on with next sectioning.

```
\documentclass[addfloatbarrierto={part, chapter, section}]{open_science_thesis}
```

### Bibliography (based on biblatex)

You can modify the style of your bibliography:

```
\documentclass[style=, citestyle=, bibstyle=, natbib=]{open_science_thesis}
```

Then add a bibfile in your preamble

```
\ostAddBibliography{path/to/test.bib}
```

### Lists (spacing and symbols)

* `compactlist` gives you more compact lists
* `fancylist` redefines the spacing and symbols used in lists

```
\documentclass[compactlist={true,false}, fancylist={true,false}]{open_science_thesis}
```

### Quotations

```
\barquote[author=test]{You nice quote}
% author is optional
```

![quotations](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/focus_quotation_orange.png)

### Frames for images

```
\framedfigure[placement={H,h,t,b,p}, label=yourlabel]{\includegraphics...}{caption}
```

![imageframed](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/focus_image_framed_orange.png)

### Tables (booktabs)

![table](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/focus_table_orange.png)


### Code Listings (in solarized color theme)

![code](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/oneside_color_orange_listing.png)


### Revisions (based on todonotes)

Set up revisors:

```
\ostSetRevisor{Claas}
```

Then you can comment using revisor name in the document.

```
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum \Claas{This is so nice}
```

You can compile the document in revision mode. This will set up the page to be
larger but keeps the typesetting area the same. Additionally linenumbers are
enabled and comments from revisors (see above) are shown as side notes. If you
remove the option again then the comments of revisors are ignored.

```
\documentclass[revision=true]{open_science_thesis}
```

* Displays

![revision](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/revision_example_note.png)

This mechanism is picking colors automatically for 5 different revisors.


### Affidavit

You can set up a predefined affidavit using one signel command.

```
\makeaffidavit
```

![revision](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/affidavit_page.png)

The contents can be changed

```
\ostSetContent{AffidavitName}{Declaration}
\ostSetContent{AffidavitDeclaration}{This work has been done by me and nobody else!}
\ostSetContent{AffidavitDate}{19.11.1981}
\ostSetContent{AffidavitLocation}{Stuttgart}
```

### Set predefined names

```
\ostSetContent{TableOfContentsName}{Content}
\ostSetContent{ListOfFiguresName}{Figures}
\ostSetContent{ListOfTablesName}{Tables}
\ostSetContent{BibliographyName}{Biblio}
\ostSetContent{AffidavitName}{Declaration}
```


## See also

The Open-Science-Thesis is one of a series of document classes. You might also
be interested in one of the following repositories.

- [Open-Science-Paper](https://github.com/cpfaff/Open-Science-Paper)
- [Open-Science-Poster](https://github.com/cpfaff/Open-Science-Poster)

## Self-promotion

Do you like the Open-Science-Thesis repository? You are welcome to follow me on
[GitHub](https://github.com/cpfaff) and or
[Twitter](http://twitter.com/ctpfaff).

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/cpfaff/open-science-thesis/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

