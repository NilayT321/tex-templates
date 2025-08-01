\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}

\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{thmtools}
\RequirePackage{mathtools}
\RequirePackage{tcolorbox}


\tcbuselibrary{skins, breakable}

\newcommand{\class}[1]{\renewcommand\@class{#1}}
\newcommand{\@class}{}

% Declare assignment number 
\newcommand{\assignmentNo}[1]{\renewcommand\@assignmentNo{#1}}
\newcommand{\@assignmentNo}{}

% Assignment due date
\newcommand{\dueDate}[1]{\renewcommand\@dueDate{#1}}
\newcommand{\@dueDate}{}

% Generate assignment header 
\newcommand{\assignHeader}{
		\begin{center}
				{\Large \@class} \par\vspace{0.3em} {\Large \@assignmentNo} \par \vspace{0.5em} \par \@dueDate 
		\end{center}
}

% Student name
\newcommand{\studentName}[1]{\renewcommand\@studentName{#1}}
\newcommand{\@studentName}{}

% Instructor name
\newcommand{\instructorName}[1]{\renewcommand\@instructorName{#1}}
\newcommand{\@instructorName}{}

% Section number 
\newcommand{\sectionNo}[1]{\renewcommand\@sectionNo{#1}}
\newcommand{\@sectionNo}{}

% Generate assignment info box 
\newcommand{\infoBox}{
    \begin{center}
        \begin{tabular}{rl}
            \textbf{Student Name:} & \@studentName \\ 
            \textbf{Instructor Name:} & \@instructorName \\ 
            \textbf{Section:} & \@sectionNo
        \end{tabular}
    \end{center}
}

% The problem is notated using amsthm 
\theoremstyle{definition}
\newtheorem{problem}{Problem}

% Solution end character
% What character is used to end the solutions?
\newcommand{\solnend}{\ensuremath{\blacktriangleleft}}

% A box for the solutions
\newenvironment{soln}[1][Solution]{
    \begin{tcolorbox}[breakable, blanker, before skip = 2pt,
        borderline = {0.5pt}{0pt}{black}, boxsep = 0.5em,
				before upper = {\parindent 15pt}
    ]

    \noindent \textbf{\textsf{#1:}}
    \par \vspace{0.3em}
    \noindent 
}{
		\hfill $\solnend$
    \end{tcolorbox}
    \bigbreak \noindent
}

\DeclareOption{twocolumn}{\OptionNotUsed}


% The noboxsols environment will create the solutions environment without boxes
\DeclareOption{noboxsols}{
		\renewenvironment{soln}[1][Solution]{
				\noindent \textbf{\textsf{#1:}} 
				\par \vspace{0.3em}
				\noindent
		}{
				\hfill $\solnend$
		}
}

% The mathshortcuts option defines several useful mathematical shortcuts 
% But sometimes, people have their own shortcuts they'd like to use 
% So they can control whether these get loaded
\DeclareOption{mathshortcuts}{

		% ========================== COMMON MATHEMATICAL SHORTCUTS ========================== 
		% This part of the class defines several mathematical shortcuts 
		% =================================================================================== 
		% Blackboard fonts
		\newcommand{\Z}{\ensuremath{\mathbb{Z}}}
		\newcommand{\Q}{\ensuremath{\mathbb{Q}}}
		\newcommand{\N}{\ensuremath{\mathbb{N}}}
		\newcommand{\R}{\ensuremath{\mathbb{R}}}
		\newcommand{\C}{\ensuremath{\mathbb{C}}}
		\newcommand{\F}{\ensuremath{\mathbb{F}}}
		\newcommand{\bbP}{\ensuremath{\mathbb{P}}}

		% Script fonts
		\newcommand{\calT}{\mathcal{T}}
		\newcommand{\calP}{\mathcal{P}}


		% ======================= FOR LINEAR ALGEBRA =======================
		\DeclareMathOperator{\Span}{span}
		\DeclareMathOperator{\Dim}{dim}
		\DeclareMathOperator{\Null}{Null}
		\DeclareMathOperator{\Range}{Range}
		\DeclareMathOperator{\rank}{rank}
		\DeclareMathOperator{\nullity}{nullity}
		\DeclareMathOperator{\trace}{tr}
		\DeclareMathOperator{\im}{Im}
		\newcommand{\prtl}{\partial}
		\newcommand{\betap}{{\beta'}}
		\newcommand{\identitymapV}{\mathbf{1}_V}
		\newcommand{\starsup}{\ensuremath{^{\star}}}
		\newcommand{\starstar}{\ensuremath{^{\star\star}}}
		\newcommand{\TT}{^\top}
		\newcommand{\vecte}{\mathbf{e}}
		\newcommand{\vectx}{\mathbf{x}}
		\newcommand{\vecty}{\mathbf{y}}
		\newcommand{\vectu}{\mathbf{u}}
		\newcommand{\vecth}{\mathbf{h}}
		% ======================= ======================= ===================

		% ======================= FOR TOPOLOGY =======================
		\DeclareMathOperator{\Bd}{Bd}
		\newcommand{\obar}{\overline}
		\DeclareMathOperator{\Hom}{Hom}
		\DeclareMathOperator{\Ext}{Ext}
		% ============================================================

		% ======================= FOR PROBABILITY/STATISTICS =======================
		\newcommand{\Prob}[1]{\mathbb{P} \left( #1 \right)}
		\newcommand{\E}[1]{\mathbb{E} \left[ #1 \right]}
		\newcommand{\V}[1]{\mathbb{V} \left[ #1 \right]}
		% ==========================================================================
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{geometry}

% Update the \maketitle command to use the data we provide 
\renewcommand{\maketitle}{
		\assignHeader
		\infoBox
}

% Change equation numbering to number equations by problem
\numberwithin{equation}{problem}
