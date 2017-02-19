% ------------------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "nwo.cls",
%     version         = "1.0",
%     date            = "1 April 2016",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, nwo",
%     supported       = "send email to tom@geus.me",
%     docstring       = "NWO grant proposal template."
% ------------------------------------------------------------------------------

% ==============================================================================
% Basic settings
% ==============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwo}[2016/04/01 v1.0 NWO grant proposal]

% load default article class
\LoadClass[a4paper,fleqn,twoside]{article}
\def\@@ptsize{9pt}

% ==============================================================================
% Options
% ==============================================================================

% Review: [narrow,doublespaced]
% -----------------------------

\newif\if@narrow
\let\if@narrow\iffalse
\DeclareOption{narrow}{\let\if@narrow\iftrue}

\newif\if@doublespacing
\let\if@doublespacing\iffalse
\DeclareOption{doublespacing}{\let\if@doublespacing\iftrue}

% Font: [times,garamond]
% ----------------------

\newif\if@font
\let\if@font\iffalse

\newif\if@times
\let\if@times\iffalse
\DeclareOption{times}{\let\if@times\iftrue\let\if@font\iftrue}

\newif\if@garamond
\let\if@garamond\iffalse
\DeclareOption{garamond}{\let\if@garamond\iftrue\let\if@font\iftrue}

\newif\if@verdana
\let\if@verdana\iffalse
\DeclareOption{verdana}{\let\if@verdana\iftrue\let\if@font\iftrue}

% Process options
% ---------------

\ProcessOptions\relax

% ==============================================================================
% Packages
% ==============================================================================

\RequirePackage[left=25mm,right=25mm,top=20mm,bottom=20mm]{geometry}
\if@narrow
  \newgeometry{left=40mm,right=40mm,top=30mm,bottom=30mm}
\fi

\headheight = 21mm
\textheight = 674pt

\RequirePackage{graphicx}
\RequirePackage{amssymb,amsfonts,bm,cancel}
\RequirePackage{enumerate}
\RequirePackage[fleqn]{amsmath}
\RequirePackage[square,sort&compress,numbers,comma]{natbib}
\RequirePackage[font={small},labelfont=bf,labelsep=period]{caption}
\RequirePackage[bf,explicit]{titlesec}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{lastpage}
\RequirePackage{tabulary}
\RequirePackage[official]{eurosym}
\RequirePackage{hyperref}


% ==============================================================================
% Font
% ==============================================================================

\if@font
  \RequirePackage{mathspec}
  \RequirePackage{fontspec}
\fi

\if@garamond
  \AtBeginDocument{%
    \setmathfont(Digits)[Numbers=OldStyle]{Garamond}%
    \setromanfont[%
      BoldFont={Garamond Bold},%
      ItalicFont={Garamond Italic},%
      Mapping=tex-text%
    ]{Garamond}%
  }%
\fi

\if@verdana
  \AtBeginDocument{%
    \defaultfontfeatures{Mapping=tex-text}
    \setmainfont[Mapping=tex-text]{Verdana}
    \setsansfont{Verdana}
    \renewcommand*{\familydefault}{\sfdefault}
    \setmathfont(Greek,Digits,Latin){Verdana}
    \setmathrm{Verdana}
  }%
\fi

\if@times
  \AtBeginDocument{%
    \setmathfont(Digits)[Numbers=OldStyle]{Times New Roman}%
    \setromanfont[%
      BoldFont={Times New Roman Bold},%
      ItalicFont={Times New Roman Italic},%
      Mapping=tex-text%
    ]{Times New Roman}%
  }%
\fi

% ==============================================================================
% Spacing
% ==============================================================================

\if@doublespacing
  \AtBeginDocument{%
    \usepackage{setspace}
    \doublespacing
  }%
\fi

% ==============================================================================
% Hyperref
% ==============================================================================

\AtBeginDocument{%
  \hypersetup{%
    pdftitle=\@title,
    citecolor=Blue,
    filecolor=black,
    linkcolor=Blue,
    urlcolor=Blue,
    breaklinks,
    hidelinks,
    bookmarksopen=true,
  }%
}

% ==============================================================================
% Bibliography settings
% ==============================================================================

% define DOI command
\newcommand*{\doi}[1]{\sloppy\href{http://dx.doi.org/#1}{doi:~#1}}
\newcommand*{\eprint}[1]{\sloppy\href{http://arxiv.org/abs/#1}{arXiv:~#1}}

% set bibliography style
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{%
  \bibliographystyle{unsrtnat}
  \setlength{\bibsep}{3pt plus 0.3ex}
  \def\bibfont{\scriptsize}
  \oldbibliography{#1}
}

\renewcommand\bibsection{\subsection{Literature references}}

% ==============================================================================
% Headers
% ==============================================================================

% {command}{format}{label}{sep}{before-code}{after-code}
% - section
\definecolor{gray}{RGB}{80,80,80}


\titleformat{\section}
  {\normalfont\normalsize\bfseries}
  {}
  {0em}
  {\colorbox{gray}{\parbox{\dimexpr\textwidth-2\fboxsep\relax}{\textcolor{white}{\thesection.\quad#1}}}\vspace*{-.8em}}

% - subsection
\titleformat{\subsection}
  {\normalfont\normalsize\bfseries}
  {}
  {0em}
  {\thesection\alph{subsection}.\quad#1}

% - subsection
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries}
  {}
  {0em}
  {\Roman{subsubsection}.\quad #1}

\titleformat{\paragraph}
  {\normalfont\normalsize\bfseries}
  {}
  {}
  {#1}

% spacing {left}{top}{bottom}, of:
% - section
\titlespacing{\section}
  {0pt}{1eM}{0.8em}
% - subsection
\titlespacing{\subsection}
  {0pt}{0.0em}{0.0em}
\titlespacing{\subsubsection}
  {0pt}{0.0em}{0.0em}

% no paragraph indent after header
\AtBeginDocument{%
  \makeatletter
  \let\orig@afterheading\@afterheading
  \def\@afterheading{%
     \@afterindentfalse
    \orig@afterheading}
  \makeatother
}

\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}

% ==============================================================================
% Title
% ==============================================================================


% ==============================================================================
% Header and footer
% ==============================================================================

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhead[R]{\includegraphics[height=16mm]{nwo}\vspace*{4mm}}
\fancyfoot[R]{\scriptsize Page~\thepage ~of~\pageref{LastPage}}
\newcommand{\topic}[1]{\fancyhead[L]{\Large\bfseries{#1}}}


