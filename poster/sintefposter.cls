% Poster class for SINTEF with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefposter}[2017/06/22 Poster class for SINTEF]

% Language options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sciposter}}
\ProcessOptions\relax

\LoadClass[36pt,plainsections]{sciposter}

% Load SINTEF-specific graphic elements
\RequirePackage{sintefcolor}

% Set font to Calibri, or Times clone for serif
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{TeX Gyre Termes}

% The default sans-serif font is Calibri, but it is not available on Linux.
% As an alternative, we use Carlito, a metric-compatible, freely available
% clone developed by Google:
\setsansfont{Carlito}
\renewcommand{\familydefault}{\sfdefault}

\definecolor{mainCol}{named}{white}
\definecolor{BoxCol}{named}{sinteflightgray}
\definecolor{TextCol}{named}{sintefblue}
\definecolor{SectionCol}{named}{sintefblue}

% Sets color as well as size
\renewcommand{\titlesize}{\huge\color{sintefblue}}

\leftlogo{Sintef_logo_blue}
