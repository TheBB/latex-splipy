% Class for SINTEF meeting notices with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefmeetingnotice}[2013/12/11 A class to prepare meeting notices in the SINTEF style]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\PassOptionsToPackage{table}{xcolor}
\LoadClass{sintefdoc}

% Set margins
\RequirePackage[top=3.1cm,      bottom=15ex,
                left=2.3cm,     right=2.3cm,
                headheight=1cm, footskip=2.5ex]{geometry}

\heading{\EnglishNorsk{Notice of Meeting}{Møteinnkalling}}

% Section titles in sans serif
\RequirePackage{sectsty}
\allsectionsfont{\sffamily}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}

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
  \hfill
  \thepage\ \EnglishNorsk{of}{av} \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}
  ~~\newline
  \@separator
}

\RequirePackage{xparse}
\newcommand{\DistributionTable}{}
\DeclareDocumentCommand \recipient { O{participant} m }{
  \makeatletter
    \g@addto@macro \DistributionTable {
        #2 & \ifstrequal{#1}{participant}{$\bullet$}{}
           & \ifstrequal{#1}{information}{$\bullet$}{}\\
    }
  \makeatother
}

% Recipient address and information colophon
\RequirePackage{colortbl,tabularx,setspace,rotating}
\newcommand{\frontmatter}{%
  \sffamily%
  \noindent%
  \begin{minipage}[b]{0.7\textwidth}
    \setlength{\parskip}{2ex}%
    \Huge \@heading

    \huge\textbf \@title
    
    % ~ ensures \\ does not crash when \@wheremeeting is empty
    \Large \@wheremeeting~\\\@whenmeeting
  \end{minipage}
  \hfill
  \begin{minipage}[b]{0.25\textwidth}
    % Bring the colophon and address back up a bit
    \vspace*{-25pt}%
    \@shortinfo
  \end{minipage}

  \vspace{4ex}%
  \noindent%
  \@separator\\
  \rowcolors{4}{}{sinteflightgray}
  \begin{tabularx}{\textwidth}{Xcc}
    \rowcolor{white} \parbox{\linewidth}{{\@labeltext \@initiatorlabel}\\\@author}
    & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@participantlabel}\end{sideways}}
    & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@informationlabel}\end{sideways}}\\
    \rowcolor{white} \multicolumn{3}{@{}c@{}}{\@separator}\\
    \rowcolor{white} \@labeltext \@distributionlabel\\
    \DistributionTable
  \end{tabularx}
  \rowcolors{1}{}{} % Back to normal
  \@separator\\
  \begin{minipage}{0.35\textwidth}
    \@labeltext \@projectlabel\\
    \@project
  \end{minipage}
  \hfill
  \begin{minipage}{0.35\textwidth}
    \@labeltext \@datelabel\\
    \@date
  \end{minipage}
  \begin{minipage}{0.25\textwidth}
    \@labeltext \@classificationlabel\\
    \@classification
  \end{minipage}\\
  \@separator

  \noindent
}
