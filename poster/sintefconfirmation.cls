% Class for SINTEF confirmations of orders with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefconfirmation}[2013/12/11 A class to prepare order confirmations for SINTEF]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}

% Set margins
\RequirePackage[margin=2.5cm]{geometry}

% Bold, poor man's small caps
\RequirePackage{sectsty}
\allsectionsfont{\bfseries\small\MakeUppercase}

% Section commands
\newcommand{\moneysection}{\EnglishNorsk
  {\section*{Price / Invoicing}}
  {\section*{Pris / Fakturering}}
}
\newcommand{\timesection}{\EnglishNorsk
  {\section*{Duration / Time of delivery}}
  {\section*{Varighet / Leveringstid}}
}
\newcommand{\specialsection}{\EnglishNorsk
  {\section*{Special Conditions}}
  {\section*{Særlige vilkår}}
}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{\scriptsize\@project \hfill
           \normalsize \thepage\ \EnglishNorsk{of}{av} \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}}

\RequirePackage{tabularx}
\newcommand{\frontmatter}{
  \begin{center}
    \LARGE\bfseries\textcolor{cyan}{\EnglishNorsk{Confirmation of Order}{Oppdragsbekreftelse}}\\
  \end{center}

  \vspace{1ex}\noindent
  \EnglishNorsk{We hereby confirm to execute the following project having reference to }
               {Vi bekrefter herved følgende oppdrag i henhold til }
  \@orderreference

  \vspace{2ex}\noindent
  {\small\bfseries\EnglishNorsk{DATED:}{DATERT:}} \@orderdated
  \hspace{2em}
  {\small\bfseries\EnglishNorsk{BY:}{VED:}} \@orderby

  \vspace{2ex}\noindent
  {\small\bfseries\EnglishNorsk{CONCERNING:}{VEDRØRENDE:}} \@projectname\\
  \@abstract

  \vspace{2ex}\noindent
  \begin{minipage}{0.49\textwidth}
    {\small\bfseries\EnglishNorsk{DATE}{DATO}}\\
    \@date
  \end{minipage}
  \hfill
  \begin{minipage}{0.5\textwidth}
    {\small\bfseries\EnglishNorsk{PROJECT NUMBER}{PROSJEKTNUMMER}}\\
    \@project
  \end{minipage}

  \vspace{5ex}\noindent
}

\newcommand{\backmatter}{%
  \vspace{5ex}
  \EnglishNorsk{The Project will be executed in compliance with the SINTEF's
                General Conditions smaller projects.
                These Conditions have been set forth on the reverse side of this
                Confirmation of Order.

                This Contract has been signed in \emph{two} originals, one for
                the Client and one for SINTEF.}
               {Oppdraget gjennomføres i henhold til SINTEFs «Generelle
                vilkår for mindre oppdrag».
                Disse er gjengitt i vedlegg.

                Denne oppdragsbekreftelsen er undertegnet i \emph{to}
                eksemplarer, hvorav hver av partene har fått ett.}

  \vspace{5ex}\noindent
  \begin{tabularx}{\textwidth}{XX}
    ~~For \@institute & ~~For \EnglishNorsk{client}{oppdragsgiver} \@client\\
    \\
    \\
    \hrulefill & \hrulefill\\
    \\
    ~~\EnglishNorsk{Date}{Dato} \@date & ~~\EnglishNorsk{Date}{Dato}\\
    \\
    ~~\EnglishNorsk{Contact person:}{Kontaktperson:} \@author &
    ~~\EnglishNorsk{Contact person:}{Kontaktperson:} \@clientref
  \end{tabularx}

}
