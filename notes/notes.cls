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

\pgfplotsset{compat = 1.18}
\tcbuselibrary{theorems}

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

% Topology 
\newcommand{\prtl}{\partial} 
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\Ext}{Ext}
\DeclareMathOperator{\Tor}{Tor}

% Change numbering of equations and figures to match section 
\numberwithin{equation}{section}
\numberwithin{figure}{section}

% Plain, standard ams environments
\theoremstyle{plain}
\newtheorem{thrm}{Theorem}[section]
\newtheorem{prop}[thrm]{Proposition}

\theoremstyle{definition}
\newtheorem{defn}[thrm]{Definition}
\newtheorem{cor}[thrm]{Corollary}
\newtheorem{example}[thrm]{Example}

\DeclareOption{colorful}{
		% This adds colored versions of the ams environments 
		% The numbering will be the same as the plain environments 
		% So you can mix and match colorful environments and the plain environments

		% Theorem
    \newtcbtheorem[number within = section, use counter = example]{cthrm}{Theorem}{sharp corners = all, fonttitle = \sffamily\bfseries, colback = red!20, colframe = red}{thrm}

    % Definition
    \newtcbtheorem[number within = section, use counter = example]{cdefn}{Definition}{sharp corners = all, fonttitle = \sffamily\bfseries, colback = cyan!20, colframe = blue}{defn}

    % Proposition
    \newtcbtheorem[number within = section, use counter = example]{cprop}{Proposition}{sharp corners = all, fonttitle = \sffamily\bfseries, colback = orange!20, colframe = orange}{prop}

    % General fact block
    \newtcbtheorem[number within = section, use counter = example]{cfact}{Fact}{sharp corners = all, fonttitle = \sffamily\bfseries, colback = green!20}{fact}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

