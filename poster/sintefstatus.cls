% Class for SINTEF status reports with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefstatus}[2015/10/01 A class to prepare status reports in the SINTEF style]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}


% Set margins
\RequirePackage[top=3.1cm,      bottom=15ex,
                left=2.3cm,     right=2.3cm,
                headheight=1cm, footskip=2.5ex]{geometry}

% Definition of variables
\heading{\EnglishNorsk{Status Report}{Statusrapport}}

\newcommand*{\@plannedexpenditures}{}
\newcommand*{\plannedexpenditures}[1]{%
  \renewcommand{\@plannedexpenditures}{%
    \addplot[cyan, very thick, mark=diamond*] coordinates { #1 };%
  }%
}
\newcommand {\@accumulatedexpenditures}{}
\newcommand*{\accumulatedexpenditures}[1]{%
  \renewcommand{\@accumulatedexpenditures}{%
    \addplot[sintefblue, very thick, mark=square*] coordinates { #1 };%
  }%
}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}


\newpagestyle{firstpage}[fancy]{%
  \fancyhead[l]{\includegraphics[width=0.2\textwidth]{\@mainlogo}}
  \fancyfoot[c]{%
    \sffamily%
    \ifbool{digitalsignature}{
      \@separator\newline%
      \begin{minipage}{0.45\textwidth}
      \@labeltext \@managerlabel\\
      \@manager
      \end{minipage}
      \hfill
      \begin{minipage}{0.5\textwidth}
      \@labeltext \@approvedlabel\\
      \@approved
      \end{minipage}\newline%
      % Space for digital stamp
      \vspace{1.75cm}
    }{}% Skip the previous section if digitalsignature is false
    \color{sintefgray}
      \@separator\newline
      ~~%
      \begin{minipage}[c]{0.5\textwidth}
        \small{\textbf{\@projectlabel}}\newline
        \@project
      \end{minipage}%
      \hfill%
      \thepage\ \EnglishNorsk{of}{av} \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}%
      ~~\newline
      \@separator
  }
}

% Header
\renewcommand{\headrulewidth}{0pt}
\fancyhead[l]{\includegraphics[width=0.25\textwidth]{\@mainlogo}}

% Footer
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[c]{%
  \sffamily%
  \color{sintefgray}
  \@separator\newline
  ~~%
  \begin{minipage}[c]{0.5\textwidth}
    \small{\textbf{\@projectlabel}}\newline
    \@project
  \end{minipage}%
  \hfill%
  \thepage\ \EnglishNorsk{of}{av} \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}%
  ~~\newline
  \@separator
}

\RequirePackage{tabularx,pgfplots}
\pgfplotsset{compat=1.3}
\RequirePackage[nodayofweek,level]{datetime}
% Define commands for short year number and short month name
\newcommand{\ignoretwo}[2]{}
\newcommand{\shortyear}{\expandafter\ignoretwo\year}
\providecommand*{\shortmonthnamenorsk}[1][\month]{%
\ifcase#1\relax
\or Jan%
\or Feb%
\or Mar%
\or Apr%
\or Mai%
\or Jun%
\or Jul%
\or Aug%
\or Sep%
\or Okt%
\or Nov%
\or Des%
\fi}

\pgfkeys{
  % small skip for thousands separator, no comma
  /pgf/number format/set thousands separator={\,},
  % group-four-digits=false
  /pgf/number format/min exponent for 1000 sep=4
}
\usepgfplotslibrary{dateplot}

