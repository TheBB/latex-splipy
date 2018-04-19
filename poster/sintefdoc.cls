% Generic class for SINTEF documents with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefdoc}[2016/02/09 A generic class for SINTEF documents]

\RequirePackage{etoolbox}

% Whether to change the front page layout for digital signatures;
% defaults to false
\providebool{digitalsignature}
\boolfalse{digitalsignature}

% Document language is by default English (British).
\providebool{english}
\booltrue{english}

% Whether to include a field for ISBN where relevant (only public reports)
% defaults to false
\providebool{useISBN}
\boolfalse{useISBN}

%%% BEGIN Options section; no \RequirePackage or \LoadClass in here %%%

% Classification options, internal is default as per SINTEF policy
\newcommand*{\@classification}{\EnglishNorsk{Internal}{Intern}}
\DeclareOption{unrestricted} {%
  \renewcommand*{\@classification}{\EnglishNorsk{Unrestricted}{Åpen}}%
  \booltrue{useISBN}
}
\DeclareOption{internal}{%
  \renewcommand*{\@classification}{\EnglishNorsk{Internal}{Intern}}%
}
\DeclareOption{restricted}{%
  \renewcommand*{\@classification}{\EnglishNorsk{Restricted}{Fortrolig}}%
}
\DeclareOption{confidential}{%
  \renewcommand*{\@classification}{\EnglishNorsk{Confidential}{Strengt fortrolig}}%
}
% Language options
\DeclareOption{english}  {\booltrue {english}}
\DeclareOption{engelsk}  {\booltrue {english}}
\DeclareOption{norsk}    {\boolfalse{english}}
\DeclareOption{norwegian}{\boolfalse{english}}
\DeclareOption{digital}  {\booltrue{digitalsignature}}
\DeclareOption{manual}   {\boolfalse{digitalsignature}}
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%% END Options section %%%

\LoadClass[a4paper,11pt]{article}

\RequirePackage{polyglossia}
\ifbool{english}{
    % Default variant for SINTEF is British English
    \setmainlanguage[variant=british]{english}
    \setotherlanguage{norsk}
    % Polyglossia is in the bad habit of messing with font families
    \sffamilylatin
}{
    \setmainlanguage{norsk}
    \setotherlanguage[variant=british]{english}
    % Polyglossia is in the bad habit of messing with font families
    \sffamilylatin
}

% Use a prettier date format, and adapt according to language.
% Must be loaded after a language is set by Polyglossia.
\RequirePackage[useregional]{datetime2}

% \and function for multiple authors
\renewcommand{\and}{\\*}

% Sectsty is used in many child classes, though not sintefdoc.
% We require it here anyway because it should come before
% font operations, which often redefine \underbar and makes sectsty output
% irritating warnings.
\RequirePackage{sectsty}

% We are not using AMS packages here, but they must be loaded before polyglossia
% calls Xunicode and causes conflicts. Furthermore, unicode-math should
% also be loaded "after any other maths- or font-related package".
% Amsmath and amssymb are very important packages for scientific usage,
% so we are willing to include them always.
\RequirePackage{amsmath,amssymb}
\RequirePackage{unicode-math}
\unimathsetup{math-style=ISO,bold-style=ISO, % ISO standards for italic & bold
              nabla=upright, partial=upright, % Operators should be upright
}

% Make Polyglossia shut up when selecting norwegian versions
\RequirePackage{silence}
\WarningFilter{polyglossia}{gloss-norsk.ldf is already loaded!}

% Command to provide alternative translations in English and Norwegian
\newcommand{\EnglishNorsk}[2]{\ifbool{english}{#1}{#2}}

% Define the main logo
\RequirePackage{graphicx}
\newcommand{\@mainlogo}{Sintef_logo_blue}
\newcommand{\@website}{www.sintef.no}

% Use sans font by default
\RequirePackage{sintefcolor}
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
% If we use font names, the compiler might not find the font, esp. in Linux,
% see http://tex.stackexchange.com/questions/132906/.
\setmainfont[
	Extension = .otf,
	UprightFont = *-regular,
	BoldFont = *-bold,
	ItalicFont = *-italic,
	BoldItalicFont = *-bolditalic
]{xits}
% math font using unicode-math
\setmathfont[
	Extension = .otf,
	BoldFont = *bold
]{xits-math}
% The default sans-serif font is Calibri, but it is not available on Linux.
% As an alternative, we use Carlito, a metric-compatible, freely available
% clone developed by Google:
\IfFontExistsTF{Calibri}
	{\setsansfont{Calibri}}
	{\IfFontExistsTF{Carlito}
		{\PackageWarning{sintefdoc}{Using Carlito font instead of Calibri}\setsansfont{Carlito}}
		{\PackageError{sintefdoc}{SINTeX needs Calibri or Carlito font}{See sintefdoc.pdf}}
	}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{sinteflabels}
\InputIfFileExists{sintefconfig}{}{%
  \ClassError{sintefdoc}{%
  The sintefconfig.tex file is missing.\MessageBreak
  You can generate it by double-clicking sintefconfig.js.
  }{%
  The sintefconfig.tex file contains various information\MessageBreak
  about you and your department, including phone numbers,\MessageBreak
  addresses and the like.\MessageBreak
  \space Double-clicking sintefconfig.js in a SINTEF Windows PC\MessageBreak
  generates sintefconfig.tex just as it should be for you.
  }%
}

% The information box, longer with location (physical address)
\newcommand{\@longinfo}[1][sintefblue]{%
  \noindent%
  \scriptsize%
  \raggedright%
  \setlength{\parskip}{1ex}%
  \color{#1}%
  \textbf{\boolfalse{english}\@institute}
  \ifbool{english}{\\\@institute}{}

  \@addresslabel:\\
  \@address

  \@locationlabel:\\
  \@location

  \@website
  
  \@VATlabel: \@VAT

}

% The information box, shorter.
\newcommand{\@shortinfo}[1][sintefblue]{%
  \noindent%
  \scriptsize%
  \raggedright%
  \setlength{\parskip}{1ex}%
  \color{#1}%
  \textbf{\boolfalse{english}\@institute}
  \ifbool{english}{\\\@institute}{}

  \@addresslabel:\\\@address

  \@website

  \@VATlabel: \@VAT

}

% This separating line is used across several documents,
% for example in footers and title pages.
\RequirePackage{sintefcolor}
\newcommand{\@separator}{%
  % To make sure we have spacing on both sides, make an invisible rule, 2X tall
  \rule{0ex}{2ex}%
   % Place the dashed rule 1X high
  \textcolor{sintefgray}{\rule[1ex]{\textwidth}{0.25pt}}%
}

% Used in many classes to check if hyperref is loaded.
% TODO: should be moved in lower classes, not required here.
\RequirePackage{ltxcmds}
