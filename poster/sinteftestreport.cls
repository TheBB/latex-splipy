% Class for SINTEF reports with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sinteftestreport}[2017/03/17 A class to prepare test reports in SINTEF]

% Should not be used in reports
\DeclareOption{internal}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}
% Test reports use mostly serif fonts.
\renewcommand*{\familydefault}{\rmdefault}

% Set margins
\RequirePackage[top=3cm,        bottom=15ex,
               left=2cm,       right=2cm,
               headheight=8mm, footskip=2.5ex]{geometry}

\renewcommand*{\@pageslabel}
              {\EnglishNorsk{NUMBER OF PAGES\newline AND ATTACHMENTS}
                            {ANTALL SIDER OG VEDLEGG}}

% Definition of variables
\heading{\EnglishNorsk{Test Report}{Prøverapport}}

% Section titles in sans serif
\RequirePackage{sectsty}
\allsectionsfont{\sffamily}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}
\newpagestyle{titlepage}[fancy]{%
  \fancyhead[l]{% FIXME Not sure why but \fancyhead[r] does not work as it should
    \hspace{0.7\textwidth}%
    \includegraphics[width=0.3\textwidth]{\@mainlogo}%
  }
  \fancyfoot[l]{%
    \color{sintefgray}%
    \sffamily%
    \textbf{\@institute}\newline
    \@department\newline
    \@date
  }
}
\newpagestyle{firstpage}[fancy]{%
  \fancyhead[l]{\includegraphics[width=0.2\textwidth]{\@mainlogo}}
  \fancyfoot[c]{%
    \sffamily%
    \ifbool{digitalsignature}{
      \@separator\newline%
      \begin{minipage}{0.45\textwidth}
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
    \hspace*{0.1\textwidth}% Halfway-align with box above
    \begin{scriptsize}%
    \begin{minipage}[c]{0.75\textwidth}
    \centering
    \EnglishNorsk{The report is the client's property and cannot be given to a
                  third party without the client’s written consent.\newline
                  The report shall not be reproduced except in full without the 
                  written approval of SINTEF.}
                 {Rapporten er oppdragsgivers eiendom og kan ikke uten
                  vedkommendes skriftlige tillatelse overlates til tredjepart.
                  Uten SINTEFs skriftlige godkjenning kan rapporten kun
                  reproduseres i sin helhet.}
    \end{minipage}%
    \end{scriptsize}%
    \hfill
    \thepage\ \EnglishNorsk{of}{av} \pageref{LastPage}
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
    \@labeltext \@reportnumberlabel\newline
    \@reportnumber
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

% Title page, recipient address and information colophon
\RequirePackage{setspace,sintefhistory,sintefattachments}
\newcommand{\frontmatter}{%
  \newgeometry{top=5cm,        bottom=3.5cm,
               left=5.2cm,     right=2cm,
               headheight=1cm, headsep=2cm}%
  \thispagestyle{titlepage}%
  \noindent%
  \colorbox{cyan}{\parbox{0.98\textwidth}{\textcolor{white}{\textbf{\@reportnumber\ - \@classification}}}}\\
  \hspace*{3mm}%
  \begin{minipage}[t]{13cm}
    {\fontsize{32}{32}\selectfont%
     \vspace{1.5ex}%
     \@heading\\
    }%
    \Huge       \vspace{2.5ex}\\\@title\\
    \normalsize \vspace{2ex}\\\@subtitle\\
                \vspace{2ex}\\\textbf{\@authorlabel}\\
                \@author
  \vspace{1ex}
  {\@titlefigure}
  \end{minipage}
  \hspace*{3mm}
  \addtocounter{page}{-1}%
    \ifbool{digitalsignature}{
      \newgeometry{top=3cm, bottom=5.5cm, left=2cm, right=2cm,
                   headheight=8mm, footskip=2.5ex}%
    }{
      \restoregeometry%
    }
  \thispagestyle{firstpage}%
  \noindent%
  \begin{minipage}[t][0.99\textheight]{0.25\textwidth}
    \flushleft{\@shortinfo}
    \vspace{2ex}
    \@keywordlabel:\\
    \@keywords
        
    \vfill
    \includegraphics[width=0.5\textwidth]{isoohsas}\\
    \vspace*{2mm}
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
    \begin{minipage}{0.3\textwidth}
      \@labeltext \@reportnumberlabel\\
      \@reportnumber
    \end{minipage}%
    \hfill
    \begin{minipage}{0.3\textwidth}
      \@labeltext \@versionlabel\\
      \@version
    \end{minipage}%
    \hfill
    \begin{minipage}{0.38\textwidth}
      \@labeltext \@datelabel\\
      \@date
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{\textwidth}
      \@labeltext \@Authorlabel\\
      \@author
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.6\textwidth}
      \@labeltext \@clientlabel\\
      \@client
    \end{minipage}%
    \hfill
    \begin{minipage}{0.38\textwidth}
      \@labeltext \@clientreflabel\\
      \@clientref
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.3\textwidth}
      \@labeltext \@projectlabel\\
      \@project
    \end{minipage}%
    \hfill
    \begin{minipage}{0.3\textwidth}
      \@labeltext \@classificationlabel\\
      \@classification
    \end{minipage}
    \hfill
    \begin{minipage}{0.38\textwidth}
      \@labeltext \@pageslabel\\
      \pageref{LastPage} \@attachmentpages
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.6\textwidth}
      \@labeltext \@testobjectlabel\\
      \@testobject
    \end{minipage}%
    \hfill
    \begin{minipage}{0.38\textwidth}
      \@labeltext \@datereceivedlabel\\
      \@datereceived
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{0.3\textwidth}
      \@labeltext \@testprogramlabel\\
      \@testprogram
    \end{minipage}%
    \hfill
    \begin{minipage}{0.3\textwidth}
      \@labeltext \@testlocationlabel\\
      \@testlocation
    \end{minipage}%
    \hfill
    \begin{minipage}{0.38\textwidth}
      \@labeltext \@testdatelabel\\
      \@testdate
    \end{minipage}\\
    \@separator\\
    \begin{minipage}{\textwidth}
      \@labeltext \@abstractlabel\\
      \@abstract

      \centering\footnotesize
      \EnglishNorsk{The test results relate only to the items tested.}
                   {Prøveresultatene gjelder kun de objekter som er prøvd.}
    \end{minipage}
    \@separator\\
    \ifbool{digitalsignature}{}{% Skip this section if true
      \begin{minipage}{0.49\textwidth}
        \@labeltext \@preparedlabel\\
        \@prepared
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
      \end{minipage}\\
      \@separator
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
