% The LaTeX class file should maintain a clean separation between the style and content.
% Users should not have to modify the class file to change the document's content.


%-----------------------------------------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{dlut-thesis}
[2024/03/05 0.0.1 Dalian University of Technology Thesis Template]
\def\version{0.0.1}


%-----------------------------------------------------------------------------------------------------------------------
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
\RequirePackage{upgreek}
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}
\RequirePackage{pdfpages}
\RequirePackage{ifthen}
\RequirePackage{ifpdf}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifdlut@istwoside\dlut@istwosidefalse
\newif\ifdlut@overleaf\dlut@overleaffalse
\DeclareOption{twoside}{\dlut@istwosidetrue}
\DeclareOption{overleaf}{\dlut@overleaftrue}

\newif{\ifHidden}
\DeclareOption{hide}{\Hiddentrue}
\DeclareOption{nohide}{\Hiddenfalse}

\ProcessOptions\relax
\ifdlut@istwoside
	\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto,fontset=none]{ctexbook}
\else
	\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto,fontset=none]{ctexbook}
\fi

%-----------------------------------------------------------------------------------------------------------------------
% hide with x
\RequirePackage{xstring}
\RequirePackage{forloop}
\newcounter{Num}
\newcommand{\Anon}[1]{
	\ifHidden
		\StrLen{#1}[\StringLen]
		\forloop{Num}{0}{\theNum<\StringLen}{x}
	\else
		#1
	\fi
}
% hide with nothing
\newcommand{\Hide}[1]{
	\ifHidden
	\else
		#1
	\fi
}


%-----------------------------------------------------------------------------------------------------------------------
\RequirePackage[CJKchecksingle,BoldFont]{xeCJK}

\ProcessOptions\relax
\ifdlut@overleaf
	\setmainfont{Times New Roman}
\else
	\setmainfont[
		Path="fonts/windows/",
		BoldFont={timesbd.ttf},
		ItalicFont={timesi.ttf},
		BoldItalicFont={timesbi.ttf},
	]{times.ttf}
\fi

\setCJKmainfont[Path="fonts/adobe/"]{AdobeSongStd-Light.otf}
\setCJKsansfont[Path="fonts/adobe/"]{AdobeHeitiStd-Regular.otf}

\setCJKfamilyfont{zhsong}    [Path="fonts/adobe/"]   {AdobeSongStd-Light.otf}
\setCJKfamilyfont{zhhei}     [Path="fonts/adobe/"]   {AdobeHeitiStd-Regular.otf}
\setCJKfamilyfont{zhkai}     [Path="fonts/adobe/"]   {AdobeKaitiStd-Regular.otf}
\setCJKfamilyfont{zhfs}      [Path="fonts/adobe/"]   {AdobeFangsongStd-Regular}
\setCJKfamilyfont{zhxingkai} [Path="fonts/windows/"] {STXingKai.ttf}
\setCJKfamilyfont{zhxihei}   [Path="fonts/windows/"] {STXiHei.ttf}

\NewDocumentCommand \songti   {} {\CJKfamily{zhsong}   }
\NewDocumentCommand \heiti    {} {\CJKfamily{zhhei}    }
\NewDocumentCommand \kaishu   {} {\CJKfamily{zhkai}    }
\NewDocumentCommand \fangsong {} {\CJKfamily{zhfs}     }
\NewDocumentCommand \xingkai  {} {\CJKfamily{zhxingkai}}
\NewDocumentCommand \xihei    {} {\CJKfamily{zhxihei}  }


%-----------------------------------------------------------------------------------------------------------------------
\renewcommand\contentsname{目~~录}
\renewcommand\listfigurename{图~目~录}
\renewcommand\listtablename{表~目~录}


%-----------------------------------------------------------------------------------------------------------------------
% labels for the title page in Chinese
\def\dlut@label@major{学科~、~专业：}
\def\dlut@label@title{论文题目}
\def\dlut@label@author{作~~者~~姓~~名：}
\def\dlut@label@classification{中图分类号：}
\def\dlut@label@confidential{密级}
\def\dlut@label@UDC{UDC\!分类号：}
\def\dlut@label@serialnumber{编号}
\def\dlut@label@thesis{硕~~士~~学~~位~~论~~文}
\def\dlut@label@advisor{指~~导~~教~~师：}
\def\dlut@label@degree{申~~~~请~~~~学~~~~位}
\def\dlut@label@submitdate{论文提交日期}
\def\dlut@label@defenddate{答~~辩~~日~~期：}
\def\dlut@label@studentid{学~~~~~~~~~~~~~~号：}
\def\dlut@label@institute{学~~~~院~~~~名~~~~称}
\def\dlut@label@school{学~位~授~予~单~位}
\def\dlut@label@chairman{答辩委员会主席}


%-----------------------------------------------------------------------------------------------------------------------
% values for the title page in Chinese
\def\dlut@value@classification{}
\def\dlut@value@confidential{}
\def\dlut@value@UDC{}
\def\dlut@value@serialnumber{}
\def\dlut@value@school{大连理工大学}
\def\dlut@value@degree{}
\def\dlut@value@title{~~~~~（论~文~题~目）~~~~~}
\def\dlut@value@vtitle{竖排论文题目}
\def\dlut@value@titlemark{\dlut@value@title}
\def\dlut@value@author{（作~者~姓~名）}
\def\dlut@value@advisor{（姓名、专业技术职务、学位）}
\def\dlut@value@advisorinstitute{（单位）}
\def\dlut@value@major{}
\def\dlut@value@studentid{}
\def\dlut@value@submitdate{}
\def\dlut@value@defenddate{\today}
\def\dlut@value@institute{}
\def\dlut@value@chairman{}
\def\dlut@label@statement{}


%-----------------------------------------------------------------------------------------------------------------------
\RequirePackage{ulem}
\allowdisplaybreaks[4]
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{pifont}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
	{\node[shape = circle, draw, inner sep = 1pt]
		(char) {\phantom{\ifblank{#1}{#2}{#1}}};
		\node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}


%-----------------------------------------------------------------------------------------------------------------------
% originality statement
\def\dlut@label@original{学位论文原创性申明}
\def\dlut@label@authorization{大连理工大学学位论文版权使用授权书}
\def\dlut@label@authorsign{作~~者~~签~~名~~：}
\def\dlut@label@Supervisorsign{导~~师~~签~~名~~：}
\def\dlut@label@originalDate{日期：}
\def\dlut@label@originaltitle{学位论文题目：}
\def\dlut@label@originalchairman{答辩委员会主席：}
\def\dlut@label@originalcontent{\dlutspace\dlutspace 本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经指明引用的内容外，学位论文不含任何其他个人、法人或者非法人组织已经发表或尚未发表的作品，且学位论文中已经指明作者姓名或者名称、作品名称的内容，不影响该作品的正常使用，也不存在不合理地损害相关权利人的合法权益的任何情形。对学位论文研究做出重要贡献的个人和法人或者非法人组织，均已在论文中以明确方式标明，且不存在任何著作权纠纷。\par 若因声明不实，本人愿意为此承当相应的法律责任。}
\def\dlut@label@authorizationcontent{\dlutspace\dlutspace 本人完全了解大连理工大学有关学位论文知识产权的规定，在校攻读学位期间论文工作的知识产权属于大连理工大学，允许论文被查阅和借阅。学校有权保留论文并向国家有关部门或机构送交论文的复印件和电子版，可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印、或扫描等复制手段保存和汇编本学位论文。}


%-----------------------------------------------------------------------------------------------------------------------
% values for the title page in English
\def\dlut@label@englishadvisor{Supervisor:}
\def\dlut@label@englishstatement{Submitted in total fulfilment
	of the requirements for the degree of \dlut@value@englishdegree \\
	in \dlut@value@englishmajor}
\def\dlut@label@englishauthor{Candidate Name:}
\def\dlut@label@englishadvisor{Faculty Mentor:}
\def\dlut@label@englishchairman{Chair, Thesis Committee:}
\def\dlut@label@englishinstitute{School or Department:}
\def\dlut@label@englishdegree{Degree Applied:}
\def\dlut@label@englishmajor{Major:}
\def\dlut@label@englishschool{Degree by:}
\def\dlut@label@englishdate{The Date of Defence:}


%-----------------------------------------------------------------------------------------------------------------------
% values for the title page in English
\def\dlut@value@englishtitle{(English Title of Thesis)}
\def\dlut@value@englishauthor{(Author Name)}
\def\dlut@value@englishadvisor{(Supervisor Name)}
\def\dlut@value@englishinstitute{(Institute Name)}
\def\dlut@value@englishschool{Dalian University of Technology}
\def\dlut@value@englishchair{(someone)}
\def\dlut@value@englishdate{}
\def\dlut@value@englishdegree{}
\def\dlut@value@englishmajor{}


%-----------------------------------------------------------------------------------------------------------------------
% labels in Chinese
\def\dlut@label@abstract{摘要}
\def\dlut@label@keywords{关键词：}
\def\dlut@label@conclusion{结论}
\def\dlut@label@appendix{附录}
\def\dlut@label@publications{攻读硕士学位期间科研项目及科研成果}
\def\dlut@label@projects{攻读学位期间参与的项目}
\def\dlut@label@resume{作者简介}
\def\dlut@label@reference{参考文献!!!!}
\def\dlut@label@thanks{致谢}
\def\dlut@label@englishkeywords{Key Words:~}
\def\dlut@label@headschoolname{大连理工大学硕士学位论文}
\def\dlut@label@headtitle{\dlut@value@title}


%-----------------------------------------------------------------------------------------------------------------------
% page layout
\RequirePackage[%
	paper=a4paper,%
	top=3.5cm,%
	bottom=2.5cm,%
	left=2.7cm,%
	right=2.7cm,%
	headheight=0.50cm,%
	footskip=1.47cm%
]{geometry}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\thispagestyle{empty}%
	\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\RequirePackage{setspace}
\setstretch{1.35}


%-----------------------------------------------------------------------------------------------------------------------
% chapter style
\ctexset{chapter={
			name = {},
			number = {\arabic{chapter}},
			format = { \CTEXifname{\raggedright\heiti\zihao{3}}{\centering\heiti\zihao{-3}}},,
			pagestyle = {dlut@headings},
			beforeskip = 12bp,
			afterskip = 28bp,
			fixskip = true,
		}
}


%-----------------------------------------------------------------------------------------------------------------------
% section style
\ctexset{section={
			format = {\heiti\zihao{4}},
			beforeskip = 12bp ,
			afterskip = 8bp ,
			fixskip = true,
		}
}


%-----------------------------------------------------------------------------------------------------------------------
% subsection style
\ctexset{subsection={
			format = {\raggedright\heiti\zihao{-4}},
			beforeskip = 8bp,
			afterskip = 6bp,
			fixskip = true,
		}
}


%-----------------------------------------------------------------------------------------------------------------------
% subsubsection style
\RequirePackage{titlesec}
\ctexset{subsubsection={
			name = {(,)},
			number = {\arabic{subsubsection}},
			format = {\raggedright\heiti\zihao{-4}},
			beforeskip =8bp,
			afterskip = 6bp,
			fixskip = true,
		}
}


%-----------------------------------------------------------------------------------------------------------------------
% contents style
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{toe}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\songti\zihao{-4}}
{\thecontentslabel\hspace{0.4\ccwd}}{}
{\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]{\songti\zihao{-4}}
{\thecontentslabel\hspace{0.4\ccwd}}{}
{\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti\zihao{-4}}
{\thecontentslabel\hspace{0.5\ccwd}}{}
{\hspace{0em}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
{\figurename\thecontentslabel~~}{\hspace*{-1.5cm}}
{\hspace{0em}\titlerule*{.}\hspace{-0.5em}\contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
{\tablename\thecontentslabel~~}{\hspace*{-1.5cm}}
{\hspace{0em}\titlerule*{.}\hspace{-0.5em}\contentspage}

% table of contents in Chinese
\renewcommand\tableofcontents{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\contentsname}
	\addcontentsline{toc}{chapter}{目录}
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
	\pdfbookmark[0]{目录}{bittoc}
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
}

% table of contents in English
\def\engcontentsname{CONTENTS}
\renewcommand\engcontentsname{\bf\zihao{-3} \hfill TABLE OF CONTENTS \hfill}
\newcommand\tableofengcontents{
	\@restonecolfalse
	\chapter*{\engcontentsname
		\@mkboth{\engcontentsname}{\engcontentsname}}
	\addcontentsline{toc}{chapter}{TABLE OF CONTENTS}
	\@starttoc{toe}%
	\if@restonecol\twocolumn\fi
}


%-----------------------------------------------------------------------------------------------------------------------
% new commands for chapter, section, subsection
\newcommand{\bichapter}[2]
{   \chapter{#1}
	\addcontentsline{toe}{chapter}{\protect\numberline{\csname thechapter\endcsname}#2}
}

\newcommand{\bisection}[2]
{   \section{#1}
	\addcontentsline{toe}{section}{\protect\numberline{\csname thesection\endcsname}#2}
}

\newcommand{\bisubsection}[2]
{   \subsection{#1}
	\addcontentsline{toe}{subsection}{\protect\numberline{\csname thesubsection\endcsname}#2}
}


%-----------------------------------------------------------------------------------------------------------------------
% settings for header and footer
\RequirePackage{fancyhdr}
\fancypagestyle{dlut@empty}{\fancyhf{}}

\fancypagestyle{dlut@headings}{%
	\fancyhf{}
	\fancyfoot[C]{\songti\zihao{5}{$-$~\thepage~$-$}}
	\fancyhead[CO]{\zihao{5}{\songti\dlut@label@headschoolname}}
	\fancyhead[CE]{\zihao{5}{\songti\dlut@label@headtitle}}
}

\let\dlut@cleardoublepage\cleardoublepage
\newcommand{\dlut@clearemptydoublepage}{%
	\clearpage{\pagestyle{dlut@empty}\dlut@cleardoublepage}}
\let\cleardoublepage\dlut@clearemptydoublepage

\renewcommand{\frontmatter}{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{dlut@headings}
}

\renewcommand{\mainmatter}{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{dlut@headings}
}


%-----------------------------------------------------------------------------------------------------------------------
% tables
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}

\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}}

\theoremstyle{definition}
\newtheorem{algo}{算法~}[chapter]
\newtheorem{thm}{定理~}[chapter]
\newtheorem{lem}[thm]{引理~}
\newtheorem{prop}[thm]{命题~}
\newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
\newtheorem{defn}{定义~}[chapter]
\newtheorem{conj}{猜想~}[chapter]
\newtheorem{exmp}{例~}[chapter]
\newtheorem{rem}{注~}
\newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

\RequirePackage{xltxtra}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{makecell}
\RequirePackage{wrapfig}


%-----------------------------------------------------------------------------------------------------------------------
% title settings for tables and figures
\RequirePackage{amsmath}
\RequirePackage[list=off]{bicaption}
\RequirePackage[justification=centering]{caption}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\songti\zihao{5}}
\captionsetup{
	font = {fontsize},
	labelsep = zhspace,
}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table]{
	position = top,
	aboveskip = 6bp,
	belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
	position = bottom,
	aboveskip = 6bp,
	belowskip = 6bp,
}
\captionsetup[table][bi-second]{name=Tab.}

\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}


%-----------------------------------------------------------------------------------------------------------------------
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


%-----------------------------------------------------------------------------------------------------------------------
% number style for equations, figures and tables
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}


%-----------------------------------------------------------------------------------------------------------------------
\RequirePackage{xcolor}
\RequirePackage{float}


%-----------------------------------------------------------------------------------------------------------------------
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}


%-----------------------------------------------------------------------------------------------------------------------
% algorithm
\newcounter{algorithm}[chapter]
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}
\renewcommand\thealgorithm{\thechapter.\arabic{algorithm}}


%-----------------------------------------------------------------------------------------------------------------------
% hyperref
\RequirePackage{hyperref}
\hypersetup{
	bookmarksnumbered,
	linktoc=all,
	colorlinks=true,
	citecolor=black,
	filecolor=cyan,
	linkcolor=black,
	linkbordercolor=black,
	urlcolor=black,
	plainpages=false,
	pdfstartview=FitH
}


%-----------------------------------------------------------------------------------------------------------------------
% enumerate
\RequirePackage{enumitem}
\RequirePackage{supertabular}

\setenumerate[1]{itemsep=0pt, partopsep=0pt, parsep=\parskip, topsep=5pt}


%-----------------------------------------------------------------------------------------------------------------------
% cite the reference style
\RequirePackage[numbers,square,comma,sort&compress,super]{natbib}
\bibliographystyle{gbt7714-2005}


%-----------------------------------------------------------------------------------------------------------------------
% dlut space
\newcommand{\dlutspace}[1][1]{\hspace{#1\ccwd}}

\def\dlut@getfileinfo#1 #2 #3\relax#4\relax{%
	\def\dlutfiledate{#1}%
	\def\dlutfileversion{#2}%
	\def\dlutfileinfo{#3}}%
\expandafter\ifx\csname ver@dutmaster-xetex.cls\endcsname\relax
	\edef\reserved@a{\csname ver@ctextemp_dutmaster-xetex.cls\endcsname}
\else
	\edef\reserved@a{\csname ver@dutmaster-xetex.cls\endcsname}
\fi
\expandafter\dlut@getfileinfo\reserved@a\relax? ? \relax\relax
\def\dlut@underline[#1]#2{%
	\underline{\hbox to #1{\hfill#2\hfill}}}
\def\dlutunderline{\@ifnextchar[\dlut@underline\underline}


%-----------------------------------------------------------------------------------------------------------------------
% commands for title page in Chinese
\newcommand\classification[1]{\def\dlut@value@classification{#1}}
\newcommand\studentid[1]{\def\dlut@value@studentid{#1}}
\newcommand\confidential[1]{\def\dlut@value@confidential{#1}}
\newcommand\UDC[1]{\def\dlut@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\dlut@value@serialnumber{#1}}
\newcommand\school[1]{\def\dlut@value@school{#1}}
\newcommand\degree[1]{\def\dlut@value@degree{#1}}
\renewcommand\title[1]{\def\dlut@value@title{#1}}

\newcommand\vtitle[1]{\def\dlut@value@vtitle{#1}}
\renewcommand\author[1]{\def\dlut@value@author{#1}}
\newcommand\advisor[1]{\def\dlut@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\dlut@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\dlut@value@major{#1}}
\newcommand\submitdate[1]{\def\dlut@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\dlut@value@defenddate{#1}}
\newcommand\institute[1]{\def\dlut@value@institute{#1}}
\newcommand\chairman[1]{\def\dlut@value@chairman{#1}}


%-----------------------------------------------------------------------------------------------------------------------
% title page in Chinese
\renewcommand\maketitle
{
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
		\vskip \stretch{1}
		\def\tabcolsep{1pt}
		\def\arraystretch{1.5}
		\parbox[t][4.40cm][c]{\textwidth}
		{
			\begin{center}
				{\songti\zihao{-1}\textbf{\dlut@label@thesis}\\}
				\vspace{1.34cm}
				{\xihei\zihao{2}\textbf{\dlut@value@title}\\}
				\vspace{0.13cm}
				{\zihao{3}\textbf{\dlut@value@englishtitle}\\}
			\end{center}
		}
		\vspace{50.2mm}\\
		{\songti\zihao{-3}\dlut@label@author}\dlutunderline[170pt]{\songti\zihao{-3}\dlut@value@author}
		\vskip 10pt
			{\songti\zihao{-3}\dlut@label@studentid}\dlutunderline[170pt]{\songti\zihao{-3}\dlut@value@studentid}
		\vskip 10pt
			{\songti\zihao{-3}\dlut@label@advisor}\dlutunderline[170pt]{\songti\zihao{-3}\dlut@value@advisor}
		\vskip 10pt
			{\songti\zihao{-3}\dlut@label@major}\dlutunderline[170pt]{\songti\zihao{-3}\dlut@value@major}
		\vskip 10pt
			{\songti\zihao{-3}\dlut@label@defenddate}\dlutunderline[170pt]{\songti\zihao{-3}\dlut@value@defenddate}
		\\ \vspace{31.4mm}
		{\Large\xingkai\dlut@value@school\\}
		\vspace{2.3mm}
		{\zihao{-4}\dlut@value@englishschool}
	\end{center}
	\vskip \stretch{0.5}
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}


%-----------------------------------------------------------------------------------------------------------------------
% commands for title page in English
\newcommand\englishtitle[1]{\def\dlut@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\dlut@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\dlut@value@englishadvisor{#1}}
\newcommand\englishschool[1]{\def\dlut@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\dlut@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\dlut@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\dlut@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\dlut@value@englishmajor{#1}}
\newcommand\englishchairman[1]{\def\dlut@value@englishchairman{#1}}


%-----------------------------------------------------------------------------------------------------------------------
% originality statement
\newcommand\makeDeclareOriginal{%
	\cleardoublepage
	\pdfbookmark[0]{声明}{statement}
	\thispagestyle{empty}
	\begin{center}
		\parbox[t][1.52cm][c]{\textwidth}
		{\heiti\zihao{-2}\centerline \dlut@label@original}
	\end{center}
	\vskip 10pt
		{\songti\zihao{-4}\dlut@label@originalcontent}
	\vskip 10pt
		{\songti\zihao{-4}\dlut@label@originaltitle}\dlutunderline[303pt]{\dlut@value@title}
	\vskip 3pt
	\indent{\songti\zihao{-4}\dlut@label@authorsign} \dlutunderline[8em]{} \hspace{1.3em} {\songti\zihao{-4}\dlut@label@originalDate}\dlutunderline[4em]{}~年~\dlutunderline[2em]{}~月~\dlutunderline[2em]{}~日~
	\vskip 20mm
	\begin{center}
		{\heiti\zihao{-2} \dlut@label@authorization}
	\end{center}
	\vskip 10pt
		{\songti\zihao{-4} \dlut@label@authorizationcontent}
	\vskip 25pt
		{\songti\zihao{-4}\dlut@label@originaltitle}\dlutunderline[303pt]{\dlut@value@title}
	\vskip 3pt
	\indent{\songti\zihao{-4}\dlut@label@authorsign} \dlutunderline[10.65em]{} {\songti\zihao{-4}\dlut@label@originalDate}\dlutunderline[3em]{}年~\dlutunderline[2em]{}~月~\dlutunderline[2em]{}~日~
	\vskip 3pt
	\indent{\songti\zihao{-4}\dlut@label@Supervisorsign} \dlutunderline[10.65em]{} {\songti\zihao{-4}\dlut@label@originalDate}\dlutunderline[3em]{}~年~\dlutunderline[2em]{}~月~\dlutunderline[2em]{}~日~
	\vskip 3pt
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}


%-----------------------------------------------------------------------------------------------------------------------
% abstract and keywords in Chinese
\newenvironment{abstract}
{
	\cleardoublepage
	\chapter{\dlut@label@abstract}
}
{}

\newcommand\beginatevenpage{
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}

\newcommand\keywords[1]{%
	\vspace{2ex}\indent{\heiti\zihao{-4} \dlut@label@keywords} #1}


%-----------------------------------------------------------------------------------------------------------------------
% abstract and keywords in English
\newenvironment{englishabstract}
{
	\clearpage
	\chapter{ABSTRACT}
}
{}

\newcommand\englishkeywords[1]{%
	\vspace{2ex}\indent{\bf\zihao{-4} \dlut@label@englishkeywords} #1}


%-----------------------------------------------------------------------------------------------------------------------
% references
\renewenvironment{thebibliography}[1]
{\songti\zihao{5}
	\chapter*{参~~考~~文~~献}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
	\addcontentsline{toc}{chapter}{参考文献}
	\addcontentsline{toe}{chapter}{References}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{1mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{0.05pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
	{
		\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}\endlist
	}


%-----------------------------------------------------------------------------------------------------------------------
% publication
\newenvironment{publication}
{ \ifodd\c@page
	\else
		\clearpage
		\phantom{s}
		\thispagestyle{empty}
	\fi
	\chapter*{攻读硕士学位期间科研项目及科研成果}
	\addcontentsline{toc}{chapter}{攻读硕士学位期间科研项目及科研成果}
	\addcontentsline{toe}{chapter}{Achievements}}
{}


%-----------------------------------------------------------------------------------------------------------------------
% conclusion
\newenvironment{conclusion}
{\chapter*{结论}
	\@mkboth{结论}{结论}%
	\addcontentsline{toc}{chapter}{结论}}
{}


%-----------------------------------------------------------------------------------------------------------------------
% acknowledgement
\newenvironment{acknowledgement}
{\ifodd\c@page
	\else
		\clearpage
		\phantom{s}
		\thispagestyle{empty}
	\fi
	\chapter*{致~~~~~~谢}
	\addcontentsline{toc}{chapter}{致谢}
	\addcontentsline{toe}{chapter}{Acknowledgements}}
{}


%-----------------------------------------------------------------------------------------------------------------------
% symbol note
\newenvironment{symbolnote}
{\chapter{\dlut@label@symbolnote}
	\fangsong}
{}


%-----------------------------------------------------------------------------------------------------------------------
% denotation
\newenvironment{denotation}
{\chapter{主要符号表}}
{}


%-----------------------------------------------------------------------------------------------------------------------
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}


\endinput
%%
%% End of file `dlut-thesis.cls'.
