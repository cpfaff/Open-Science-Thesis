## Open-Science-Thesis

### About

The Open-Science-Thesis
[repository](https://github.com/cpfaff/Open-Science-Thesis) contains a LaTeX
document scaffold (or project) which is thought to be forked and used for
scientific thesis writing on GitHub. The document combines the typesetting
capabilities of LaTeX with the R programming language for statistics, using the
[Knitr](http://yihui.name/knitr/) R package. This combination allows to create
executable documents that enhance the reproducibility of your research
documents.

The Open-Science-Thesis offers a clean and logical folder structure and lots of
examples of typical typesetting requirements to help you typeset your thesis.
It comes with a makefile that helps you to compile, clean and archive the
document. For an example see the PDF file inside of the repository or have a
look into the sections below.

### Development Note

This project is still in lively development and the commands, environments and
the layout provided by the LaTeX class are subject to change. You might also
find the current version in master branch in unstable state so a compilation to
PDF is not possible!

### Use LaTeX-Class only

If you do not like to use the complete document scaffold presented here you can
also only use the LaTeX-Class as document class in your documents. You need to
[download](http://bit.ly/1dowUNP) the class file save it next to your
`document.tex` file and then include and load it in your preamble with:

```latex
\documentclass[options]{open_science_thesis}
...
```

## User interface

The open_science_thesis latex class is based on several fine LaTeX packages and
serves you a nice and clean user interface to handle most of your typesetting
requirements. You can handle line spacing, justification and various other
parameters globally by class options. Additionally there are a handful of
commands that you can use in your preamble to set content, control the color or
size of literally any element in your document.

* Example for the user interface:

```latex
% set the conent of a field
\ostSetContent{Title}{This is the title of my document}

% set the stlye of a field
\ostSetSize{Title}{\Huge}
\ostSetFont{Title}{\itshape}
\ostSetColor{Title}{green}
```

There is also a one line command that does the styling.

```latex
\ostSetStyle{<name>}{<size>}{<font>}{<colorname>}
% e.g for the title like above
\ostSetStyle{Title}{\Huge}{\itshape}{green}
```

As you can see you can set content, font and color on of an element by using
its name, here the `Title` that appears on the documents title-page is set to
be in huge and italic letters and appears in green. To find more names of
elements you can modify read through the sections below.

One note about commands provided by the class: You can distinguish between
commands that go into your preamble and the ones you can use in your document
body by their casing. While the camel case commands always have to go into the
preamble the small case only commands are suitable for your document body.

### Title pages

In order to get a title-page you need to set the contents of the title-page
fields in your preamble. As the class defines defaults for the fields you need
to set the content to empty if you decide not to use a field.

```latex
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
title-page. There is also an alias called `\printtitlepage` which does exactly
the same.

```latex
\begin{document}
	\maketitle
	% alias: \printtitlepage
\end{document}
```

You can change the title-page layout to one of four predefined styles via a
class option:

```latex
\documentclass[titlepagetheme=vertical]{open_science_thesis}
```

Some of the title-page have additional fields or setter commands associated
with them which are listed along with the layout theme examples below.

- vertical

```latex
% set the text on the bar
\ostSetContent{TextOnBar}{Text on vertical bar}
\ostSetFont{TextOnBar}{\Huge}
\ostSetColor{TextOnBar}{red}
```

![vertical](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_vertical_blue.png)

- horizontal

![horizontal](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_horizontal_blue.png)

- image

```latex
% set image
\ostSetImage{TitlepageBackground}{pathto/image.png}
% or with options
\ostSetImage[width=5cm, voffset=1cm, hoffset=1cm]{TitlepageBackground}{pathto/image.png}
```

Sets up a text centered image for title-page background.

- `width` adjust with of the image
- `voffset` adjust image vertically
- `hoffset` adjust image horizontally

```latex
% set opacity of overlay for better reading of title content
% set between 0-1
\ostSetOpacity{TitleOverlay}{0.7}

% set color of overlay
\ostSetColor{TitleOverlay}{gray}
```

Sets up the color and the opacity of an overlay between the background image
and the title-page contents. This can help make the contents better readable.
This defaults to white and an opacity of 70 percent.

![image](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_image_blue.png)

- plain

![plain](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/titlepage_plain_blue.png)

#### Colors and fonts

You can set the font shapes sizes and colors on the title page:

* colors

```latex
\ostSetColor{Title}{SteelBlue}
\ostSetColor{Subtitle}{SteelBlue}
\ostSetColor{Authors}{SteelBlue}
\ostSetColor{Date}{SteelBlue}
\ostSetColor{Advisor}{SteelBlue}
```

* fonts

```latex
\ostSetFont{Title}{\Huge}
\ostSetFont{Subtitle}{\Large\bfseries}
\ostSetFont{Authors}{...}
\ostSetFont{Date}{...}
\ostSetFont{Advisor}{...}
```

### Table of Contents

You can create your table of contents, the list of figures and the list of
tables as usual using the commands shown below.

```
\tableofcontents
\listoffigures
\listoftables
```

Additionally there is a convenient replacement that creates all these tables
for you. This convenient alternative will also create a list of revision notes
when the document is compiled in revision mode (see below).

```latex
\makeallcontenttables
% alias: \printallcontenttables
```

- fancy main tocs

![fancytoc](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/toc_fancy_blue.png)

- Nice formatted parts and partial table of contents either on part

```latex
\documentclass[toctosection=part]{open_science_thesis}
```

![parttocs](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_parttoc.png)

- or chapter sections

```latex
\documentclass[toctosection=chapter]{open_science_thesis}
```

![chaptertocs](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/overview_chaptertoc.png)

### Lettrines + coloring

The class comes with four predefined color schemes. You can choose by class option:

```latex
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
the label for the captions. You can set your own color theme by setting the
following elements colors in your preamble:

```latex
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

```latex
\ostSetColor{TitleRule}{black}
\ostSetColor{TitleRuleVertical}{black}
\ostSetColor{TextOnBar}{black}
\ostSetColor{TocRule}{black}
\ostSetColor{PartialToc}{black}
\ostSetColor{TitleOverlay}{white}
\ostSetColor{ImageFrame}{black}
\ostSetColor{Title}{black}
\ostSetColor{Subtitle}{black}
\ostSetColor{Authors}{black}
\ostSetColor{Institution}{black}
\ostSetColor{Advisors}{black}
\ostSetColor{Date}{black}
\ostSetColor{MarginNote}{black}
\ostSetColor{Advisors}{black}
\ostSetColor{CaptionLabel}{black}
\ostSetColor{PartHeader}{black}
\ostSetColor{PartHeaderNumber}{black}
\ostSetColor{ChapterHeader}{black}
\ostSetColor{ChapterHeaderNumber}{black}
\ostSetColor{SectionHeader}{black}
\ostSetColor{SectionHeaderNumber}{black}
\ostSetColor{SubsectionHeader}{black}
\ostSetColor{SubsectionHeaderNumber}{black}
\ostSetColor{SubSubsectionHeader}{black}
\ostSetColor{SubSubsectionHeaderNumber}{black}
\ostSetColor{ParagraphHeader}{black}
\ostSetColor{ParagraphHeaderNumber}{black}
\ostSetColor{Lettrine}{black}
\ostSetColor{LineNumber}{black}
\ostSetColor{HeaderRule}{black}
\ostSetColor{FooterRule}{black}
\ostSetColor{HeaderMarks}{black}
\ostSetColor{PageNumber}{black}
\ostSetColor{PageNumberSurrounding}{black}
\ostSetColor{Links}{black}
\ostSetColor{CitationLinks}{black}
\ostSetColor{FileLinks}{black}
\ostSetColor{MenuLinks}{black}
\ostSetColor{URLLinks}{black}
```

The colors for the solarize themed code listings are protected in the class.
You can change them for example using a style file. That you include into the
preamble then. Or use the `\makeatletter .... \makeatother` combination in your
preamble to allow the use of at to set them:

```latex
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

```latex
\documentclass[fontchoice={lmodern, libertine, times, palatino, utopia}]{open_science_thesis}
% defaults to libertine fonts
```

### Global formatting

You can change the line spacing globally by `linespacing` class option.

```latex
\documentclass[linespacing={onehalfspacing, doublespacing}]{open_science_thesis}
```

* `onehalfspacing` switches globally to one and half space
* `doublespacing` switches globally double space

But globally does not mean it affects all elements. I is selectively applied to
some elements only. It does not affect the title-page or any of the table of
contents neither the margin notes nor bullet, numbered or description lists.
There is also no space adjustment applied to the affidavit and the bibliography
content. If you prefer to have the line spacing applied on any content in you
document you need to disable `sensitivespacing`.

```latex
\documentclass[sentivspacing=false]{open_science_thesis}
```

You can change the justification globally by the `justification` class option.

```latex
\documentclass[justification={centered, raggedleft, raggedright}]{open_science_thesis}
```

### Float control

You can add float barriers to various headers so you get a better control over
floats. That will ensure floats will not float over one of these and will just
printed out before latex goes on with next sectioning.

```latex
\documentclass[addfloatbarrierto={part, chapter, section}]{open_science_thesis}
```

### Bibliography (based on biblatex)

You can modify the style of your bibliography:

```latex
\documentclass[style=, citestyle=, bibstyle=, natbib=]{open_science_thesis}
```

Then add a bibliography file `*.bib` in your preamble

```latex
\ostAddBibliography{path/to/test.bib}
```

### Lists (spacing and symbols)

* `compactlist` gives you more compact lists
* `fancylist` redefines the spacing and symbols used in lists

```latex
\documentclass[compactlist={true,false}, fancylist={true,false}]{open_science_thesis}
```

### Quotations

```latex
\barquote[author=test]{You nice quote}
% author is optional
```

![quotations](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/focus_quotation_orange.png)

### Frames for images

```latex
\framedfigure[placement={H,h,t,b,p}, label=yourlabel]{\includegraphics...}{caption}
```

![imageframed](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/focus_image_framed_orange.png)

### Tables (booktabs)

![table](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/focus_table_orange.png)


### Code Listings (in solarized color theme)

The code listings follow the solarized color theme by default.

![code](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/oneside_color_orange_listing.png)

You can typeset inline code listings that follow the same style using the command below.

```latex
\inlinecode{a+b=c}
```

You can change the inline code box style globally between `tikz` and `simple`
with:

```latex
\documentclass[inlinecodestyle={round, box, plain}]{open_science_thesis}
```

While tikz resembles the first of the two shown in the example figure above and
simple the second style and plain is not shown here but has nothing around it.

![code](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/inline_listings.png)

### Revisions (based on todonotes)

Set up revisors:

```latex
\ostSetRevisor{Claas}
```

Then you can comment using revisor name in the document.

```latex
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum \Claas{This is so nice}
```

You can compile the document in revision mode. This will set up the page to be
larger but keeps the typesetting area the same. Additionally line numbers are
enabled and comments from revisors (see above) are shown as side notes. If you
remove the option again then the comments of revisors are ignored.

```latex
\documentclass[revision=true]{open_science_thesis}
```

* Displays

![revision](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/revision_example_note.png)

This mechanism is picking colors automatically for 5 different revisors.

### Header and footer (fancyhdr)

Header and footer are setup by the open science thesis with predefined
parameters. If you are not happy with the styling you can change the
fontattributes with the commands below:

```latex
\ostSetSize{HeaderMarks}{\Large}
\ostSetFont{HeaderMarks}{\scshape}
\ostSetColor{HeaderMarks}{red}

\ostSetSize{FooterMarks}{\Large}
\ostSetFont{FooterMarks}{\itshape}
\ostSetColor{FooterMarks}{green}
```

If you are not happy with the content in the header and footer marks you can
setup the fields with the commands below. As thhe fancyhdr package offers a
very nice interface to do this it operates direcly on its commands.

```latex
\ostHeaderSetup{<places comma separated>}{<content>}
\ostFooterSetup{<places comma separated>}{<content>}
```

The setup of size, font and color of the header and footer marks as shown above
will also apply to your setup with these comands.

An example:

```latex
\ostHeaderSetup{LO,RE}{testcontent}
\ostHeaderSetup{RO,LE}{the other}
\ostHeaderSetup{C}{the center}
\ostFooterSetup{LO,RE}{testcontent}
\ostFooterSetup{RO,LE}{the other}
\ostFooterSetup{C}{the center}
```

As placments are allowed:

* for twoside documents:
	* `LO` left odd
	* `LE` left even
	* `RO` right odd
	* `RE` right even
	* `C` center

* for oneside documents:
	* `L` left
	* `R` right
	* `C` center

Header and footer rules can be changed by following commands.

```latex
\ostSetHeight{HeaderRule}{3pt}
\ostSetColor{HeaderRule}{red}
% width is not settable atm

\ostSetHeight{FooterRule}{3pt}
\ostSetColor{FooterRule}{red}
% width is not settable atm
```

### Affidavit

You can set up a predefined affidavit using one single command.

```latex
\makeaffidavit
% alias: \printaffidavit
```

![revision](https://raw.github.com/wiki/cpfaff/Open-Science-Thesis/figures/affidavit_page.png)

The contents of the affidavit can be changed with:

```latex
\ostSetContent{AffidavitName}{Declaration}
\ostSetContent{AffidavitText}{This work has been done by me and nobody else!}
\ostSetContent{AffidavitDate}{19.11.1981}
\ostSetContent{AffidavitLocation}{Stuttgart}
```

### Set predefined names

LaTeX has some built in names that follow the language you use with the babel
package. You can change the names with:

```latex
\ostSetContent{TableOfContentsName}{Content}
\ostSetContent{ListOfFiguresName}{Figures}
\ostSetContent{ListOfTablesName}{Tables}
\ostSetContent{BibliographyName}{Biblio}
\ostSetContent{AffidavitName}{Declaration}
```

## See also

The Open-Science-Thesis is one of a series of document classes or project
scaffolds. You might also be interested in one of the following repositories.

- [Open-Science-Paper](https://github.com/cpfaff/Open-Science-Paper)
- [Open-Science-Poster](https://github.com/cpfaff/Open-Science-Poster)

## Self-promotion

Do you like the Open-Science-Thesis repository? You are welcome to follow me on
[GitHub](https://github.com/cpfaff) and or
[Twitter](http://twitter.com/ctpfaff).

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/cpfaff/open-science-thesis/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
