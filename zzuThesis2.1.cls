\ProvidesClass{zzuThesis}[2017/05/04 v2.0, by Lu Song]
%版本2.0
%修复了题目不能自动换行的问题
%添加了中文注释
%去掉一些重复的命令
%修复了一些警告和一些小bug
%去掉节前的S编号，修改页眉
\newif\ifPreprint\Preprinttrue
\newif\ifBachelor\Bachelortrue
\newif\ifMakeindex\Makeindexfalse
\newif\ifPreview\Previewfalse
\newif\ifEverb\Everbfalse%定义条件变量，并将其的默认值设为false或true

\DeclareOption{bachelor}{\Bachelortrue\Preprintfalse}
\DeclareOption{master}{\Bachelorfalse\Preprintfalse}
\DeclareOption{preprint}{\Preprinttrue}
\DeclareOption{makeindex}{\Makeindextrue}
\DeclareOption{preview}{\Previewtrue}
\DeclareOption{everb}{\Everbtrue}
\ProcessOptions%传入预选项的处理

\let\CCTCJKfonts=1 %选择使用CJK字库
\LoadClass[12pt,oneside]{cctbook}[2004/10/14]
\RequirePackage{ifpdf}%可切换latex和pdflatex命令编译
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{algorithmicx,algorithm}
\RequirePackage{subfigure}

\ifMakeindex
  \RequirePackage{makeidx}
  \AtEndDocument{\printindex}
  \makeindex
\fi%末尾添加索引

\RequirePackage{amsthm}
\RequirePackage{amsmath}%数学宏包

\ifEverb
  \RequirePackage{everb}[2006/04/22]
  \everbsetup{number=false, escape=12}%不要行号，逃逸字符设置为十二
  \newverbatim[prologue={\smallskip\fboxradius=3pt}]{verbatim}%定义新抄录环境
\fi

\ifpdf
  \RequirePackage[CJKbookmarks,hyperindex]{hyperref}%加入超链接包
\else
  \ifPreview
    \RequirePackage[CJKbookmarks,hypertex,hyperindex]{hyperref}
  \else
    \RequirePackage[CJKbookmarks,dvipdfm,hyperindex]{hyperref}
  \fi
\fi

%------------------------ Page layout ----------------------------------
\RequirePackage{geometry}
\geometry{left=2.6cm,right=2.0cm,top=2.4cm,bottom=2.2cm,includeheadfoot} %定义边距
\linespread{1}%设置单倍行距
\setlength{\parskip}{0.2\baselineskip}%设置段落间距

%-------------------------- Cover page ----------------------------
\renewcommand\frontmatter{%前页格式
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{myheadings}}%重定义frontmatter，cleardoublepage清除偶数页内容
  %\clearpage除了另起一页，还可以清除浮动的表格和插图，openright是文档类选项
