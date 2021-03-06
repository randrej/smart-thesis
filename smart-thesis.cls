\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{smart-thesis}[2020-01-31 Typographically sound thesis/book class]

%
% Smart Thesis LaTeX template
%
% [To underline the amateurish flavour of this template, let's start with some
% nifty ASCII-Art (http://www.network-science.de/ascii/)...]
%
%      #######
%    /       ###
%   /         ##                                          #
%   ##        #                                          ##
%    ###                                                 ##
%   ## ###      ### /### /###     /###   ###  /###     ########
%    ### ###     ##/ ###/ /##  / / ###  / ###/ #### / ########
%      ### ###    ##  ###/ ###/ /   ###/   ##   ###/     ##
%        ### /##  ##   ##   ## ##    ##    ##            ##
%          #/ /## ##   ##   ## ##    ##    ##            ##
%           #/ ## ##   ##   ## ##    ##    ##            ##
%            # /  ##   ##   ## ##    ##    ##            ##
%  /##        /   ##   ##   ## ##    /#    ##            ##
% /  ########/    ###  ###  ### ####/ ##   ###           ##
%/     #####       ###  ###  ### ###   ##   ###           ##
%|
% \)
%
%
%  /###           /  /
% /  ############/ #/                              #
%/     #########   ##                             ###
%#     /  #        ##                              #
% ##  /  ##        ##
%    /  ###        ##  /##      /##       /###   ###        /###
%   ##   ##        ## / ###    / ###     / #### / ###      / #### /
%   ##   ##        ##/   ###  /   ###   ##  ###/   ##     ##  ###/
%   ##   ##        ##     ## ##    ### ####        ##    ####
%   ##   ##        ##     ## ########    ###       ##      ###
%    ##  ##        ##     ## #######       ###     ##        ###
%     ## #      /  ##     ## ##              ###   ##          ###
%      ###     /   ##     ## ####    /  /###  ##   ##     /###  ##
%       ######/    ##     ##  ######/  / #### /    ### / / #### /
%         ###       ##    ##   #####      ###/      ##/     ###/
%                         /
%                        /
%                       /
%                      /
%
% About:
% ======
%
% This template is a re-implementation of the "classicthesis" template by André
% Miede. However, it uses the "memoir" class as a basis, eliminating most
% of the external packages required by "classicthesis" and thus (hopefully)
% achieving a higher compatibility with other LaTeX packages. Large parts of
% the code have been adapted (ransacked) from André Miedes code.
%
% You can find more information about "classicthesis" at CTAN:
%
% https://www.ctan.org/pkg/classicthesis
%
% More information about the "memoir" package can be found here:
%
% https://www.ctan.org/pkg/memoir
%
%
% Authors:
% ========
%
% Jan Philip Göpfert, Andreas Stöckel
%
%
% License:
% ========
%
% This LaTeX template is published under the Creative Commons Zero license. To
% the extent possible under law, the authors have waived all copyright and
% related neighboring rights to Smart Thesis. This work is published from:
% Germany.
%

%
% CLASS INHERITANCE
%

\LoadClass{memoir}

%
% EXTERNAL PACKAGES
%
\usepackage[usenames,dvipsnames,svgnames]{xcolor}
\usepackage{ragged2e} % for marginnote

%
% CLASS OPTIONS
%

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=st, prefix=st@}

% options

% Pass unrecognized options to memoir
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\ProcessKeyvalOptions{st}

%
% FONT DEFINITIONS
%

