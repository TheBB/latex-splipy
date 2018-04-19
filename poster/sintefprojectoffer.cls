% Class for SINTEF project offers with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefprojectoffer}[2015/10/01 A class to prepare project offers in SINTEF]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}
% Offers/Proposals use mostly serif fonts.
\renewcommand*{\familydefault}{\rmdefault}

% Set margins
\RequirePackage[top=3cm,        bottom=15ex,
                left=2cm,       right=2cm,
                headheight=8mm, footskip=2.5ex]{geometry}

\renewcommand*{\@clientlabel}{\EnglishNorsk{PROSPECTIVE CLIENT}{MOTTAKER}}
\renewcommand*{\@clientreflabel}
              {\EnglishNorsk{CLIENT'S REFERENCE\newline OR CONTACT PERSON}
                            {MOTTAKERS REFERANSE}}
\renewcommand*{\@pageslabel}
              {\EnglishNorsk{NUMBER OF PAGES\newline AND ATTACHMENTS}
                            {ANTALL SIDER\newline OG VEDLEGG}}

\heading{\EnglishNorsk{Project Offer}{Prosjekttilbud}}

\newcommand{\@disclaimer}{}

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
        \begin{minipage}{0.3\textwidth}
        \@labeltext \@preparedlabel\\
        \@prepared
        \end{minipage}
        \hfill
        \begin{minipage}{0.3\textwidth}
        \@labeltext \@checkedlabel\\
        \@checked
        \end{minipage}
        \hfill
        \begin{minipage}{0.3\textwidth}
        \@labeltext \@approvedlabel\\
        \@approved
        \end{minipage}\newline%
        % Space for digital stamp
        \vspace{1.75cm}
      }{}% Skip this section if digitalsignature is false
    \color{sintefgray}%
    \@separator\newline
    \hspace*{0.15\textwidth}%
    \begin{scriptsize}%
    \begin{minipage}[c]{0.7\textwidth}
    \centering
    \@disclaimer
    \end{minipage}%
    \end{scriptsize}%
    \hfill
    \thepage\ \EnglishNorsk{of}{av} \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}
    ~~\newline
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
  \@separator\newline
  ~~%
  \begin{minipage}[c]{0.25\textwidth}
    \@labeltext \@projectlabel\newline
    \@project
  \end{minipage}%
  \begin{minipage}[c]{0.25\textwidth}
    \@labeltext \@versionlabel\newline
    \@version
  \end{minipage}%
  \hfill
  \thepage\ \EnglishNorsk{of}{av} \pageref{LastPage}
  ~~\newline
  \@separator
}

% Recipient address and information colophon
\RequirePackage{setspace,sintefhistory,sintefattachments,tabularx}
\newcommand{\frontmatter}{%
  \ifbool{digitalsignature}{
    \newgeometry{top=3cm, bottom=5.5cm, left=2cm, right=2cm,
                 headheight=8mm, footskip=2.5ex}
  }{}
  \thispagestyle{firstpage}%
  \noindent%
  \begin{minipage}[t]{0.25\textwidth}
    \@shortinfo
  \end{minipage}%
  \begin{minipage}[t]{0.75\textwidth}
    \setlength{\parskip}{2ex}%
    \Huge \@heading

    \vspace{2ex}
    \huge\textbf \@title\\
    \normalsize \@subtitle

    \vspace{4ex}%
    \noindent%
    \begin{minipage}{0.6\textwidth}
      \@labeltext \@versionlabel\\
      \@version
    \end{minipage}%
    \hfill
    \begin{minipage}{0.33\textwidth}
      \@labeltext \@datelabel\\
      \@date
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.6\textwidth}
      \@labeltext \@clientlabel\\
      \@client
    \end{minipage}%
    \hfill
    \begin{minipage}{0.33\textwidth}
      \@labeltext \@clientreflabel\\
      \@clientref
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.6\textwidth}
      \@labeltext \@projectlabel\\
      \@project
    \end{minipage}%
    \hfill
    \begin{minipage}{0.33\textwidth}
      \@labeltext \@pageslabel\\
      \pageref{LastPage} \@attachmentpages
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.33\textwidth}
      \@labeltext \@offernumberlabel\\
      \@offernumber
    \end{minipage}%
    \hfill
    \begin{minipage}{0.33\textwidth}
      \@labeltext \@validitylabel\\
      \@validity
    \end{minipage}%
    \hfill
    \begin{minipage}{0.33\textwidth}
      \@labeltext \@classificationlabel\\
      \@classification
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{\textwidth}
      \@labeltext \@objectivelabel\\
      \@abstract
    \end{minipage}\\
    \@separator\\
    \begin{tabularx}{\textwidth}{@{}XlXl}
    \@labeltext\@startlabel & \@start & \@labeltext\@completelabel & \@complete\\
    \\
    \@labeltext\@firstexplabel & \@firstexp & \@labeltext\@totalexplabel & \@totalexp
    \end{tabularx}
    \@separator\\
    \ifbool{digitalsignature}{}{% Skip this section if true
      \begin{minipage}{0.49\textwidth}
        \@labeltext \@managerlabel\\
        \@manager
      \end{minipage}%
      \hfill
      \begin{minipage}{0.5\textwidth}
        \@labeltext\textmd\@signaturelabel\bigskip
      \end{minipage}\\
      \@separator\\
      \begin{minipage}{0.49\textwidth}
        \@labeltext \@checkedlabel\\
        \@checked
      \end{minipage}%
      \hfill
      \begin{minipage}{0.5\textwidth}
        \@labeltext\textmd\@signaturelabel\bigskip
      \end{minipage}\\
      \@separator\\
      \begin{minipage}{0.49\textwidth}
        \@labeltext \@approvedlabel\\
        \@approved
      \end{minipage}%
      \hfill
      \begin{minipage}{0.5\textwidth}
        \@labeltext\textmd\@signaturelabel\bigskip
      \end{minipage}%
    }
  \end{minipage}

  \ifbool{digitalsignature}{\restoregeometry}{\clearpage}

  \historypage

  \tableofcontents

  \attachmentsection

  \clearpage

  \rmfamily % Plain text is in serif font
  \noindent
}
