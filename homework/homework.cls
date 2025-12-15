\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}
\LoadClass{article}

\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{thmtools}
\RequirePackage{mathtools}
\RequirePackage{tcolorbox}
\RequirePackage{tikz}
\RequirePackage{pgfplots} 
\RequirePackage{esint}
\RequirePackage{breqn}
\RequirePackage{bbm}
\RequirePackage{geometry}
\RequirePackage[hidelinks]{hyperref} 
\RequirePackage[capitalize, noabbrev]{cleveref}
\RequirePackage{import}
\RequirePackage{pdfpages}
\RequirePackage{transparent}
\RequirePackage{xcolor}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{xparse}

\pgfplotsset{compat = 1.18}
\usetikzlibrary{cd}
\usetikzlibrary{calc}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{spath3}

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
\newtheorem{lem}{Lemma}[problem]

% Change equation numbering to number equations by problem
\numberwithin{equation}{problem}

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

\setlist{itemsep = 0.1em}

% Update the \maketitle command to use the data we provide 
\renewcommand{\maketitle}{
		\assignHeader
		\infoBox
}

% include svg figures from inkscape-figures
\newcommand{\incfig}[2][1]{%
    \def\svgwidth{#1\columnwidth}
    \import{./figures/}{#2.pdf_tex}
}

\pdfsuppresswarningpagegroup=1

% SOME CODE FROM THE QUIVER PACKAGE 
% I use the quiver web app to draw commutative diagrams 
% This is some code from the quiver.sty package to get it to work 
% For some reason, I cannot install this package via CTAN

% A TikZ style for curved arrows of a fixed height, due to AndréC.
\tikzset{curve/.style={settings={#1},to path={(\tikztostart)
    .. controls ($(\tikztostart)!\pv{pos}!(\tikztotarget)!\pv{height}!270:(\tikztotarget)$)
    and ($(\tikztostart)!1-\pv{pos}!(\tikztotarget)!\pv{height}!270:(\tikztotarget)$)
    .. (\tikztotarget)\tikztonodes}},
    settings/.code={\tikzset{quiver/.cd,#1}
        \def\pv##1{\pgfkeysvalueof{/tikz/quiver/##1}}},
    quiver/.cd,pos/.initial=0.35,height/.initial=0}

% A TikZ style for shortening paths without the poor behaviour of `shorten <' and `shorten >'.
\tikzset{between/.style n args={2}{/tikz/spath/at end path construction={
    \tikzset{spath/split at keep middle={current}{#1}{#2}}
}}}

% TikZ arrowhead/tail styles.
\tikzset{tail reversed/.code={\pgfsetarrowsstart{tikzcd to}}}
\tikzset{2tail/.code={\pgfsetarrowsstart{Implies[reversed]}}}
\tikzset{2tail reversed/.code={\pgfsetarrowsstart{Implies}}}
% TikZ arrow styles.
\tikzset{no body/.style={/tikz/dash pattern=on 0 off 1mm}}

\DeclareOption{twocolumn}{\OptionNotUsed}

% The colorful option gives access to the cproblem command 
% Which defines the problem environment in a tcolorbox for some color
\DeclareOption{colorful}{
		\newcounter{problemctr}
		\numberwithin{equation}{problemctr}
		\renewcommand{\theequation}{\theproblemctr.\arabic{equation}}

		\NewDocumentEnvironment{cproblem}{o}{%
				\stepcounter{problemctr}
				\begin{tcolorbox}[
						enhanced jigsaw, 
						left = 3mm, top = 2mm, right = 3mm, bottom = 2mm, 
						boxrule = 0pt,
						frame hidden,
						borderline west = {0.8mm}{0pt}{black},
						colback = cyan!10,
						after skip = 5mm,
						breakable
				]
				\noindent\textbf{\textsf{Problem \theproblemctr}} \IfNoValueTF{#1}{\textbf{:}}{(#1)\textbf{:}} \par\vspace{0.1em}
		}{%
				\end{tcolorbox}
		}

}


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

		% Blackboard fonts
		\newcommand{\N}{\mathbb{N}}                 % Natural numbers
		\newcommand{\Z}{\mathbb{Z}}                 % Integers
		\newcommand{\Q}{\mathbb{Q}}                 % Rational numbers 
		\newcommand{\R}{\mathbb{R}}                 % Real numbers
		\newcommand{\C}{\mathbb{C}}                 % Complex numbers
		\newcommand{\F}{\mathbb{F}}                 % Finite fields 
		\newcommand{\bP}{\mathbb{P}}								% Probability 
		\newcommand{\E}{\mathbb{E}}									% Expectation
		\newcommand{\idFn}{\mathbbm{1}}							% Indicator function

		% Script (mathcal) fonts
		\newcommand{\calT}{\mathcal{T}}							 
		\newcommand{\calP}{\mathcal{P}}
		\newcommand{\calS}{\mathcal{S}}
		\newcommand{\calA}{\mathcal{A}}
		\newcommand{\calB}{\mathcal{B}}
		\newcommand{\calL}{\mathcal{L}}

		% Linear algebra
		\DeclareMathOperator{\Span}{span}
		\DeclareMathOperator{\Null}{Null}
		\DeclareMathOperator{\Range}{Range}
		\DeclareMathOperator{\rank}{rank}
		\DeclareMathOperator{\nullity}{nullity}
		\DeclareMathOperator{\trace}{tr}
		\DeclareMathOperator{\im}{im}
		\newcommand{\prtl}{\partial}
		\newcommand{\vecte}{\mathbf{e}}
		\newcommand{\vectx}{\mathbf{x}}
		\newcommand{\vecty}{\mathbf{y}}
		\newcommand{\vectu}{\mathbf{u}}
		\newcommand{\vecth}{\mathbf{h}}

		% Matrix groups
		\newcommand{\GL}{\text{GL}} 
		\newcommand{\SL}{\text{SL}}
		\newcommand{\PGL}{\text{PGL}}
		\newcommand{\PSL}{\text{PSL}}
		\newcommand{\On}{\text{O}}
		\newcommand{\SO}{\text{SO}}
		\newcommand{\U}{\text{U}}
		\newcommand{\SU}{\text{SU}}
		
		% Topology
		\DeclareMathOperator{\Bd}{Bd}
		\newcommand{\obar}{\overline}
		\DeclareMathOperator{\Hom}{Hom}
		\DeclareMathOperator{\Ext}{Ext}
		
		% Algebra 
		\DeclareMathOperator{\Aut}{Aut}
		\DeclareMathOperator{\orb}{orb}
		\DeclareMathOperator{\stab}{stab}
		\DeclareMathOperator{\core}{core}
		\DeclareMathOperator{\Syl}{Syl}

		% Plus, minus, equals with extra alignments 
		% These are to be used inside the specialized alignment environments for system of equations and IVP/BVPs
		\newcommand{\aplus}{&{}+{}&}
		\newcommand{\aminus}{&{}-{}&}
		\newcommand{\aequals}{&{}={}&}
		\newcommand{\ablank}{&&}

		\NewDocumentEnvironment{systemeqns*}{m}{%
				\begin{equation*}
						\begin{alignedat}{#1}
		}{
						\end{alignedat}
				\end{equation*}
		}

		\NewDocumentEnvironment{systemeqns}{m}{%
				\begin{equation}
						\begin{alignedat}{#1}
		}{
						\end{alignedat}
				\end{equation}
		}

		% Line for one line of a bvp
		\newcommand{\bvpline}[3]{%
				#1 \aequals &#2& &\quad #3 \\
		}

		\NewDocumentEnvironment{bvp*}{}{%
				\begin{equation*}
						\left\{\begin{alignedat}{3}
		}{
						\end{alignedat}\right.
				\end{equation*}
		}

		\NewDocumentEnvironment{bvp}{}{%
				\begin{equation}
						\left\{\begin{alignedat}{3}
		}{
						\end{alignedat}\right.
				\end{equation}
		}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