% Use the following code for XeLaTeX
\ifxetex

	% Setup microtype for XeLaTeX
	\usepackage[expansion=false,final]{microtype}

	% Load the texgyrepagella font as main font and set the ``mathpazo'' font
	% as math font
	\usepackage{fontspec}
	\usepackage{mathpazo}
	\setmainfont%
	[%
		BoldFont       = texgyrepagella-bold.otf,
		ItalicFont     = texgyrepagella-italic.otf,
		BoldItalicFont = texgyrepagella-bolditalic.otf,
		Ligatures      = TeX
	]%
	{texgyrepagella-regular.otf}

	% Define a new 'widespaced' font that is used in section headings or
	% chapter titles.
	% For backwards compatibility reasons this uses the old calling convention
	% \newfontfamily\fontname[<options>{font} instead of the newer
	% \newfontfamily\fontname{font}[<options>]
	\newfontfamily\widespaced[%
		LetterSpace=15,%
		WordSpace={1.25, 1.25, 1.25}%
	]{texgyrepagella-regular.otf}%

	\DeclareRobustCommand{\spacedallcaps}[1]{%
		{\widespaced\oldstylenums{\MakeTextUppercase{#1}}}%
	}%
	\DeclareRobustCommand{\spacedlowsmallcaps}[1]{%
		{\widespaced\oldstylenums{\textsc{\MakeTextLowercase{#1}}}}%
	}%
\fi

% Use the following code for pdfLaTex
\ifpdf%
	% Setup microtype for pdfLaTex
	\usepackage[final,tracking=true,kerning=true,spacing=nonfrench]{microtype}

	\usepackage[sc]{mathpazo}

	\DeclareRobustCommand{\spacedallcaps}[1]{%
		\textls[160]{\oldstylenums{\textsc{\MakeTextUppercase{#1}}}}}%
	\DeclareRobustCommand{\spacedlowsmallcaps}[1]{%
		\textls[80]{\oldstylenums{\textsc{\MakeTextLowercase{#1}}}}}%
\fi

% Increase linespread for Palatino
\renewcommand{\linespread}{1.05}

%
% COLOR DEFINITIONS
%

\definecolor{smartgray}{gray}{0.55}
\definecolor{smartred}{HTML}{800000}
\definecolor{smartplum}{HTML}{47294F}
\definecolor{smartblue}{HTML}{193A6B}
\definecolor{smartorange}{HTML}{AA4C00}
\definecolor{smartgreen}{HTML}{3C7705}
\definecolor{smartbutter}{HTML}{A08300}

\definecolor{tangored}{HTML}{CC0000}
\definecolor{tangoplum}{HTML}{75507B}
\definecolor{tangoblue}{HTML}{3465A4}
\definecolor{tangoorange}{HTML}{F57900}
\definecolor{tangogreen}{HTML}{73D216}
\definecolor{tangobutter}{HTML}{EDD400}

\definecolor{shadecolor}{gray}{0.95}

\colorlet{heading}{smartgray}
\colorlet{ref}{smartblue}
\colorlet{cite}{smartgreen}
\colorlet{url}{smartred}
\colorlet{caption}{black}
\colorlet{margincaption}{caption}

%
% SECTIONING STYLES (toledo)
%

% See
% http://tex.stackexchange.com/questions/161577/memoir-hangnum-chapter-number-in-right-margin-switch
% for the inspiration

\setsecnumdepth{subsection}

\makeatletter
\makechapterstyle{toledo}{%
	\chapterstyle{default}

	\renewcommand*{\chapterheadstart}{\vspace*{0.0cm}}

	\renewcommand*{\chapnumfont}{%
		\normalfont\color{heading}\addfontfeature{SizeFeatures={Size=110}}}
	\newfont{\chapterNumber}{eurb10 scaled 7000}
	\renewcommand*{\chapnumfont}{\chapterNumber\color{heading}}
	\renewcommand*{\printchaptername}{}
	\renewcommand*{\chapternamenum}{}
	\renewcommand*{\printchapternum}{%
		\raisebox{0pt}[0pt][0pt]{%
			\makebox[0pt][l]{%
				\makebox[\dimexpr\textwidth+5.45em\relax][l]{%
					\parbox[t]{\textwidth}{\mbox{}}%
					\parbox[t]{5.45em}{\hfill\chapnumfont\thechapter}}}}}%
	\renewcommand*{\chapternamenum}{}
	\renewcommand*{\afterchapternum}{}

	\renewcommand*{\afterchaptertitle}{%
		\par\parbox{\textwidth}{\hrulefill}\par%
		\vspace*{4ex}}
	\renewcommand*{\chaptitlefont}{\normalfont\large}
	\renewcommand*{\printchaptertitle}[1]{%
		\parbox[b]{\textwidth}{%
			\raggedright\chaptitlefont\spacedallcaps{##1}%
		}%
	}

	\setsecheadstyle{\spacedlowsmallcaps}
	\setsecindent{-3.5ex}
	\setbeforesecskip{-4ex plus -1ex minus -.2ex}
	\setaftersecskip{4ex plus 1ex minus 0.2ex}

	\setsubsecheadstyle{\itshape} % chktex 6
	\setbeforesubsecskip{-4ex plus -1ex minus -0.2ex}
	\setaftersubsecskip{4ex plus 1ex minus 0.2ex}
	\setsecnumformat{\spacedlowsmallcaps{\csname the##1\endcsname\quad}}

	%	\setparaheadstyle{\normalsize\itshape}

	\renewcommand*{\abstractnamefont}{\spacedlowsmallcaps}
}
\makeatother

\chapterstyle{toledo}

%
% FIGURES
%

\captionstyle{\small}
\captionnamefont{\slshape\color{caption}} % chktex 6

\newsubfloat{figure}% Create subfloat in figure environment
\newsubfloat{table}% Create subfloat in table environment

%
% ACKNOWLEDGEMENT
%

\makeatletter
\newcommand{\acknowledgementname}{Acknowledgements}
\newenvironment{acknowledgement}{%
	\setup@bstract
	\if@bsrunin\else
		\ifnumber@bs \num@bs \else
			\begin{\absnamepos}%
			\abstractnamefont\acknowledgementname\end\absnamepos%
			\vspace{\abstitleskip}%
		\fi
	\fi
	\put@bsintoc%
	\begin{@bstr@ctlist}\if@bsrunin\@bsrunintitle\fi\abstracttextfont}%
		{\par\end{@bstr@ctlist}}

\newcommand{\smartcopyright}[1]{\begingroup%
\pagebreak%
\thispagestyle{empty}%
\footnotesize%
\par\vspace*{\fill}%
\hspace{-1.1cm}%
\parbox{10cm}{%
\noindent%
Copyright \textcopyright\ \the\year\ \applytolist[, ]{}{\@author}\\[0.5cm]%
{#1}%
}%
\endgroup}

\newcommand{\smartinitialepigraph}[2]{\begingroup
	\cleardoublepage%
	\thispagestyle{empty}
	\vspace*{2cm}
	\epigraph{#1}{#2}
	\cleardoublepage%
	\endgroup}

\let\oldepigraph\epigraph%
\renewcommand{\epigraph}[2]{\oldepigraph{#1}{\spacedlowsmallcaps{#2}}}

\makeatother

%
% MARGINNOTE
%

%
% There are three commands for placing elements in the margin:
%
% \marginnote{<TEXT>}
% Just like \marginpar but with correct formating
%
% \marginfig{<SHORT CAPTION>}{<FIGURE CONTENT>}{<LONG CAPTION>}{\label{<LABEL>}}
% \margintbl{<SHORT CAPTION>}{<TABLE CONTENT>}{<LONG CAPTION>}{\label{<LABEL>}}
% Places a figure/table in the margin
% - <SHORT CAPTION> is the caption as it occurs in the list of figures/tables
% - <FIGURE CONTENT>/<TABLE CONTENT> is the actual figure/table content
% - <LONG CAPTION> is the caption below the figure
% - <LABEL> is the label -- we decided to let you explicitly type "\label" here
% as this allows LaTeX editors to index the label and provide auto completion.
%

% Define the "marginnote" command. For compatibility reasons we do not override
% marginpar.
\strictpagecheck%
\newcommand{\marginnote}[1]{%
\hspace*{0pt}%
\marginpar{%
\microtypesetup{disable}%
\slshape\footnotesize%
\vspace*{-0.725em}%
\checkoddpage%
\ifoddpage%
	\RaggedRight%
\else%
	\RaggedLeft%
\fi%
{#1}%
\microtypesetup{enable}%
}%
\ignorespaces%
}

\newcommand{\marginfloat}[8]{\marginnote{{#1}%
\par\refstepcounter{#4}\textcolor{margincaption}{#5 #6}: {#2}#3}%
\addcontentsline{#7}{#4}{%
	\protect\numberline {#6}{\ignorespaces #8}}\ignorespaces}

\newcommand{\marginfig}[4]{%
	\marginfloat{#2}{#3}{#4}{figure}{Figure}{\thefigure}{lof}{#1}}
\newcommand{\margintbl}[4]{%
	\marginfloat{#2}{#3}{#4}{table}{Table}{\thetable}{lot}{#1}}

%
% PAGE STYLE (headers, footers)
%

\makeatletter

% Deactivate capitalization of headers.
\nouppercaseheads%

% Define the new "berlin" style.
\makepagestyle{berlin}

% Display the page number in the footer.
\makeevenfoot{berlin}{\thepage}{}{}
\makeoddfoot{berlin}{}{}{\thepage}

% Override the chapter style with the unfinished "berlin" style to eliminate
% the header and to make sure a consistent footer style is used.
\copypagestyle{chapter}{berlin}

% Define the "berlin" style
\makepsmarks{berlin}{%
\def\chaptermark##1{%
\markboth{\memUChead{%
		\ifnum \c@secnumdepth >\m@ne
			\if@mainmatter%
				\@chapapp\ \thechapter. \ %
			\fi
		\fi
		##1}}{}}%
\def\tocmark{\markboth{\memUChead{\contentsname}}{\memUChead{\contentsname}}}%
\def\lofmark{%
	\markboth{\memUChead{\listfigurename}}{\memUChead{\listfigurename}}}%
\def\lotmark{%
	\markboth{\memUChead{\listtablename}}{\memUChead{\listtablename}}}%
\def\bibmark{\markboth{\memUChead{\bibname}}{\memUChead{\bibname}}}%
\def\indexmark{\markboth{\memUChead{\indexname}}{\memUChead{\indexname}}}%
\def\sectionmark##1{%
\markright{\memUChead{%
		\ifnum \c@secnumdepth > \z@
			\thesection. \ %
		\fi %
		##1}}}}
\makepsmarks{berlin}{%
	\createmark{chapter}{left}{nonumber}{}{}
	\createmark{section}{right}{shownumber}{}{\ }
	\createplainmark{toc}{both}{\contentsname}
	\createplainmark{lof}{both}{\listfigurename}
	\createplainmark{lot}{both}{\listtablename}
	\createplainmark{bib}{both}{\bibname}
	\createplainmark{index}{both}{\indexname}
	\createplainmark{glossary}{both}{\glossaryname}
}

% Discriminate between "oneside" and "twoside" documents.
\if@twoside
	\makeevenhead{berlin}{\spacedlowsmallcaps{\leftmark}}{}{}
	\makeoddhead{berlin}{}{}{\spacedlowsmallcaps{\rightmark}}
\else
	\makeoddhead{berlin}{\spacedlowsmallcaps{\rightmark}}{}{}
\fi

% Use the berlin style.
\pagestyle{berlin}

\makeatother

%
% FOOTNOTES
%

\footmarkstyle{\textsc{#1}}
\setlength{\footmarkwidth}{-0.5em}
\setlength{\footmarksep}{0.5em}
\setlength{\footparindent}{0em}

%
% EPIGRAPHS
%
\makeatletter

% Make the epigraph span two third of the text width
\setlength{\epigraphwidth}{0.66\textwidth}

% Disable the rule below the epigraph
\setlength{\epigraphrule}{0pt}

% Use the normal font size
\epigraphfontsize{\normalsize}

% Style the epigraph itself -- use italic text and
% flush it to the right
\newenvironment{epigraphstyle}{%
	%	\microtypesetup{disable}%
	\small\slshape%
	%	\RaggedLeft%
}{%
	%	\microtypesetup{enable}%
}
\epigraphtextposition{epigraphstyle}

% Style the epigraph source -- prepend it with a em-dash
% and make sure no indentation is added after the epigraph
\newenvironment{epigraphsourcestyle}%
{%#
	--- \small\raggedleft\color{smartred}%
}{%
	\@afterindentfalse\@afterheading%
}
\epigraphsourceposition{epigraphsourcestyle}

\makeatother

%
% TITLEPAGE
%

\makeatletter
\newcommand\thesistype[1]{\renewcommand\@thesistype{#1}}
\newcommand\@thesistype{}

\newcommand\discipline[1]{\renewcommand\@discipline{#1}}
\newcommand\@discipline{}

\newcommand\institution[1]{\renewcommand\@institution{#1}}
\newcommand\@institution{}

\newcommand\supervisors[1]{\renewcommand\@supervisors{#1}}
\newcommand\@supervisors{}

\newcommand\internalid[1]{\renewcommand\@internalid{#1}}
\newcommand\@internalid{}

\newcommand{\applytolist}[3][{,\\\vspace{0.1cm}}]{%
	\def\nextitem{\def\nextitem{#1}}%
	\@for \el:=#3\do{\nextitem{#2{\el}}}%
}

\newcommand{\smarttitle}{{%
			\begingroup
			\thispagestyle{empty}
			\makeatletter
			\raggedright
			\vfill
			{\LARGE \spacedallcaps{\@thesistype} \\}
			{\Large \spacedlowsmallcaps{\@discipline}\\}
			\vfill
			{\Huge \textcolor{smartred}{\spacedallcaps{\@title}}\\}
			\vfill
			{\LARGE \applytolist{\spacedallcaps}{\@author}\\}
			\vfill
			{\Large \applytolist{\itshape}{\@institution}} % chktex 6
			\vfill
			{\Large \spacedlowsmallcaps{Supervised by}\\}
			\vspace{0.1cm}
			{\large \applytolist{\spacedallcaps}{\@supervisors}}
			\vfill
			\vfill
			{\Large%
				\spacedlowsmallcaps{\@date} %
				\hfill \spacedlowsmallcaps{\@internalid}}
			\vfill
			\makeatother
			\endgroup}}

\makeatletter

%
% PAGE LAYOUT
%
\settypeblocksize{23.45cm}{11.85cm}{*}
%\setlength{\textheight}{23.45cm}
%\setlength{\textwidth}{11.85cm}
\setlrmargins{3.141592653589793cm}{*}{*}
\setulmargins{*}{*}{*}
\setmarginnotes{0.8cm}{3.5cm}{1cm}
\checkandfixthelayout%