% Recipient address and information colophon
\newcommand{\frontmatter}{%
  \thispagestyle{firstpage}%
  \ifbool{digitalsignature}{
    \newgeometry{top=3cm, bottom=5.5cm, left=2cm, right=2cm,
                 headheight=8mm, footskip=2.5ex}%
  }{}
  \noindent%
  \begin{minipage}[b]{0.7\textwidth}
    \setlength{\parskip}{2ex}%
    \Huge \@heading

    \huge\textbf \@title
  \end{minipage}
  \hfill
  \begin{minipage}[b]{0.25\textwidth}
    \@shortinfo
  \end{minipage}

  \vspace{4ex}%
  \noindent%
  \@separator\\
  \begin{minipage}{0.48\textwidth}
    \@labeltext \@clientlabel\\
    \@client
  \end{minipage}
  \hfill
  \begin{minipage}{0.5\textwidth}
    \@labeltext \@clientreflabel\\
    \@clientref
  \end{minipage}\\
  \@separator\\
  \begin{minipage}{0.48\textwidth}
    \@labeltext \@unitlabel\\
    \@institute
  \end{minipage}
  \hfill
  \begin{minipage}{0.5\textwidth}
    \@labeltext \@datelabel\\
    \@date
  \end{minipage}\\
  \@separator\\
  \begin{minipage}{0.48\textwidth}
    \@labeltext \@projectlabel\\
    \@project
  \end{minipage}
  \hfill
  \begin{minipage}{0.5\textwidth}
    \@labeltext \@statusdatelabel\\
    \@statusdate
  \end{minipage}\\
  \@separator\\
  \begin{minipage}{0.48\textwidth}
  \@labeltext \@classificationlabel\\
  \@classification
  \end{minipage}\\
  \@separator\\
  \begin{footnotesize}
  \begin{tabular*}{\textwidth}{p{0.29\textwidth}p{0.27\textwidth}
                               p{0.2\textwidth}>{\centering}p{0.135\textwidth}}
    \bf \@expenditurelabel & \bf \@elapsedlabel & \bf \@statuslabel & \bf \@asplannedlabel\tabularnewline
    \multicolumn{4}{@{}c@{}}{\@separator}\tabularnewline
    \@lastperiodlabel \hfill \@lastexp  & \@lastperiodlabel \hfill \@lasthrs  & 1. \@academiclabel & \@academic   \tabularnewline
    \@totallabel      \hfill \@totalexp & \@totallabel      \hfill \@totalhrs & 2. \@schedulelabel & \@onschedule \tabularnewline
    \@wageslabel      \hfill \@wages    &                                   & 3. \@expshortlabel & \@onbudget   \tabularnewline
    \\
    \@planexplabel    \hfill \@planexp  & & \multicolumn{2}{l}{\@attachmentrequest}
  \end{tabular*}
  \@separator
  \setlength\topsep{0pt} % Necessary to avoid wasting vertical space below
  \begin{center}
    \begin{tikzpicture}
      \begin{axis}[height=5cm,
                  width=0.75\textwidth,
                  title =\textbf{\@expshortlabel},
                  xlabel near ticks,
                  xlabel=\textbf{\@timelabel},
                  ylabel=\textbf{\@currency},
                  axis x line*=bottom,
                  axis y line*=left,
                  scaled ticks=false,
                  date coordinates in=x,
                  x tick label style={rotate=90},
                  xticklabel=\shortmonthname~\shortyear,
                  yticklabel={$\mathsf{\pgfmathprintnumber{\tick}}$},
                  xtick=data,
                  xtick align=outside,
                  ytick align=outside,
                  ymajorgrids,
                  legend style={at={(1.02, 0.5)}, anchor=west, draw=none}]
        \@plannedexpenditures
        \@accumulatedexpenditures
        \legend{\@planlabel, \@accumulatedlabel}
      \end{axis}
    \end{tikzpicture}
  \end{center}
  \ifbool{digitalsignature}{}{% Skip this section if true
    \@separator\\
    \begin{minipage}{0.48\textwidth}
      \@labeltext \@managerlabel\\
      \@manager
    \end{minipage}
    \hfill
    \begin{minipage}{0.5\textwidth}
      \@signaturelabel\bigskip
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.48\textwidth}
      \@labeltext \@approvedlabel\\
      \@approved
    \end{minipage}
    \hfill
    \begin{minipage}{0.5\textwidth}
      \@signaturelabel\bigskip
    \end{minipage}\\
    \@separator
  }
  \end{footnotesize}
  \ifbool{digitalsignature}{\restoregeometry}{\clearpage}
}
