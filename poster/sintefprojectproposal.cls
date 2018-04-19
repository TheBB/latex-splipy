% Class for SINTEF project proposals with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefprojectproposal}
              [2013/04/26 A class to prepare project proposals in SINTEF]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefprojectoffer}}
\ProcessOptions\relax

\LoadClass{sintefprojectoffer}

\renewcommand*{\@heading}{\EnglishNorsk{Project Proposal}{Prosjektforslag}}
\renewcommand*{\@offernumberlabel}
              {\EnglishNorsk{PROPOSAL NUMBER}{FORSLAGSNUMMER}}
\renewcommand*{\@offernumber}{Set with \texttt{\textbackslash proposal\{\}}}

\renewcommand{\@disclaimer}{\EnglishNorsk
 {All rights reserved to SINTEF. The present documentation and its basic
  ideas may not be used by anyone or be handed over to a third party without
  SINTEF's prior written approval. The proposal is not legally binding
  unless otherwise is agreed upon between the parties.}
 {Alle rettigheter tilhører SINTEF. Foreliggende materiale og dets
  idégrunnlag kan ikke benyttes av noen, eller overlates til tredje part, uten
  SINTEFs skriftlige forhåndssamtykke. Prosjektforslaget regnes ikke som
  bindende for SINTEF før nærmere avtale er inngått.}
}
