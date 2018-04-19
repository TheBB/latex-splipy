% Class for SINTEF subcontractor conditions with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefsubcontractor}
             [2013/12/11 A class to prepare subcontractor conditions for SINTEF]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}

% Set margins
\RequirePackage[margin=2.5cm]{geometry}

% Definition of variables
\newcommand*{\@subcontractor}
            {Set with \texttt{\textbackslash subcontractor\{\}}}
\newcommand*{\subcontractor}{\renewcommand*{\@subcontractor}}
\newcommand*{\@subcontractorno}
            {Set with \texttt{\textbackslash subcontractorno\{\}}}
\newcommand*{\subcontractorno}{\renewcommand*{\@subcontractorno}}

% Bold, poor man's small caps
\RequirePackage{sectsty}
\allsectionsfont{\bfseries\small\MakeUppercase}
% Add § character to sections
\renewcommand{\thesection}{§~\arabic{section}}

% Section commands
\newcommand{\scopesection}{\EnglishNorsk
  {\section{Nature and Scope of the Project}}
  {\section{Oppdragets art og omfang}}
}
\newcommand{\schedulesection}{\EnglishNorsk
  {\section{Time Schedule}}
  {\section{Varighet}}
}
\newcommand{\reportingsection}{\EnglishNorsk
  {\section{Reporting}}
  {\section{Rapportering}}
}
\newcommand{\budgetsection}{\EnglishNorsk
  {\section{Budget and Invoicing (Exclusive of VAT)}}
  {\section{Betaling (eks. MVA)}}
}
\newcommand{\supplementsection}{\EnglishNorsk
  {\section{Supplements to / Deviations from the General Conditions for Subcontractors to SINTEF}}
  {\section{Tillegg til / avvik fra generelle vilkår for underleverandører til SINTEF}}
}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{\scriptsize\@project \hfill
           \normalsize \thepage\ \EnglishNorsk{of}{av}
           \ltx@ifpackageloaded{hyperref}{\pageref*{LastPage}}{\pageref{LastPage}}}

\RequirePackage{sintefattachments,tabularx}
\newcommand{\frontmatter}{
  \begin{center}
    \LARGE\bfseries\textcolor{cyan}{\EnglishNorsk{%
      Special Conditions for Subcontractors to SINTEF
    }{%
      Spesielle vilkår for underleverandører til SINTEF
    }}\\
    \vspace{2ex}
    \large\mdseries\EnglishNorsk{between}{mellom}
  \end{center}
  \begin{tabularx}{\textwidth}{@{}Xl}
    \small\bfseries\@subcontractor &
    \small\bfseries\EnglishNorsk{ENTERPRISE NUMBER}{ORGANISASJONSNUMMER}
    \@subcontractorno\\
    \EnglishNorsk{hereinafter called Subcontractor}{nedenfor kalt Underleverandør}\\
    \\
    \small\bfseries\EnglishNorsk{AND}{OG}\\
    \\
    \small\bfseries\@institute &
    \small\bfseries\EnglishNorsk{ENTERPRISE NUMBER}{ORGANISASJONSNUMMER} \@VAT\\
    \EnglishNorsk{hereinafter called}{nedenfor kalt} SINTEF\\
  \end{tabularx}
  \vspace{1ex}\\
  \EnglishNorsk{on execution of a project, hereinafter called the Project, entitled:}
               {om utførelse av oppdrag, nedenfor kalt Oppdraget, med følgende tittel:}
  \vspace{1ex}\\
  \textbf{\@projectname}\\
  \textbf{\@project}
}

\newcommand{\backmatter}{%
  \EnglishNorsk{\section{Contract Documents}}{\section{Kontraktsdokumenter}}
  \EnglishNorsk{This contract consists of the following three parts:}
               {Denne kontrakt består av følgende tre deler:}
  \begin{enumerate}
    \item \EnglishNorsk{The present document, designated the Contract.}
                       {Dette dokument, betegnet Spesielle vilkår.}
    \item \EnglishNorsk{SINTEF's standard terms and conditions for research
                        and development projects.}
                       {Normalvilkår for forsknings- og utviklingsoppdrag.}
    \item \EnglishNorsk{Attached documents, as specified below.}
                       {Vedlagte, nedenfor spesifiserte dokumenter.}
  \end{enumerate}

  \attachmentsection

  \EnglishNorsk{In the event of any discrepancies in the provisions of said
                three documents, they shall take priority in the order in which
                they are listed above.}
               {Hvor det er avvik i bestemmelsene mellom nevnte tre deler,
                tillegges delene vekt i samme rekkefølge som de er nevnt foran.}

  \EnglishNorsk{This Contract has been signed in \textbf{2} copies, one for each
                party.}
               {Denne Kontrakt er underskrevet i \textbf{2} eksemplarer, hvorav
                hver av partene har fått ett.}

  \vspace{5ex}\noindent
  \begin{tabularx}{\textwidth}{@{}XX}
    \small\bfseries ~~For \@institute &
    \small\bfseries ~~For \EnglishNorsk{Subcontractor}{Underlverandør} \@subcontractor\\
    \\
    \\
    \hrulefill & \hrulefill\\
    \\
    ~~\EnglishNorsk{Date}{Dato} \@date & ~~\EnglishNorsk{Date}{Dato}
  \end{tabularx}

  \vspace{3ex}\noindent
  \EnglishNorsk{The last date stated shall be referred to as the effective date
                of the Contract.}
               {Den seneste dato refereres til som kontraktsdato.}
}
