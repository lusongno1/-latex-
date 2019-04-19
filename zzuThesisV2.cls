\ProvidesClass{zzuThesis}[2017/03/18 v1.0, by Lu Song]
\newif\ifPreprint\Preprinttrue
\newif\ifBachelor\Bachelortrue
\newif\ifMakeindex\Makeindexfalse
\newif\ifPreview\Previewfalse
\newif\ifEverb\Everbfalse

\DeclareOption{bachelor}{\Bachelortrue\Preprintfalse}
\DeclareOption{master}{\Bachelorfalse\Preprintfalse}
\DeclareOption{preprint}{\Preprinttrue}
\DeclareOption{makeindex}{\Makeindextrue}
\DeclareOption{preview}{\Previewtrue}
\DeclareOption{everb}{\Everbtrue}
\ProcessOptions

\let\CCTCJKfonts=1
\LoadClass[12pt,oneside]{cctbook}[2004/10/14]
\RequirePackage{ifpdf}
\RequirePackage{graphicx}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}} 
\ifMakeindex
  \RequirePackage{makeidx}
  \AtEndDocument{\printindex}
  \makeindex
\fi

\RequirePackage{amsthm}
\RequirePackage{amsmath}

\ifEverb
  \RequirePackage{everb}[2006/04/22]
  \everbsetup{number=false, escape=12}
  \newverbatim[prologue={\smallskip\fboxradius=3pt}]{verbatim}
\fi

\ifpdf
  \RequirePackage[CJKbookmarks,hyperindex]{hyperref}
\else
  \ifPreview
    \RequirePackage[CJKbookmarks,hypertex,hyperindex]{hyperref}
  \else
    \RequirePackage[CJKbookmarks,dvipdfm,hyperindex]{hyperref}
  \fi
\fi

\endlinechar -1



%------------------------ Page layout ----------------------------------
% \headsep=8mm
% \headheight=6mm
% \topmargin=.5cm
% \oddsidemargin=.75cm
% \evensidemargin=.75cm
% \textwidth=145mm
% \textheight=210mm
% \footskip=8mm
% \doublerulesep=0.5pt
\RequirePackage{geometry}
\geometry{left=2.6cm,right=2.0cm,top=2.4cm,bottom=2.2cm,includeheadfoot}
% \RequirePackage{fancyhdr}
% \rfoot{\thepage}
% \pagestyle{myempty}
% \pagestyle{fancy}
\linespread{1}


%-------------------------- Cover page ----------------------------
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{myheadings}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue}
  