\renewcommand\mainmatter{%主体格式
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}} 
\renewcommand\backmatter{%后页格式
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue} 
\let\@title\strut \let\@headtitle\strut
\renewcommand\title[2][]{\def\@title{#2}\def\@headtitle{#1}
  \ifx\@headtitle\@empty\def\@headtitle{\@title}\fi}
 \let\@author\strut		\def\author#1{\def\@author{#1}}
\let\@supervisor\@empty		\def\supervisor#1{\def\@supervisor{#1}}
\let\@professionaltitle\@empty		\def\professionaltitle#1{\def\@professionaltitle{#1}}
  \let\@studentnumber\strut		\def\studentnumber#1{\def\@studentnumber{#1}}
  \let\@major\strut		\def\major#1{\def\@major{#1}}
  \let\@department\strut		\def\department#1{\def\@department{#1}}
\let\@submissiondate\@empty	\def\submissiondate#1{\def\@submissiondate{#1}}
\let\@date\@empty	\def\date#1{\def\@date{#1}}
\def\maketitle{
   \frontmatter
  \bgroup%\bgroup is a synonym for {
  \def\entry##1##2##3{
    \multicolumn{##1}{l}{\underline{\hbox to ##2{\hfil##3\hfil}}}}
	\def\mlines##1{\vbox to\z@{\hsize 12cm \vss \baselineskip 1.5em \raggedright ##1}}
  \renewcommand\arraystretch{2}%可以让表格行显得更宽敞一点
 % \renewcommand\tabcolsep{\z@}%表示两列间标准间隔的一半大小
  \thispagestyle{myempty}%本页格式置空
  \vspace*{1.4cm}%use \vspace, latex can silently ignore the extra space.
  \begin{center}
    {\songti\zihao{1}\textbf{郑州大学毕业设计（论文）}}\\[1.8cm]
  \end{center}
  \vspace*{2.0cm}
  \heiti\zihao{3}
  \begin{center}
  \begin{tabular}{llll}
  %  题\hspace{\fill}目：&\entry{3}{9.6cm}{\@title}\\[0.5cm]
	题\hspace{\fill}目：&\entry{3}{9.6cm}{\mlines{\@title}} \\ [0.5cm]
    指导教师：&\entry{1}{3.6cm}{\@supervisor} &职称：&\entry{1}{3.6cm}{\@professionaltitle}\\
  \end{tabular}
  \end{center}
   \vspace*{4cm}
   \songti%\zihaoAny{15}
   \fontsize{16pt}{\baselineskip}\selectfont
  \begin{center}
  \begin{tabular}{llll}
    学生姓名：&\entry{1}{3.6cm}{\@author}&学号：&\entry{1}{3.6cm}{\@studentnumber}\\
    专\hspace{\fill}业：  &\entry{3}{9.6cm}{\@major}\\
    院\hspace{\fill}(系)：&\entry{3}{9.6cm}{\@department}\\
	完成时间：&\entry{3}{9.6cm}{\@submissiondate}\\ 
  \end{tabular}
  \end{center}
   \par\vskip4.0cm
  \begin{center}
  {\@date}
  \end{center}
   \egroup
}



%----------------------- Running heads ---------------------------------
\def\ps@myempty{%%No head or foot line.
  \let\@oddhead\@empty\let\@evenhead\@empty
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@myplain{%%No head, centred or right page number in foot.
  \let\@oddhead\@empty\let\@evenhead\@empty
  \def\@oddfoot{\hfil\zihao{5}\thepage\ifBachelor\relax\else\hfil\fi}
  \let\@evenfoot=\@oddfoot}
  
\def\ps@myheadings{%%Centred head, centred page number in foot.
  \def\@oddhead{
  \vbox to\headheight{
    \hb@xt@\textwidth{\hfill\zihao{5}\rmfamily\leftmark\hfill}
      \vskip\tw@\p@\hbox{\vrule width\textwidth height.4\p@ depth\z@}} 
	  }	  
  \let\@evenhead=\@oddhead
  \def\@oddfoot{\zihao{5}\hfil\thepage\ifBachelor\relax\else\hfil\fi}
  \let\@evenfoot=\@oddfoot}
%定义页眉页脚


%------------------------ Abstract & Keywords -------------------------
 \newenvironment{abstract}[1][]
  {\cleardoublepage\setcounter{page}{1}\pagestyle{myplain}%章节右开
   \chapter{摘^^a1^^a1要}%进制编码a1
   \def\English##1{{\clearpage
     \renewcommand\baselinestretch{1}
     \@openrightfalse\chapter*{##1}
     % \begin{center}
       % ##2\\
       % ##3
     % \end{center}
	 \bigskip\par}}} 
{\clearpage
      \tableofcontents
	   \mainmatter
   \aftergroup\backmatter}
   %主题后要迅速进入backmatter模式，否则序号会错乱
   
   
   
%------------------------ Chapters/sections -------------------------
 \setcounter{secnumdepth}{3}%设置自动编号的深度
 \setcounter{tocdepth}{1}%设置目录的显示级别
 \renewcommand\chaptername{\arabic{chapter}}%重设置章编号
 \renewcommand\sectionname{\thechapter.\arabic{section}}
\renewcommand{\chaptermark}[1]{\@mkboth{\thechapter ~~#1}{}}
%重新定义页眉内之章标题
% \renewcommand\chapter{
% \par
% \vspace{3cm}
 % \phantomsection
 % \global\@topnum\z@
 % \@afterindentfalse
  % \secdef\@chapter\@schapter}%每一章不另起一页的写法
\renewcommand\chapter
{\if@openright\cleardoublepage\else\clearpage\fi
\phantomsection%\phantomsection解决hyperref超链接定位不准
\global\@topnum\z@
\@afterindenttrue
\secdef\@chapter\@schapter
}
% \def\chapterformat{\centering \heiti \zihao{3}}
\def\chapterformat{\bfseries \centering \fontsize{16pt}{\baselineskip}\selectfont}
%此调整因zihao命令似乎对西文无效
\def\sectionformat{\bfseries \zihao{4}}
\def\subsectionformat{\noindent~~\zihao{-4}\rmfamily}
\def\subsubsectionformat{\noindent~~\normalfont \zihao{-4} \rmfamily}



%----------------------- Theorems -----------------------------------
\newtheorem{theorem}{{定理}}[chapter]%重命名定理为中文，采用章编号
\newtheorem{proposition}[theorem]{{命题}}
\newtheorem{property}{{性质}}
\newtheorem{lemma}[theorem]{{引理}}%同theorem，采用章编号
\newtheorem{corollary}[theorem]{{推论}}
\newtheorem{definition}{{定义}}[section]%定义采用节编号
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

\long\def\@makecaption#1#2{
  \vskip\abovecaptionskip
  \small
  \sbox\@tempboxa{#1~~#2}
  \ifdim \wd\@tempboxa >\hsize
    #1~~#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}
  \fi
  \vskip\belowcaptionskip}
  
\renewcommand\labelenumi{(\theenumi)}
\renewcommand\labelenumii{(\theenumii)}
\renewcommand\labelenumiii{(\theenumiii)}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}%定义引用方式为右上角
\def \@floatboxreset {
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
