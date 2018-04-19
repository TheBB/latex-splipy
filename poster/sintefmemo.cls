% Class for SINTEF memos with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefmemo}[2013/10/02 A class to prepare memos in the SINTEF style]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\PassOptionsToPackage{table}{xcolor}
\LoadClass{sintefdoc}
\renewcommand{\familydefault}{\rmdefault}

% Set margins
\RequirePackage[top=3.1cm,      bottom=15ex,
                left=2.3cm,     right=2.3cm,
                headheight=1cm, footskip=2.5ex]{geometry}

\heading{\EnglishNorsk{Memo}{Notat}}
\renewcommand*{\@authorlabel}
              {\EnglishNorsk{PERSON RESPONSIBLE / AUTHOR}
                            {SAKSBEHANDLER / FORFATTER}}

% Section titles in sans serif
\RequirePackage{sectsty}
\allsectionsfont{\sffamily}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}
\newpagestyle{firstpage}[fancy]{%
  \fancyhead[l]{\includegraphics[width=0.25\textwidth]{\@mainlogo}}
  \fancyfoot[c]{%
    \sffamily%
    \color{sintefgray}
    \@separator\newline
    \begin{minipage}[c]{0.9\textwidth}
      \centering%
      \scriptsize%
	  \bfseries%
      \EnglishNorsk{%
        This memo contains project information and preliminary results
        as a basis for final reports.\newline
        SINTEF accepts no responsibility for this memo, and no part of it
        may be copied.}
       {Dette notatet inneholder prosjektinformasjon og foreløpige resultater
        som underlag for endelig prosjektrapport.\newline
        SINTEF hefter ikke for innholdet, og tar forbehold mot
        gjengivelse.}
    \end{minipage}%
    \hfill
    \thepage\ \EnglishNorsk{of}{av}
    \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}
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
    \scriptsize\bfseries%
    \hspace*{\tabcolsep}\@projectlabel\newline
    \hspace*{\tabcolsep}\@project
  \end{minipage}%
  \hfill
  \thepage\ \EnglishNorsk{of}{av}
  \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}
  ~~\newline
  \@separator
}

\RequirePackage{xparse}
\newcommand*{\@distributiontable}{}
\newcommand*{\ifanyoffouris}[5]{ \ifboolexpr{
  test {\ifstrequal{#1}{#5}} or
  test {\ifstrequal{#2}{#5}} or
  test {\ifstrequal{#3}{#5}} or
  test {\ifstrequal{#4}{#5}}
} }
\DeclareDocumentCommand \recipient { >{\SplitArgument{3}{,}} O{} m }{
  \makeatletter
    \g@addto@macro \@distributiontable {
        \small #2 & \ifanyoffouris #1 {attention}  {\small$\bullet$}{}
                  & \ifanyoffouris #1 {comments}   {\small$\bullet$}{}
                  & \ifanyoffouris #1 {information}{\small$\bullet$}{}
                  & \ifanyoffouris #1 {agreed}     {\small$\bullet$}{}\\
    }
  \makeatother
}

% Recipient address and information colophon
\RequirePackage{colortbl,tabularx,setspace,rotating}

\newcommand{\frontmatter}{%
  \thispagestyle{firstpage}%
  \sffamily%
  \noindent%
  \begin{minipage}[b]{0.7\textwidth}
    \setlength{\parskip}{2ex}%
    \Huge \@heading

    \huge\textbf \@title
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
  \begin{tabularx}{\textwidth}{Xcccc}
  \rowcolor{white} \parbox{\linewidth}{{\@labeltext \@authorlabel}\\\@author}
    & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@attentionlabel}\end{sideways}}
    & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@commentslabel}\end{sideways}}
    & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@informationlabel}\end{sideways}}
    & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@agreedlabel}\end{sideways}}\\
    \rowcolor{white} \multicolumn{5}{@{}c@{}}{\@separator}\\
    \rowcolor{white} \@labeltext \@distributionlabel\\
    \@distributiontable
  \end{tabularx}
  \rowcolors{1}{}{} % Back to normal
  \@separator\\
  \begin{minipage}{0.45\textwidth}
    \hspace*{\tabcolsep}\@labeltext \@projectlabel\\
    \hspace*{\tabcolsep}\small\@project
  \end{minipage}
  \hfill
  \begin{minipage}{0.3\textwidth}
    \@labeltext \@datelabel\\
    \small\@date
  \end{minipage}
  \begin{minipage}{0.2\textwidth}
    \@labeltext \@classificationlabel\\
    \small\@classification
  \end{minipage}\\
  \@separator

  \rmfamily % Plain text is in serif font
  \noindent
}
