\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[2024/03/31]
\LoadClass{article}

\def\title#1{\gdef\@title{#1}}
\def\@title{\@latex@error{No \noexpand\title given}\@ehc}
\def\author#1{\gdef\@author{#1}}
\def\@author{\@latex@error{No \noexpand\author given}\@ehc}
\def\unit#1{\gdef\@unit{#1}}
\def\@unit{\@latex@error{No \noexpand\unit given}\@ehc}
\def\id#1{\gdef\@id{#1}}
\def\@id{\@latex@error{No Student ID (\noexpand\id) given}\@ehc}
\def\course#1{\gdef\@course{#1}}
\def\@course{\@latex@error{No (\noexpand\course) given}\@ehc}

\renewcommand\maketitle{
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
    \null\vfil
    \vskip 60\p@
    \begin{center}%
      {\Huge \@title \par}%
      \vskip 3em%
      {\Large\bfseries\@unit\par}
      \vskip 2em
      {\large {\bfseries Date}\\\@date}
      \vskip 6em
      {\large
        \lineskip .75em%
        {\bfseries\@author} \\
        \vspace{1em}
        Student ID \@id \\
        \vspace{1em}
        \@course
      \par}%
      \vfill%
    \end{center}\par
    \@thanks
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@id\@empty
  \global\let\@course\@empty
  \global\let\@supervisor\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% Load fancyhdr package and configure page style
\RequirePackage{fancyhdr}
\def\title#1{\gdef\@title{#1}\gdef\fancytitle{#1}}
\def\author#1{\gdef\@author{#1}\gdef\fancyauthor{#1}}
\let\fancytitle\@empty
\let\fancyauthor\@empty

\newcommand{\setupthefancyhdr}{
  \fancyhf{}
  \fancyhead[L]{\fancytitle}
  \fancyhead[R]{\fancyauthor}
  \renewcommand{\headrulewidth}{0.4pt}
  \fancyfoot[R]{\thepage}
  \setlength{\headheight}{15pt}
}

\AtBeginDocument{
  \pagestyle{fancy}
  \setupthefancyhdr
}

% ===================================================================
% Colour Settings (edit here to rebrand)
% ===================================================================
\RequirePackage{xcolor}

% Section colours (purple spectrum)
\definecolor{sectioncolor}{RGB}{92, 45, 145}        % Dark purple
\definecolor{subsectioncolor}{RGB}{135, 95, 215}    % Medium purple
\definecolor{subsubsectioncolor}{RGB}{175, 135, 225}% Light purple
\definecolor{textbfcolor}{RGB}{145, 0, 110}         % Magenta
\definecolor{ttgrey}{RGB}{64, 64, 64}               % Dark grey

% Box backgrounds and frames
\definecolor{theorembg}{RGB}{245,240,255}     % Soft purple
\definecolor{theoremframe}{RGB}{180,120,220}

\definecolor{lemmabg}{RGB}{240,250,255}       % Soft blue
\definecolor{lemmaframe}{RGB}{120,160,200}

\definecolor{corollarybg}{RGB}{255,245,250}   % Soft pink
\definecolor{corollaryframe}{RGB}{220,160,190}

\definecolor{propositionbg}{RGB}{250,255,245} % Soft green
\definecolor{propositionframe}{RGB}{160,200,160}

\definecolor{definitionbg}{RGB}{250,245,250}  % Neutral lilac
\definecolor{definitionframe}{RGB}{170,120,170}

\definecolor{examplebg}{RGB}{250,250,245}     % Soft beige
\definecolor{exampleframe}{RGB}{200,180,120}

\definecolor{proofbg}{RGB}{255,250,245}       % Very light peach
\definecolor{proofframe}{RGB}{200,160,120}

\definecolor{remarkbg}{RGB}{245,245,245}      % Neutral grey
\definecolor{remarkframe}{RGB}{180,180,180}

% ===================================================================
% Section Title Formatting
% ===================================================================
\RequirePackage{titlesec}

\titlespacing*{\section}{0pt}{*0.5}{*0.5}
\titlespacing*{\subsection}{0pt}{*0.1}{*0.1}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}

\titleformat{\section}{\color{sectioncolor}\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\color{subsectioncolor}\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\color{subsubsectioncolor}\normalsize\bfseries}{\thesubsubsection}{1em}{}

% ===================================================================
% Text Formatting
% ===================================================================
\let\oldtextbf\textbf
\renewcommand{\textbf}[1]{{\color{textbfcolor}\oldtextbf{#1}}}

\let\oldtexttt\texttt
\renewcommand{\texttt}[1]{{\color{ttgrey}\oldtexttt{#1}}}

% ===================================================================
% Page Geometry and Fonts
% ===================================================================
\RequirePackage{setspace}
\RequirePackage{geometry}

\geometry{
    a4paper,
    left=2cm,
    right=2cm,
    top=2.8cm,
}

\RequirePackage[T1]{fontenc}
\RequirePackage{newpxtext,newtxmath}

% ===================================================================
% Theorem-like Environments with tcolorbox
% ===================================================================
\RequirePackage[most]{tcolorbox}

% Generic style macro to reduce repetition
\newcommand{\theobox}[5]{%
\newtcbtheorem[number within=section]{#1}{#2}{
    coltitle=black,
    colback=#3,
    colframe=#4,
    fonttitle=\bfseries\sffamily,
    toptitle=1mm,
    bottomtitle=1mm,
    titlerule=0mm,
    arc=2mm,
    boxrule=0.5pt,
    enhanced,
    breakable,
    before upper=\parindent15pt,
    after upper=\strut
}{#5}
}

% Define environments
\theobox{Theorem}{Theorem}{theorembg}{theoremframe}{thm}
\theobox{Lemma}{Lemma}{lemmabg}{lemmaframe}{lem}
\theobox{Corollary}{Corollary}{corollarybg}{corollaryframe}{cor}
\theobox{Proposition}{Proposition}{propositionbg}{propositionframe}{prop}
\theobox{Definition}{Definition}{definitionbg}{definitionframe}{def}
\theobox{Example}{Example}{examplebg}{exampleframe}{ex}
\theobox{Proof}{Proof}{proofbg}{proofframe}{prf}
\theobox{Remark}{Remark}{remarkbg}{remarkframe}{rem}