\let\@title\strut \let\@headtitle\strut
\renewcommand\title[2][]{\def\@title{#2}\def\@headtitle{#1}
  \ifx\@headtitle\@empty\def\@headtitle{\@title}\fi}

 \let\@author\strut		\def\author#1{\def\@author{#1}}
\let\@supervisor\@empty		\def\supervisor#1{\def\@supervisor{#1}}

\let\@professionaltitle\@empty		\def\professionaltitle#1{\def\@professionaltitle{#1}}

 \let\@author\strut		\def\author#1{\def\@author{#1}}
  \let\@studentnumber\strut		\def\studentnumber#1{\def\@studentnumber{#1}}
  \let\@major\strut		\def\major#1{\def\@major{#1}}
  \let\@department\strut		\def\department#1{\def\@department{#1}}
\let\@submissiondate\@empty	\def\submissiondate#1{\def\@submissiondate{#1}}
\let\@date\@empty	\def\date#1{\def\@date{#1}}

\def\maketitle{
   \frontmatter
  \bgroup
  \def\entry##1##2##3{%
    \multicolumn{##1}{l}{\underline{\hbox to ##2{\hfil##3\hfil}}}}
  \renewcommand\arraystretch{1.5}
  \renewcommand\tabcolsep{\z@}
  \thispagestyle{myempty}
  \pagenumbering{roman}
  \vspace*{1.8cm}
  \begin{center}
    {\zihao{1}\textbf{郑州大学毕业设计（论文）}}\\[2cm]
  \end{center}
     \vspace*{2.0cm}
   \large\heiti\zihao{3}

  \begin{center}
  \begin{tabular}{llll}%\entry{3}{11.6cm}{\@title}
 % \hline
    题\hspace{\fill}目：	&\multicolumn{3}{l}{\underline{\hbox to 11.6cm{\hfil{\tabincell{r}{\@title}}\hfil}}}\\[1cm]
	%\hline
    指导教师：&\entry{1}{5.0cm}{\@supervisor} &职称：&\entry{1}{5.0cm}{\@professionaltitle}\\
	%\hline
  \end{tabular}
  \end{center}
    \vspace*{2.0cm}
	\newcommand{\xiaosan}{\fontsize{15pt}{22pt}\selectfont}   
     \xiaosan\songti
   \def\mlines##1{\vbox to\z@{\hsize 3cm\vss\baselineskip 1em\centering ##1}}
  \begin{center}
  \begin{tabular}{llll}
    学生姓名：&\entry{1}{5.0cm}{\@author}&学号：&\entry{1}{5.0cm}{\@studentnumber}\\
    {专\hspace{\fill}业：}  &\entry{3}{11.6cm}{\@major}\\
    院\hspace{\fill}(系)：&\entry{3}{11.6cm}{\@department}\\
    完成时间：&\entry{3}{11.6cm}{\mlines{\@submissiondate}} \\  
  \end{tabular}
  \end{center}
   \par\vskip2.4cm
  \begin{center}
  {\@date}
  \end{center}
   \egroup
}



%----------------------- Running heads ---------------------------------
\def\ps@myempty{%%No head or foot line.
  \let\@oddhead\@empty\let\@evenhead\@empty%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@myplain{%%No head, centred or right page number in foot.
  \let\@oddhead\@empty\let\@evenhead\@empty%
  \def\@oddfoot{\hfil\zihao{5}\thepage\ifBachelor\relax\else\hfil\fi}%
  \let\@evenfoot=\@oddfoot}
\def\ps@myheadings{%%Centred head, centred page number in foot.
  \def\@oddhead{\vbox to\headheight{%
    \hb@xt@\textwidth{\zihao{5}\rmfamily\hfill\leftmark\hfill}%
      \vskip\tw@\p@\hbox{\vrule width\textwidth height.4\p@ depth\z@}}}
  \let\@evenhead=\@oddhead
  \def\@oddfoot{\zihao{5}\hfil\thepage\ifBachelor\relax\else\hfil\fi}
  \let\@evenfoot=\@oddfoot}



%------------------------ Abstract & Keywords -------------------------
 \newenvironment{abstract}[1][]
  {\cleardoublepage\setcounter{page}{1}\pagestyle{myplain}
   \chapter{摘^^a1^^a1要}
   \def\English##1##2##3{{\clearpage
     \renewcommand\baselinestretch{1}
     \@openrightfalse\chapter*{##1}
     \begin{center}
       ##2\\
       Directed by ##3
     \end{center}\bigskip\par}}} 
{\cleardoublepage
      \tableofcontents
	   \mainmatter
   \cleardoublepage
   \aftergroup\backmatter}
   
   
   
%------------------------ Chapters/sections -------------------------
 \setcounter{secnumdepth}{3}
 \setcounter{tocdepth}{2}
 \renewcommand\partname{第{part}部分}
 \renewcommand\chaptername{\arabic{chapter}}
\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\  ~~#1}{}}
\renewcommand\chapter{%一级标题
  \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
  \global\@topnum\z@%prevent floats from appearing at the top of this page
  \@afterindenttrue%
  \secdef\@chapter\@schapter}%\secdef<unstarcommand><starcommand>
  
 \def\chapterformat{\Large\bfseries\centering}
\def\sectionformat{\large\bfseries}
\def\subsectionformat{\bfseries}
\def\subsubsectionformat{\normalfont\rm}



%----------------------- Theorems -----------------------------------
\newtheorem{theorem}{{定理}}[chapter]
\newtheorem{proposition}[theorem]{{命题}}
\newtheorem{lemma}[theorem]{{引理}}
\newtheorem{corollary}[theorem]{{推论}}
\newtheorem{definition}{{定义}}[section]
\newtheorem{example}{{例}}[section]
\renewcommand\proofname{证明}


%----------------------- Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{发表文章目录}\begin{thebibliography}{#1}}
  {\end{thebibliography}}
  

%----------------------- Acknowledgement ----------------------------
\newcommand\acknowledgement{\backmatter\chapter{致^^a1^^a1谢}}



%----------------------- Appendices ---------------------------------
 \renewcommand\appendixname{附录\,\Alph{chapter}}

 
 
%----------------------- Caption ------------------------------------
\setlength\abovecaptionskip{7\p@}
\setlength\belowcaptionskip{7\p@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \small
  \sbox\@tempboxa{#1~~#2}%
  \ifdim \wd\@tempboxa >\hsize
    #1~~#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
  
\renewcommand\labelenumi{(\theenumi)}
\renewcommand\labelenumii{(\theenumii)}
\renewcommand\labelenumiii{(\theenumiii)}

\def \@floatboxreset {%
  \reset@font
  \small
  \renewcommand\arraystretch{1.2}
  \@setminipage
}

\renewcommand\@openbib@code{
  \small\zihao{-5}}
\raggedbottom
\endlinechar `\^^M

\endinput
