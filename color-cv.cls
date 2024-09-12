% color-cv.cls
%
% Author: Wuqiong Zhao (me@wqzhao.org)
\NeedsTeXFormat {LaTeX2e}
\RequirePackage {l3keys2e}
\ProvidesExplClass {color-cv}
  {2024/09/12} {0.1} {Class for Colorful CV}

\str_const:Nn \c__color_cv_base_class_str { article }

\keys_define:nn { color-cv }
  {
    , font .tl_set:N   = \l__color_cv_font_tl
    , font .initial:n  = { libertine }
    , paper .tl_set:N  = \l__color_cv_paper_paper_tl
    , paper .initial:n = { letter }
    , unknown .code:n  =
        {
          \iow_term:x
            {
              Passing~option~\CurrentOption \c_space_tl to~
              \str_use:N \c__color_cv_base_class_str
            }
          \PassOptionsToClass { \CurrentOption } { \c__color_cv_base_class_str }
        }
  }
\ProcessKeysOptions { color-cv }
\LoadClass { \c__color_cv_base_class_str }

%% Page Settings
\RequirePackage { geometry }
\geometry
  {
    , margin = 1.5cm
    , top = 2.0cm
    , \tl_use:N \l__color_cv_paper_paper_tl paper
    , headheight = 12pt
    , headsep = 15pt
  }

%% Font Settings
\tl_if_empty:NF { \l__color_cv_font_tl }
  { \RequirePackage { \tl_use:N \l__color_cv_font_tl } }
\RequirePackage { fontspec }
\setmonofont [ Scale=MatchLowercase ] { inconsolata }

%% Maths Environment
\RequirePackage { mathtools }
\RequirePackage { amssymb }

%% Figure Environemts
\RequirePackage { graphicx }
\graphicspath { { ./fig } }

%% Colors
\RequirePackage [ dvipsnames ] { xcolor }
% https://brand.ucsd.edu/visual-brand/color/
\definecolor { UCSDnavy    } { HTML } { 182B49 }
\definecolor { UCSDblue    } { HTML } { 00629B }
\definecolor { UCSDmagenta } { HTML } { D462AD }

