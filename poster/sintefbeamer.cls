% Template for SINTEF presentations with LaTeX beamer.
%
% by Federico Zenith, federico.zenith@sintef.no.
% Derived (through several iterations) from Håvard Berland's
% beamerthementnu class.
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

% The theme defaults to generic SINTEF English; set the institute acronym or
% the company motto in Norwegian with the \setcornertext command if necessary.

\ProvidesClass{sintefbeamer}[2017/06/22]

\RequirePackage{etoolbox}
\newcommand{\@DashColor}{sintefcyan}
\newcommand{\@DashHeight}{0.4mm}
\newbool{SINTEFdark}
\PassOptionsToClass{aspectratio=169}{beamer} % Default, may be overridden
\DeclareOption{cyandash}{\renewcommand{\@DashColor}{sintefcyan}}
\DeclareOption{greendash}{\renewcommand{\@DashColor}{sintefgreen}}
\DeclareOption{magentadash}{\renewcommand{\@DashColor}{sintefmagenta}}
\DeclareOption{yellowdash}{\renewcommand{\@DashColor}{sintefyellow}}
\DeclareOption{nodash}{\renewcommand{\@DashHeight}{0mm}}
\DeclareOption{light}{\boolfalse{SINTEFdark}}
\DeclareOption{dark}{\booltrue{SINTEFdark}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

% Pass this option to fontspec so that math will stay sans-serif as set by
% Beamer. If you do want serif math, pass option mathserif to the class directly.
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}

% If we use font names, the compiler might not find the font, esp. in Linux,
% see http://tex.stackexchange.com/questions/132906/.
\setmainfont[
	Extension = .otf,
	UprightFont = *-regular,
	BoldFont = *-bold,
	ItalicFont = *-italic,
	BoldItalicFont = *-bolditalic
]{texgyretermes}

% The default sans-serif font is Calibri, but it is not available on Linux.
% As an alternative, we use Carlito, a metric-compatible, freely available
% clone developed by Google:
\IfFontExistsTF{Calibri}
	{\setsansfont{Calibri}}
	{\IfFontExistsTF{Carlito}
		{\PackageWarning{sintefdoc}{Using Carlito font instead of Calibri}\setsansfont{Carlito}}
		{\PackageError{sintefdoc}{SINTeX needs Calibri or Carlito font}{See sintefdoc.pdf}}
	}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{graphicx,sintefcolor}

% Following commands will not be activated for article mode.
\mode<presentation>

% No navigation symbols
\setbeamertemplate{navigation symbols}{}

% Set colours
\setbeamercolor{alerted text}{fg=sintefmagenta}
\setbeamercolor{headline}{fg=white,bg=sintefblue}
\setbeamercolor{author}{fg=sintefcyan}
\setbeamercolor{example text}{fg=sintefcyan,bg=sinteflightgrey}
\setbeamercolor{block title}{fg=white,bg=sintefblue}
\setbeamercolor{block body}{fg=sintefblue,bg=sinteflightgrey}
\setbeamercolor{block body example}{fg=sintefblue,bg=sinteflightgrey}
\newcommand{\@SINTEFlogo}{Sintef_logo_blue}
\ifbool{SINTEFdark}{
    \setbeamercolor{normal text}{fg=white}
    \setbeamercolor{background canvas}{bg=sintefblue}
    \setbeamercolor{structure}{fg=white}
    \setbeamercolor{title}{fg=white,bg=sintefblue}
    \setbeamercolor{footline}{fg=white}
    \setbeamercolor{itemize items}{fg=white}
    \renewcommand{\@SINTEFlogo}{Sintef_logo_white}
}{
    \setbeamercolor{normal text}{fg=sintefblue}
    \setbeamercolor{background canvas}{bg=white}
    \setbeamercolor{structure}{fg=sintefblue}
    \setbeamercolor{title}{fg=sintefblue,bg=white}
    \setbeamercolor{footline}{fg=sintefblue}
    \setbeamercolor{itemize items}{fg=sintefblue}
    \renewcommand{\@SINTEFlogo}{Sintef_logo_blue}
}

\setbeamerfont{author}{size=\scriptsize}

% Code to get prettier boxes
\setbeamertemplate{blocks}[rounded][shadow=true]

% Bullets in several levels
\setbeamertemplate{itemize item}{\textbullet}
\setbeamertemplate{itemize subitem}{\textendash}
\setbeamertemplate{itemize subsubitem}{\guillemotright}

% Define frame title and subtitle layout
\setbeamertemplate{frametitle}
{
\begin{beamercolorbox}[ht=15mm,dp=2mm]{frametitle}
    \usebeamerfont{frametitle}\insertframetitle\\
    \usebeamerfont{framesubtitle}\insertframesubtitle~\vphantom{phantomText}\\
    \textcolor{\@DashColor}{\rule[2ex]{1cm}{\@DashHeight}}
\end{beamercolorbox}
}

% Define the title page
\setbeamertemplate{title page}
{\vskip0pt plus 1filll\hfill
\pgfsetfillopacity{0.8}
\begin{beamercolorbox}[wd=80mm,sep=10pt,dp=0mm,left]{title}
    \usebeamerfont{title}\inserttitle

    \usebeamerfont{subtitle}\insertsubtitle
    
    \color{sintefcyan}
    \vspace{1ex}
    \usebeamerfont{author}\insertauthor

    \vspace{1ex}
    \usebeamerfont{date}\insertdate
\end{beamercolorbox}
}

% Define the bottom of each standard frame
\setbeamerfont{footline}{size=\scriptsize}
\setbeamertemplate{footline}
{
  \begin{beamercolorbox}[wd=\textwidth,ht=5mm,dp=3mm]{footline}
    \usebeamerfont{footline}
    \hspace{2em}\insertframenumber
    \hfill
    \raisebox{-0.5ex}{\includegraphics[height=2.5ex]{\@SINTEFlogo}}
    \hspace{2em}
  \end{beamercolorbox}
}

\newcommand{\@TitleBackground}{default}
\newcommand{\titlebackground}{\renewcommand{\@TitleBackground}}
\renewcommand{\maketitle}{{% Double braces for local empty footline
  \graphicspath{{./backgrounds/}}
  \usebackgroundtemplate{\includegraphics[width=\paperwidth,height=\paperheight]{\@TitleBackground}}
  \setbeamertemplate{headline}{
  \hspace{0.074\textwidth}
  \begin{beamercolorbox}[center,wd=0.125\textwidth,ht=0.2675\textheight,dp=0mm]{headline}
    \raisebox{5mm}{\includegraphics[width=0.09375\textwidth]{Sintef_logo_white}}
  \end{beamercolorbox}
  }%
  \setbeamertemplate{footline}{}%
  \begin{frame}%
  \titlepage%
  \end{frame}%
  \addtocounter{framenumber}{-1}%
}}

\newcommand{\@SINTEFmotto}{Technology for a better society}
\newcommand{\setmotto}{\renewcommand{\@SINTEFmotto}}
\newcommand{\backmatter}{
\setbeamercolor{background canvas}{bg=sintefblue}
\begin{frame}[plain,c]
\begin{center}
\includegraphics[height=2.5ex]{Sintef_logo_white}

\vspace{3ex}
\textcolor{white}{\@SINTEFmotto}
\end{center}
\end{frame}
}

\mode<all>
