% Class for SINTEF contracts with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefcontract}[2013/12/11 A class to prepare contracts for SINTEF]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\LoadClass{sintefdoc}

% Set margins
\RequirePackage[margin=2.5cm]{geometry}

% Bold, poor man's small caps
\RequirePackage{sectsty,sinteflabels,sintefattachments}
\allsectionsfont{\bfseries\small\MakeUppercase}
% Add § character to sections
\renewcommand{\thesection}{§~\arabic{section}}

% Section commands
\newcommand{\scopesection}{\EnglishNorsk
  {\section{Nature and Scope of the Project}}
  {\section{Oppdragets art og omfang}}
}
\newcommand{\rightsection}{\EnglishNorsk
  {\section{Rights to the Results of the Project}}
  {\section{Rettigheter til resultater av oppdraget}}
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
  {\section{Supplements to / Deviations from the General Conditions for Research and Development Projects at SINTEF}}
  {\section{Tillegg / avvik fra SINTEFs normalvilkår for forsknings- og utviklingsoppdrag}}
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
    \LARGE\bfseries\textcolor{cyan}{\EnglishNorsk{Contract}{Kontrakt om oppdrag}}\\
    \vspace{1ex}
    \large\bfseries\EnglishNorsk{Special Conditions}{Spesielle vilkår}\\
    \large\mdseries\EnglishNorsk{between}{mellom}
  \end{center}
  \begin{tabularx}{\textwidth}{@{}Xl}
    \small\bfseries\@client & \small\bfseries\MakeUppercase{\@VATlabel} \@clientvat\\
    \EnglishNorsk{hereinafter called Client}{nedenfor kalt Oppdragsgiver}\\
    \\
    \small\bfseries\EnglishNorsk{AND}{OG}\\
    \\
    \small\bfseries\@institute & \small\bfseries\MakeUppercase{\@VATlabel} \@VAT\\
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
    \item \EnglishNorsk{SINTEF's standard terms and conditions for research and development projects.}
                       {Normalvilkår for forsknings- og utviklingsoppdrag.}
    \item \EnglishNorsk{Attached documents, as specified below.}
                       {Vedlagte, nedenfor spesifiserte dokumenter.}
  \end{enumerate}

  \attachmentsection

  \EnglishNorsk{In the event of any discrepancies in the provisions of said three documents,
                they shall take priority in the order in which they are listed above.}
               {Hvor det er avvik i bestemmelsene mellom nevnte tre deler, tillegges delene
                vekt i samme rekkefølge som de er nevnt foran.}

  \EnglishNorsk{This Contract has been signed in \textbf{2} copies, one for each party.}
               {Denne Kontrakt er underskrevet i \textbf{2} eksemplarer, hvorav hver av partene har fått ett.}

  \vspace{5ex}\noindent
  \begin{tabularx}{\textwidth}{XX}
    \small\bfseries ~~For \@institute & \small\bfseries ~~For \EnglishNorsk{Client}{Oppdragsgiver} \@client\\
    \\
    \\
    \hrulefill & \hrulefill\\
    \\
    ~~\EnglishNorsk{Date}{Dato} \@date & ~~\EnglishNorsk{Date}{Dato}
  \end{tabularx}

  \vspace{3ex}\noindent
  \EnglishNorsk{The last date stated shall be referred to as the effective date of the Contract.}
               {Den seneste dato refereres til som kontraktsdato.}
}