%% Setting Information
\tl_new:N \l_color_cv_name_tl
\tl_new:N \l_color_cv_email_tl
\tl_new:N \l_color_cv_website_tl
\tl_new:N \l_color_cv_linkedin_tl
\tl_new:N \l_color_cv_photo_tl
\tl_new:N \l_color_cv_brief_tl
\NewDocumentCommand \name { m } { \tl_set:Nn \l_color_cv_name_tl { #1 } }
\NewDocumentCommand \email { m } { \tl_set:Nn \l_color_cv_email_tl { #1 } }
\NewDocumentCommand \website { m } { \tl_set:Nn \l_color_cv_website_tl { #1 } }
\NewDocumentCommand \linkedin { m } { \tl_set:Nn \l_color_cv_linkedin_tl { #1 } }
\NewDocumentCommand \photo { m } { \tl_set:Nn \l_color_cv_photo_tl { #1 } }
\NewDocumentCommand \brief { m } { \tl_set:Nn \l_color_cv_brief_tl { #1 } }

\renewcommand { \title } [ 1 ] { \name { #1 } }

%% Title Settings
\RequirePackage{ graphicx }
\RequirePackage { tabularx }
\renewcommand { \maketitle }
  {
    \tl_if_empty:NTF { \l_color_cv_photo_tl }
      {
        \begin{center}
          {
            \Huge \textsf{\textsc{\tl_use:N \l_color_cv_name_tl}}
          }
          \par\vspace{10pt}
          \tl_if_empty:NF { \l_color_cv_brief_tl } { \textcolor{gray}{\sffamily \tl_use:N \l_color_cv_brief_tl} \par }
          E-Mail:~\href{mailto:\tl_use:N \l_color_cv_email_tl}{\texttt{\tl_use:N \l_color_cv_email_tl}}
          \hspace{5pt}\, $\blacklozenge$ \hspace{5pt}
          Website:~\url{\tl_use:N \l_color_cv_website_tl}
          \tl_if_empty:NF { \l_color_cv_linkedin_tl } { \hspace{5pt}\, $\blacklozenge$ \hspace{5pt} LinkedIn:~\href{https \c_colon_str //www.linkedin.com/in/\l_color_cv_linkedin_tl}{\texttt{in / \l_color_cv_linkedin_tl}} }
          \vspace{10pt}
        \end{center}
      }
      {
        \noindent
        \renewcommand{\tabcolsep}{0pt}
        \begin{tabularx}{\textwidth}{Xr}
          \Huge \textsf{\textsc{\l_color_cv_name_tl}} & \\ \\
          \tl_if_empty:NF { \l_color_cv_brief_tl } { \textcolor{gray}{\sffamily\l_color_cv_brief_tl} \\ }
          E-Mail:~\href{mailto:\l_color_cv_email_tl}{\texttt{\l_color_cv_email_tl}} \\
          Website:~\url{\l_color_cv_website_tl} \\
          \tl_if_empty:NF { \l_color_cv_linkedin_tl } { LinkedIn:~\href{https \c_colon_str //www.linkedin.com/in/\l_color_cv_linkedin_tl}{\texttt{in / \l_color_cv_linkedin_tl}} } &
          \smash{\includegraphics[height=30mm]{\l_color_cv_photo_tl}}
        \end{tabularx}
      }

    % Set Up Document Properties
    \hypersetup
      {
        , pdfauthor  = { \l_color_cv_name_tl }
        , pdftitle   = { \l_color_cv_name_tl \ CV }
        , pdfsubject = { CV }
        , pdfcreator = { LaTeX~with~color-cv~Class }
      }

    \thispagestyle{empty}
  }

%% Header Settings
\RequirePackage { fancyhdr }
\pagestyle { fancy }
\cfoot {  }
\fancyhf { }
\renewcommand { \headrulewidth }{ 0pt }
\fancyhead [L] { \textsf{\color{gray} \tl_use:N \l_color_cv_name_tl} }
\fancyhead [R] { \textsf{\color{gray} \thepage} }

%% Item
\RequirePackage { enumitem }
\setlist [itemize] { label = \textcolor{UCSDblue}{$\blacktriangleright$} }
\setlist [enumerate] { label = \textcolor{UCSDblue}{\textbf{\arabic*}.} }
\setlist [enumerate, 2] { label = \textcolor{UCSDblue}{\textbf{\roman*})} }

%% Utilities
\RequirePackage { tikz }
\ExplSyntaxOff
\usetikzlibrary{fadings, calc}
\newcommand{\ExternalLinkSymbol}{%
  \tikz[x=1.2ex, y=1.2ex, baseline=-0.05ex]{% 
    \begin{scope}[x=1ex, y=1ex]
      \clip (-0.1,-0.1) 
        --++ (-0, 1.2) 
        --++ (0.6, 0) 
        --++ (0, -0.6) 
        --++ (0.6, 0) 
        --++ (0, -1);
      \path[draw, 
        line width = 0.5, 
        rounded corners=0.5] 
        (0,0) rectangle (1,1);
    \end{scope}
    \path[draw, line width = 0.5] (0.5, 0.5) 
      -- (1, 1);
    \path[draw, line width = 0.5] (0.6, 1) 
      -- (1, 1) -- (1, 0.6);
    }
  }
\newcommand{\tikzrule}[3][]{\tikz{\fill[#1] (0,0) rectangle (#2,#3);}}
\ExplSyntaxOn
\NewDocumentCommand \link { m m }
  {
    \href { #1 } { \sffamily [ #2 ~ \ExternalLinkSymbol \! ] }
  }

%% Title
\RequirePackage { titlesec }
\newcommand { \ThemeColor     } { UCSDblue }
\newcommand { \ThemeColorDark } { UCSDnavy }
\ExplSyntaxOff
\titleformat{\section}
  {\sffamily\bfseries\color{\ThemeColorDark}}{\color{\ThemeColor}\rule[-.45em]{.5em}{1.4em}}{.3em}{\large}[{\vspace*{-0.9em}\tikzrule[\ThemeColor, path fading=east]{\textwidth}{.1em}}\vspace*{-.5em}]
\ExplSyntaxOn

%% Other Utilities
\NewDocumentCommand \Textbf { +m }
  {
    \textbf { \color{\ThemeColorDark} #1 }
  }

%% Hyperref
\RequirePackage { hyperref }
\hypersetup
  {
    , colorlinks = true
    , urlcolor   = \ThemeColor
    , linkcolor  = purple
    , citecolor  = red
  }

\endinput
