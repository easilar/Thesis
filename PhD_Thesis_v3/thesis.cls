%
% ociamthesis v2.2
% By Keith A. Gillow <gillow@maths.ox.ac.uk>
% Version 1.0 released 26/11/1997
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2010/11/22 v2.2 OCIAM thesis class]
%-------------------------- initial code -----------------------
\def\logoversion{squarelogo}
\DeclareOption{beltcrest}{\def\logoversion{beltcrest}}
\DeclareOption{shieldcrest}{\def\logoversion{shieldcrest}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
%\LoadClass[a4paper,twoside,openright]{report}

\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo

\raggedbottom

%define the default submitted text
\newcommand{\submittedtext}{{A thesis submitted for the degree of}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the thesis is submitted 
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}


%
% Setup choosen crest/logo
%

\ifthenelse{\equal{\logoversion}{shieldcrest}}%
{
% Traditional Oxford shield crest
%Using latex metafont (Mathematical Institute system)
\font\crestfont=oxcrest40 scaled\magstep3
\def\logo{{\crestfont \char1}}
%For comlab system replace 1st line above with
%\font\crestfont=crest scaled\magstep3
}{}

\ifthenelse{\equal{\logoversion}{beltcrest}}%
{
% Newer Oxford Belt crest
%Using latex metafont (Mathematical Institute system)
\font\beltcrestfont=oxbeltcrest
\def\logo{{\beltcrestfont \char0}}
%For comlab system replace 1st line above with
%\font\beltcrestfont=newcrest
}{}

\ifthenelse{\equal{\logoversion}{squarelogo}}%
{
% Latest Logo, Square version (the default!)
% you need an oxlogo.eps or oxlogo.pdf file as appropriate
\def\logo{{\includegraphics[width=50mm]{TU_Wien_Logo}}}
}{}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    %\renewcommand{\footnotesize}{\small}
    %\renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  %\null\vfill
  \begin{center}
  
%    { \Huge {\bfseries {\@title}} \par}
%{\large \vspace*{40mm} {\logo \par} \vspace*{25mm}}
 %   {{\Large \@author} \par}
%{\large \vspace*{1ex}
  %  {{\@college} \par}
%\vspace*{1ex}
 %   {Ausgef\"uhrt am Atominstitut der Technischen Universit\"at Wien\\
%in Verbindung mit dem Institut f\"ur Hochenergiephysik (HEPHY)\\
%der \"Osterreichischen Akademie der Wissenschaften}
%\vspace*{25mm}
  %  { \par}
%\vspace*{1ex}
  %  {\it {\@degree} \par}
%\vspace*{2ex}
  %  {\@degreedate}}
 % Logo
\vspace{-1cm} 

\includegraphics[height=3.5cm]{TU_Wien_Logo}

\vspace{0.1cm}

% Heading
{\huge \textsc{Dissertation}}\\[0.7cm]

% Title
\rule{\linewidth}{0.5mm} \\[0.4cm]

{ \huge \bfseries 
Search for supersymmetry \\[0.1cm]
 in the single lepton final state \\[0.1cm]
 in 13 TeV pp collisions with the CMS experiment \\[0.4cm]
}

\rule{\linewidth}{0.5mm} \\[1.0cm]

ausgef\"uhrt zum Zwecke der Erlangung des akademischen Grades einer Doktorin der technischen Wissenschaften unter der Leitung von\\[0.2cm]

% Advisors
\textsc{Univ.Prof. Dipl.-Ing. Dr.techn. Jochen Schieck}\\[0.1cm]
und \\[0.1cm]
\textsc{Dr. Robert Sch\"ofbeck} \\[0.3cm]

% Institute
am Institut f\"ur Hochenergiephysik (HEPHY) \\
der \"Osterreichischen Akademie der Wissenschaften (\"OAW) \\
und am Atominstitut (E141)\\[0.3cm]
 
eingereicht an der\\
{\sc Technischen Universit\"at Wien\\ Fakult\"at f\"ur Physik} 
 
% Author
von\\[0.1cm]
\textsc{M.S. Ece A\d{s}ilar}\\
Matrikelnummer: 1428489\\[0.4cm]

%\vfill % This is a space that elastically goes down to what remains of
       % the page...
% Bottom of the page
Wien, am 20. August 2017
 
 
  \end{center}
  \null\vfill
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% STATEMENT OF ORIGINALITY (AS SUGGESTED BY GSW)
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The originalitylong environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself does not appears in a quote environment so you can 
% get more in.

\newenvironment{originalitylong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
    {University of Oxford \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%%%%Introdution%%%
\newenvironment{Introduction} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Introduction}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abbreviations} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abbreviations}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}


%\newcommand{\abbrevname}{List of Abbreviations}
%\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
%\providecaptionname{ngerman,german,austrian,naustrian}{\abbrevname}{Abk\"urzungsverzeichnis}
%\newenvironment{abbreviations}{ m }{
%	\ifbool{nolistspace}{\begingroup\singlespacing}{}
%	\ifbool{listtoc}{\addchap{\abbrevname}}{\addchap*{\abbrevname}}
%	\begin{longtable}{1}
%	}
%	{
%	\end{longtable}
%	\addtocounter{table}{-1}% Don't count this table as one of the document tables
%	\ifbool{nolistspace}{\endgroup}{}
%}


%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%Glossary
%\renewenvironment{glossary}
%{\begin{alwayssingle} \thispagestyle{empty}
 % \begin{center}
 % %\vspace*{1.5cm}
  %{\Large \bfseries  Abbreviations}
 % \end{center}
%  %\vspace{0.5cm}
 %  \begin{quote}
% }
%{\end{quote}\end{alwayssingle}}




%bibliography
%\def\thebibliography{
%\newpage
%\@ifnextchar[{\@themybib}{\@themybib[]}
%}
%\def\endthebibliography{\endlist}


