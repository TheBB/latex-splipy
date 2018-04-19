% Class for SINTEF faxes with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sinteffax}[2013/10/02 A class to prepare faxes in the SINTEF style]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}

% Set margins
\RequirePackage[top=3.1cm,      bottom=15ex,
                left=2.3cm,     right=2.3cm,
                headheight=1cm, footskip=2.5ex]{geometry}

\heading{\EnglishNorsk{Fax}{Telefaks}}

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
  \color{sintefgray}%
  \@separator\newline
  ~~%
  \begin{minipage}[c]{0.5\textwidth}
    \small{\textbf{\@projectlabel}}\newline
    \@project
  \end{minipage}%
  \hfill
  \thepage\ \EnglishNorsk{of}{av}
  \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}
  ~~\newline
  \@separator
}

% Recipient address and information colophon
\newcommand{\frontmatter}{%
  \noindent%
  \begin{minipage}[t]{0.7\textwidth}
    {
      \vspace*{3ex}

      \Huge \@heading

      \vspace*{3ex}
    }
    \@separator\\
    \begin{minipage}{\textwidth}
        \@labeltext \@recipientlabel\\
        \@recipient
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.5\textwidth}
        \@labeltext \@attnlabel\\
        \@attn
    \end{minipage}
    \begin{minipage}{0.48\textwidth}
        \@labeltext \@faxnumberlabel\\
        \@faxnumber
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.5\textwidth}
        \@labeltext \@fromlabel\\
        \@author
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.5\textwidth}
        \@labeltext \@projectlabel\\
        \@project
    \end{minipage}
    \begin{minipage}{0.48\textwidth}
        \@labeltext \@classificationlabel\\
        \@classification
    \end{minipage}\\
    \@separator
  \end{minipage}
  \hfill
  \begin{minipage}[t]{0.25\textwidth}
    % Bring the colophon and address back up a bit
    \vspace*{-25pt}%
    \@longinfo[black]
  \end{minipage}

  \vspace{2ex}
  \noindent
}
