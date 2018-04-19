% Class for SINTEF memos with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefprojectmemo}[2014/12/04 A class to prepare project memos in SINTEF]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}
% A project memo uses mostly serif fonts
\renewcommand*{\familydefault}{\rmdefault}

% Set margins
\RequirePackage[top=3cm,        bottom=15ex,
                left=2cm,       right=2cm,
                headheight=8mm, footskip=2.5ex]{geometry}

\heading{\EnglishNorsk{Project Memo}{Prosjektnotat}}

% Section titles in sans serif
\RequirePackage{sectsty}
\allsectionsfont{\sffamily}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}
\newpagestyle{firstpage}[fancy]{%
  \fancyhead[l]{\includegraphics[width=0.2\textwidth]{\@mainlogo}}
  \fancyfoot[c]{%
    \sffamily%
    \ifbool{digitalsignature}{
      \@separator\newline%
      \begin{minipage}{0.4\textwidth}
      \@labeltext \@preparedlabel\\
      \@prepared
      \end{minipage}
      \hfill
      \begin{minipage}{0.5\textwidth}
      \@labeltext \@approvedlabel\\
      \@approved
      \end{minipage}\newline%
      % Space for digital stamp
      \vspace{1.75cm}
    }{}% Skip the previous section if digitalsignature is false
    \color{sintefgray}%
    \@separator\newline
    \begin{minipage}{\textwidth}
      \flushright%
      \thepage\ \EnglishNorsk{of}{av}
      \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}%
    \end{minipage}%
    \newline
    \@separator
  }
}

% Header
\renewcommand{\headrulewidth}{0pt}
\fancyhead[l]{\includegraphics[width=0.2\textwidth]{\@mainlogo}}

% Footer
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[c]{%
  \color{sintefgray}%
  \sffamily%
  \@separator\newline%
  \begin{minipage}{0.25\textwidth}
    \@labeltext \@projectlabel\newline
    \@project
  \end{minipage}%
  \begin{minipage}{0.25\textwidth}
    \@labeltext \@projectmemolabel\newline
    \@projectmemo
  \end{minipage}%
  \begin{minipage}{0.25\textwidth}
    \@labeltext \@versionlabel\newline
    \@version
  \end{minipage}%
  \hfill
  \thepage\ \EnglishNorsk{of}{av} \pageref{LastPage}~\newline
  \@separator
}


% Recipient address and information colophon
\RequirePackage{setspace,sintefhistory,sintefattachments}
\newcommand{\frontmatter}{%
  \thispagestyle{firstpage}%
  \ifbool{digitalsignature}{
    \newgeometry{top=3cm, bottom=5.5cm, left=2cm, right=2cm,
                 headheight=8mm, footskip=2.5ex}
  }{}
  \noindent%
  \begin{minipage}[t]{0.25\textwidth}
    \@shortinfo
  \end{minipage}
  \hfill
  \begin{minipage}[t]{0.7\textwidth}
    \setlength{\parskip}{2ex}%
    \Huge \@heading

    \vspace{2ex}
    \huge\textbf \@title\\
    \normalsize \@subtitle

    \vspace{4ex}%
    \noindent%
    \begin{minipage}{0.49\textwidth}
      \@labeltext \@versionlabel\\
      \@version
    \end{minipage}
    \hfill
    \begin{minipage}{0.5\textwidth}
      \@labeltext \@datelabel\\
      \@date
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{\textwidth}
      \@labeltext \@authorlabel\\
      \@author
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.49\textwidth}
      \@labeltext \@clientlabel\\
      \@client
    \end{minipage}
    \hfill
    \begin{minipage}{0.5\textwidth}
      \@labeltext \@clientreflabel\\
      \@clientref
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.49\textwidth}
      \@labeltext \@projectlabel\\
      \@project
    \end{minipage}
    \hfill
    \begin{minipage}{0.5\textwidth}
      \@labeltext \@pageslabel\\
      \pageref{LastPage} \@attachmentpages
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{\textwidth}
      \@labeltext \@abstractlabel\\
      \@abstract
    \end{minipage}\\
    \@separator\\
    \ifbool{digitalsignature}{% Skip this section if true
    }{
	    \begin{minipage}{0.49\textwidth}
	      \@labeltext \@preparedlabel\\
	      \@prepared
	    \end{minipage}
	    \hfill
	    \begin{minipage}{0.5\textwidth}
	      \@labeltext\textmd\@signaturelabel\bigskip
	    \end{minipage}\\
	    \@separator\\
	    \begin{minipage}{0.49\textwidth}
	      \@labeltext \@approvedlabel\\
	      \@approved
	    \end{minipage}
	    \hfill
	    \begin{minipage}{0.5\textwidth}
	      \@labeltext\textmd\@signaturelabel\bigskip
	    \end{minipage}\\
	    \@separator\\
	  }
    \begin{minipage}{0.49\textwidth}
      \@labeltext \@projectmemolabel\\
      \@projectmemo
    \end{minipage}
    \hfill
    \begin{minipage}{0.5\textwidth}
      \@labeltext \@classificationlabel\\
      \@classification
    \end{minipage}
  \end{minipage}

  \ifbool{digitalsignature}{\restoregeometry}{\clearpage}

  \historypage

  \tableofcontents

  \attachmentsection

  \clearpage

  \rmfamily % Plain text is in serif font
  \noindent
}

\newcommand{\backmatter}{%
  \clearpage%
  % Subtract one page so LastPage seems to refer to our intended last page.
  \addtocounter{page}{-1}%
  \thispagestyle{empty}%
  \centering%
  \sffamily%
  \vspace*{0.8\textheight}%
  \includegraphics[width=0.4\textwidth]{\@mainlogo}\\
  \vspace*{2ex}
  {\LARGE \@motto}\\
  \textbf{\large \@website}
}
