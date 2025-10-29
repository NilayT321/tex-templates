\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}

\LoadClass{article}
\RequirePackage[margin=1.0in]{geometry}
\RequirePackage{amsmath, amsfonts, amssymb, amsthm}
\RequirePackage{mathtools, thmtools}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{tcolorbox}
% \RequirePackage{setspace}
\RequirePackage{import}
\RequirePackage{pdfpages}
\RequirePackage{transparent}
\RequirePackage{xcolor}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{esint}
\RequirePackage[capitalize, noabbrev]{cleveref}
\RequirePackage{breqn}
\RequirePackage{todonotes}
\RequirePackage{minitoc}
\RequirePackage{xparse}

\pgfplotsset{compat = 1.18}
\tcbuselibrary{theorems}
\tcbuselibrary{skins}
\tcbuselibrary{breakable}

\usetikzlibrary{cd}
\usetikzlibrary{calc}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{spath3}


% Change numbering of equations and figures to match section 
\numberwithin{equation}{section}
\numberwithin{figure}{section}

% List spacing 
\setlist{itemsep = 0.3em}

% Plain, standard ams environments
\theoremstyle{plain}
\newtheorem{thrm}{Theorem}[section]
\newtheorem{prop}[thrm]{Proposition}

\theoremstyle{definition}
\newtheorem{defn}[thrm]{Definition}
\newtheorem{cor}[thrm]{Corollary}
\newtheorem{example}[thrm]{Example}

% Inkscape figures
\newcommand{\incfig}[2][1]{%
    \def\svgwidth{#1\columnwidth}
    \import{./figures/}{#2.pdf_tex}
}

\pdfsuppresswarningpagegroup=1

% Colorful option adds some colorful boxes. 
\DeclareOption{colorful}{
		% Common counter for the boxes 
		\newcounter{mainctr}[section]
		\renewcommand{\themainctr}{\thesection.\arabic{mainctr}}

		% Common style for the boxes
		\tcbset{
				coloredbox/.style = {
						blanker, 
						interior engine = spartan, 
						left = 3mm, top = 2mm, right = 3mm, bottom = 2mm, 
						borderline west = {0.8mm}{0pt}{black},
						after skip = 5mm,
						breakable
				}
		}
		
		% Problem/Exercise
		\NewDocumentEnvironment{problem}{o}{%
				\begin{tcolorbox}[
						coloredbox, 
						colback = orange!10
				]
				\stepcounter{mainctr}
				\noindent\textbf{\textsf{Problem \themainctr}} \IfNoValueTF{#1}{\textbf{:}}{(#1)\textbf{:} } \par\vspace{0.1em}
		}{%
				\end{tcolorbox}
		}
		
		% Theorem 
		\NewDocumentEnvironment{cthrm}{o}{
				\begin{tcolorbox}[
						coloredbox, 
						colback = blue!10
				]
				\stepcounter{mainctr}
				\noindent\textbf{\textsf{Theorem \themainctr}} \IfNoValueTF{#1}{\textbf{:}}{(#1)\textbf{:} } \par\vspace{0.1em}
		}{
				\end{tcolorbox}
		}

		\NewDocumentEnvironment{cprop}{o}{
				\begin{tcolorbox}[
						coloredbox, 
						colback = cyan!10
				]
				\stepcounter{mainctr}
				\noindent\textbf{\textsf{Proposition \themainctr}} \IfNoValueTF{#1}{\textbf{:}}{(#1)\textbf{:} } \par\vspace{0.1em}
		}{
				\end{tcolorbox}
		}
		
		% Definition
		\NewDocumentEnvironment{cdefn}{o}{
				\begin{tcolorbox}[
						coloredbox, 
						colback = red!10
				]
				\stepcounter{mainctr}
				\noindent\textbf{\textsf{Definition \themainctr}} \IfNoValueTF{#1}{\textbf{:}}{(#1)\textbf{:} }  \par\vspace{0.1em}
		}{
				\end{tcolorbox}
		}

		% Example 
		\NewDocumentEnvironment{cexamp}{o}{
				\begin{tcolorbox}[
						coloredbox, 
						colback = white
				]
				\stepcounter{mainctr}
				\noindent\textbf{\textsf{Example \themainctr}} \IfNoValueTF{#1}{\textbf{:}}{(#1)\textbf{:} }  \par\vspace{0.1em}
		}{
				\end{tcolorbox}
		}
}

\DeclareOption{mathshortcuts}{

		% Shortcuts for mathbb 
		\newcommand{\N}{\mathbb{N}}                 % Natural numbers
		\newcommand{\Z}{\mathbb{Z}}                 % Integers
		\newcommand{\Q}{\mathbb{Q}}                 % Rational numbers 
		\newcommand{\R}{\mathbb{R}}                 % Real numbers
		\newcommand{\C}{\mathbb{C}}                 % Complex numbers
		\newcommand{\F}{\mathbb{F}}                 % Finite fields 
		\newcommand{\bP}{\mathbb{P}}								% Probability 
		\newcommand{\E}{\mathbb{E}}									% Expectation

		% Script fonts
		\newcommand{\calT}{\mathcal{T}}
		\newcommand{\calP}{\mathcal{P}}
		\newcommand{\calS}{\mathcal{S}}
		\newcommand{\calA}{\mathcal{A}}
		\newcommand{\calB}{\mathcal{B}}
		\newcommand{\calF}{\mathcal{F}}

		% Shortcuts for vectors 
		\newcommand{\rowvect}[1]{\begin{bmatrix} #1 \end{bmatrix}}
		\newcommand{\colvect}[1]{\begin{bmatrix} #1 \end{bmatrix}}

		% Predefined vectors 
		\newcommand{\vectu}{\mathbf{u}}
		\newcommand{\vectv}{\mathbf{v}}
		\newcommand{\vectx}{\mathbf{x}}
		\newcommand{\vecty}{\mathbf{y}}
		\newcommand{\vectz}{\mathbf{z}}
		\newcommand{\vecte}{\mathbf{e}}
		\newcommand{\zerovec}{\mathbf{0}}

		% Linear algebra stuff 
		\DeclareMathOperator{\Null}{Null}
		\DeclareMathOperator{\Span}{Span}
		\DeclareMathOperator{\rank}{rank}
		\DeclareMathOperator{\nullity}{nullity}
		\DeclareMathOperator{\Dim}{dim}
		\DeclareMathOperator{\trace}{tr}
		\DeclareMathOperator{\im}{Im}

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
		\newcommand{\prtl}{\partial} 
		\DeclareMathOperator{\Hom}{Hom}
		\DeclareMathOperator{\Ext}{Ext}
		\DeclareMathOperator{\Tor}{Tor}

		% Algebra 
		\DeclareMathOperator{\Aut}{Aut}
		\DeclareMathOperator{\Gal}{Gal}
		\DeclareMathOperator{\orb}{orb}
		\DeclareMathOperator{\stab}{stab}
		\DeclareMathOperator{\core}{core}
		\DeclareMathOperator{\Syl}{Syl}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

