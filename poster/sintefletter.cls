% Class for SINTEF letters with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefletter}[2013/10/02 A class to write letters the SINTEF way]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}

% The next two lines come from the inerrant letter template of LaTeX.
\setlength\parskip{0.7em}
\setlength\parindent{0\p@}

% Set margins
\RequirePackage[top=3.8cm,      bottom=15ex,
                left=2.3cm,     right=2.3cm,
                headheight=1cm, footskip=2.5ex]{geometry}

% Color any section title in cyan
\RequirePackage{sectsty}
\allsectionsfont{\color{cyan}}

% Setting up header and footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}

% Header
\renewcommand{\headrulewidth}{0pt}
\lhead{\includegraphics[width=0.25\textwidth]{\@mainlogo}}
\chead{}
\rhead{}

% Recipient address and information colophon
\RequirePackage{setspace,tabularx}
\renewcommand{\@projectlabel}{%
  \EnglishNorsk{Project / File code}{Prosjekt / Sak}}
\newcommand{\frontmatter}{%
  % Bring the colophon and address back up a bit
  \vspace*{-45pt}%
  % Limit to 8cm so it fits in standard envelope window
  \begin{minipage}[t]{8cm}
    \vspace*{1ex}%
    \large%
    \onehalfspacing%
    \textbf{\@recipient}
  \end{minipage}
  \hfill
  \begin{minipage}[t]{0.25\textwidth}
    \@longinfo
  \end{minipage}

  \vspace{4ex}
  \begin{footnotesize}
    \begin{tabularx}{\textwidth}{@{}XXXX}%
      \textbf{\@yourreflabel} & \textbf{\@ourreflabel}
      & \textbf{\@projectlabel} & \textbf{\@datelabel}\\
      \@yourref & \@ourref & \@project & \@date
    \end{tabularx}%
  \end{footnotesize}%

}

% Closing
\newcommand*{\stopbreaks}{%
  \interlinepenalty\@M
  \def\par{\@@par\nobreak}%
  \let\\\@nobreakcr
  \let\vspace\@nobreakvspace}
\newcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
  \stopbreaks
  \noindent
  \parbox{\textwidth}{\raggedright
       \ignorespaces #1\\[6\medskipamount]%
       \ifx\@empty\fromsig
           \fromname
       \else \fromsig \fi\strut}%
   \par}

% Footer
\RequirePackage{lastpage}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[c]{%
  \sffamily%
  \color{sintefgray}%
  \@separator\newline
  ~~%
  \begin{minipage}[c]{0.5\textwidth}
    \small{\textbf{\expandafter\uppercase\expandafter{\@projectlabel}}}\newline
    \@project
  \end{minipage}
  \hfill
  \thepage\ \EnglishNorsk{of}{av} \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}
  ~~\newline
  \@separator
}
