%%
%% This is file `uftpibic.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uftpibic.dtx  (with options: `class')
%% 
%% Copyright (C) 2026 by UFT
%% 
%% Este arquivo e uma versao gerada a partir do codigo-fonte original.
%% Classe personalizada para projetos de pesquisa PIBIC e PIVIC da UFT.
%% 
\def\filename{uftpibic.dtx}
\def\fileversion{v2.0.2}
\def\filedate{2026/29/03}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass {uftpibic} [\filedate\ \fileversion\ Classe personalizada para projetos de pesquisa PIBIC e PIVIC da UFT]

\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass[oneside,\@@ptsize]{book}

\RequirePackage{enumitem}
\RequirePackage{indentfirst}
\RequirePackage[sharp]{easylist}
\RequirePackage[normalem]{ulem}
\RequirePackage[T1]{fontenc}
\RequirePackage[english,brazil]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{hyphenat}
\RequirePackage{xcolor}

\definecolor{azul}{RGB}{000,074,128}
\definecolor{verde}{RGB}{000,133,119}
\definecolor{amarelo}{RGB}{253,185,019}
\definecolor{cinza}{RGB}{102,102,102}
\definecolor{cinza2}{RGB}{211,211,211}
\definecolor{preto}{RGB}{0,0,0}
\definecolor{branco}{RGB}{255,255,255}
\definecolor{cortexto}{RGB}{255,255,255}
\definecolor{cor}{RGB}{102,102,102}

\RequirePackage{geometry}

\geometry{
    a4paper,
    top=5cm,
    bottom=2cm,
    left=2cm,
    right=2cm,
    headheight=4cm,
    headsep=1.75cm
}

\RequirePackage{pdfpages}
\RequirePackage{wallpaper}
\RequirePackage{graphicx}
\RequirePackage{ae}
\RequirePackage{booktabs}
\RequirePackage{setspace}
\RequirePackage{ltxcmds}
\RequirePackage{etoolbox}
\RequirePackage{lastpage}
\RequirePackage{eqparbox}
\RequirePackage{amsfonts,amsthm,amsopn,amssymb,latexsym}
\RequirePackage[labelfont=bf,textfont=bf,labelsep=endash, singlelinecheck=false,justification=centering]{caption}
\RequirePackage[pdftex,unicode=true,plainpages=false,pdfpagelabels,pagebackref,colorlinks=true,citecolor=black,linkcolor=black,urlcolor=blue,filecolor=black,bookmarksopen=true]{hyperref}
\RequirePackage[all]{hypcap}
\RequirePackage[nottoc,numbib]{tocbibind}
\RequirePackage{helvet}
\RequirePackage{lineno}
\RequirePackage{ifthen}
\RequirePackage{tabularx}
\RequirePackage[section]{placeins}
\RequirePackage[titles]{tocloft}
\RequirePackage[pagestyles]{titlesec}
\RequirePackage{chngcntr}

\counterwithout{equation}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

\renewcommand{\cftfigpresnum}{Figura }
\renewcommand{\cftfignumwidth}{5em}
\renewcommand{\cftfigaftersnum}{      -- }

\renewcommand{\cfttabpresnum}{Tabela }
\renewcommand{\cfttabnumwidth}{5em}
\renewcommand{\cfttabaftersnum}{      -- }

\newcommand{\mybox}[1]{%
    \par\noindent\colorbox{cor}{\parbox{\textwidth-2\fboxsep\relax}{\color{cortexto}\centering #1}}%
}

\renewcommand\title[1]{\global\def\local@title{#1}}

\newcommand\address[1]{\global\def\local@address{#1}}
\newcommand\cep[1]{\global\def\local@cep{#1}}
\newcommand\phone[1]{\global\def\local@phone{#1}}
\newcommand\mail[1]{\global\def\local@mail{#1}}
\newcommand\department[1]{\global\def\local@department{#1}}
\newcommand\city[1]{\global\def\local@city{#1}}
\newcommand\local[1]{\global\def\local@local{#1}}
\newcommand\area[1]{\global\def\local@area{#1}}

\newcounter{keywords}
\newcommand\keyword[1]{%
    \global\@namedef{uftKeyword:\expandafter\the\c@keywords}{#1}%
    \global\addtocounter{keywords}{1}%
}

\newcounter{equipe}
\newcommand\equipeexecutora[2]{%
    \global\@namedef{uftNome:\expandafter\the\c@equipe}{#1}%
    \global\@namedef{uftCategoria:\expandafter\the\c@equipe}{#2}%
    \global\addtocounter{equipe}{1}%
}

\newcommand\local@advisorstring{Orientador}
\newcommand\local@coadvisorstring{Coorientador}
\newcommand\foreign@advisorstring{Advisor}

\newcount\@advisor\@advisor0
\newcommand\advisor[4]{%
    \global\@namedef{uftAdvisorTitle:\expandafter\the\@advisor}{#1}%
    \global\@namedef{uftAdvisorName:\expandafter\the\@advisor}{#2}%
    \global\@namedef{uftAdvisorSurname:\expandafter\the\@advisor}{#3}%
    \global\@namedef{uftAdvisorDegree:\expandafter\the\@advisor}{#4}%
    \global\advance\@advisor by 1
    \ifnum\@advisor>1
        \renewcommand\local@coadvisorstring{Coorientador}
        \renewcommand\foreign@advisorstring{Advisors}
    \fi
}

\renewcommand\maketitle{
    \newpage
    \pagestyle{plain}
    \setstretch{1}\selectfont
    \begin{center}
        \mybox{\MakeUppercase{\bf\local@title}}
    \end{center}

    {\bf Nome do Aluno}: \@authname\ \@authsurn \par
    {\bf Curso}: \local@department \par

    \nohyphens{%
        \count1=0
        \@whilenum \count1<\@advisor \do{%
            \ifcase\count1
                {\bf\local@advisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \
                \csname uftAdvisorName:\the\count1 \endcsname \
                \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
            \else
                {\bf\local@coadvisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \
                \csname uftAdvisorName:\the\count1 \endcsname \
                \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
            \fi
            \advance\count1 by 1%
        } \par
    }

    {\bf Palavras-chave}: \count1=0 \count2=1
    \@whilenum \count1<\value{keywords} \do {%
        \ifnum\count2=\value{keywords}
            \csname uftKeyword:\the\count1 \endcsname.
        \else
            \csname uftKeyword:\the\count1 \endcsname,
        \fi
        \advance\count1 by 1
        \advance\count2 by 1%
    }\par
    \setstretch{1.5}\selectfont
}

\newcommand{\colorsection}[2]{%
    \ifcase#1
        \colorbox{cor}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{cortexto}\MakeUppercase{#2}}}
    \else
        \colorbox{cor}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{cortexto}\centering\MakeUppercase{#2}}}
    \fi
}

\renewcommand{\thechapter}{\arabic{chapter}}
\titleformat{\chapter}{\bf}{}{-5pt}{\colorsection\thechapter}
\titlespacing*{\chapter}{0pt}{-20pt}{\baselineskip}

\newcommand{\colorsectionss}[2]{%
    \colorbox{cor}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{cortexto} #1~--~#2}}%
}

\titleformat{\section}[display]{\bf}{}{-5pt}{\colorsectionss\thesection}
\titlespacing*{\section}{0pt}{0pt}{\baselineskip}

\renewpagestyle{plain}{%
    \sethead{}{
        \noindent
        \begin{minipage}{.85\textwidth}
            \begin{minipage}{.1\textwidth}
                \includegraphics[scale=.2]{logos/Caninde}\vspace{-2cm}
            \end{minipage}
            \begin{flushright}\renewcommand{\familydefault}{\sfdefault}\setstretch{1.5}\normalfont
                UNIVERSIDADE FEDERAL DO {\bf TOCANTINS} \vspace{-.4\baselineskip} \\
                PRÓ-REITORIA DE {\bf PESQUISA E PÓS-GRADUAÇÃO} \vspace{-.4\baselineskip} \\
                COORDENAÇÃO DE {\bf INICIAÇÃO CIENTÍFICA} \vspace{-.4\baselineskip}\\
                \noindent\makebox[\linewidth]{\rule{\textwidth}{.5pt}}\vspace{-.4\baselineskip}\\
                \footnotesize\fontfamily{phv}\fontseries{mc}\selectfont
                \local@address\ | \local@cep\ | \local@city /TO \vspace{-.4\baselineskip} \\
                \local@phone\ | www.uft.edu.br | \local@mail
            \end{flushright}
        \end{minipage}
        \begin{minipage}{.18\textwidth}
            \centering
            \includegraphics[scale=.3]{logos/logouft}
        \end{minipage}
    }{}
    \setfoot{}{}{\thepage}%
}

\AtEndDocument{\thispagestyle{plain}}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

\setlength{\parindent}{0cm}
\setstretch{1.5}\selectfont

\def\l@chapter#1#2{%
    \pagebreak[3]
    \vskip 0.0em plus 0pt
    \@tempdima .65cm
    \begingroup
        \def\numberline##1{\hb@xt@\@tempdima{##1~--\hfil}}
        \parindent \z@ \rightskip \@pnumwidth
        \bfseries
        \leavevmode
        \uppercase{#1}\hfil \cftdotfill{\cftdotsep} \hbox to\@pnumwidth{\hss #2}\medskip\par
    \endgroup
}

\renewcommand\author[2]{%
    \global\def\@authname{#1}
    \global\def\@authsurn{#2}
}

\DeclareOption{report}{
    \addto\captionsbrazil{\renewcommand{\bibname}{Bibliografia}}
    \newgeometry{top=5cm,bottom=3cm,left=2cm,right=2cm,headsep=3.2cm}
    \colorlet{cor}{branco}
    \colorlet{cortexto}{preto}

    \renewpagestyle{plain}{%
        \sethead{}{
            \begin{minipage}{.85\textwidth}
                \begin{minipage}{.1\textwidth}
                    \includegraphics[scale=.2]{logos/Caninde}\vspace{-1.5cm}
                \end{minipage}
                \begin{flushright}\renewcommand{\familydefault}{\sfdefault}\setstretch{1.5}\normalfont
                    UNIVERSIDADE FEDERAL DO TOCANTINS \vspace{-.4\baselineskip} \\
                    PRÓ-REITORIA DE PESQUISA E PÓS-GRADUAÇÃO \vspace{-.4\baselineskip} \\
                    PROGRAMA INSTITUCIONAL DE BOLSAS DE INICIAÇÃO CIENTÍFICA \vspace{-.6\baselineskip}\\
                    \noindent\makebox[\linewidth]{\rule{\textwidth}{.5pt}}\vspace{-.4\baselineskip}\\
                    \footnotesize\fontfamily{phv}\fontseries{mc}\selectfont
                    \local@address\ | \local@cep\ | \local@city /TO \vspace{-.4\baselineskip} \\
                    \local@phone\ | www.uft.edu.br | \local@mail
                \end{flushright}
            \end{minipage}
            \begin{minipage}{.18\textwidth}
                \centering
                \includegraphics[scale=.3]{logos/logouft}
            \end{minipage}
        }{}
        \setfoot{}{}{%
            \begin{minipage}{.8\textwidth}
                \begin{flushright}
                    \thepage \\
                    \parbox{0.15\textwidth}{\includegraphics[scale=.2]{logos/cnpq}}
                    \parbox{-0.2\textwidth}{\includegraphics[scale=.12]{logos/logouft}}
                \end{flushright}
            \end{minipage}%
        }%
    }

    \renewcommand\maketitle{
        \newpage
        \thispagestyle{plain}
        \noindent
        \vspace{5pt}
        \setstretch{1}\selectfont
        \begin{center}
            \mybox{\large\MakeUppercase{\bf\local@title}}
        \end{center}
        \vspace{15pt}
        \begin{flushright}
            \footnotesize
            \@authname\ \@authsurn \par
            \nohyphens{%
                \count1=0
                \@whilenum \count1<\@advisor \do{%
                    \ifcase\count1
                        \csname uftAdvisorDegree:\the\count1 \endcsname \
                        \csname uftAdvisorName:\the\count1 \endcsname \
                        \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
                    \else
                        \csname uftAdvisorDegree:\the\count1 \endcsname \
                        \csname uftAdvisorName:\the\count1 \endcsname \
                        \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
                    \fi
                    \advance\count1 by 1%
                } \par
            }
        \end{flushright}
        \vspace{15pt}
        {\bf GRANDE ÁREA DO CONHECIMENTO}: \local@area \par
        \vspace{15pt}
        \setstretch{1}\selectfont
        \normalsize
        {\bf Palavras-chave}: \count1=0 \count2=1
        \@whilenum \count1<\value{keywords} \do {%
            \ifnum\count2=\value{keywords}
                \csname uftKeyword:\the\count1 \endcsname.
            \else
                \csname uftKeyword:\the\count1 \endcsname,
            \fi
            \advance\count1 by 1
            \advance\count2 by 1%
        }\par
        \setstretch{1.5}\selectfont
        \normalsize
    }

    \renewcommand{\colorsection}[2]{%
        \ifcase#1
            \colorbox{cor}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{cortexto}\MakeUppercase{#2}}}
        \else
            \colorbox{cor}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{cortexto}\MakeUppercase{#2}}}
        \fi
    }
    \renewcommand{\thechapter}{\arabic{chapter}}
    \titleformat{\chapter}{\bf}{}{-5pt}{\colorsection\thechapter}
    \titlespacing*{\chapter}{0pt}{20pt}{\baselineskip}
    \pagestyle{plain}
}

\DeclareOption{consuni}{\colorlet{cor}{azul}}
\DeclareOption{consepe}{\colorlet{cor}{verde}}
\DeclareOption{geral}{
    \colorlet{cor}{amarelo}
    \colorlet{cortexto}{preto}
}

\DeclareOption{professor}{
    \newgeometry{top=2.5cm,bottom=2.5cm,left=3cm,right=1.5cm}
    \renewpagestyle{plain}{%
        \sethead{}{}{}
        \setfoot{}{}{\thepage}%
    }
    \renewcommand\maketitle{
        \newpage
        \thispagestyle{empty}
        \noindent
        \setstretch{1}\selectfont
        \begin{center}
            \mybox{\MakeUppercase{\bf\local@title}}
        \end{center}

        \nohyphens{%
            \count1=0
            \@whilenum \count1<\@advisor \do{%
                \ifcase\count1
                    {\bf\local@advisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \
                    \csname uftAdvisorName:\the\count1 \endcsname \
                    \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
                \else
                    {\bf\local@coadvisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \
                    \csname uftAdvisorName:\the\count1 \endcsname \
                    \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
                \fi
                \advance\count1 by 1%
            } \par
        }

        {\bf Curso}: \local@department \par
        {\bf Local de execução da Pesquisa}: \local@local\par
        {\bf Participantes do projeto de pesquisa:}
        \count1=0
        \@whilenum \count1<\value{equipe} \do {%
            \ifcase\count1
                \csname uftNome:\the\count1 \endcsname , \
            \else
                \csname uftNome:\the\count1 \endcsname
            \fi
            \advance\count1 by 1%
        }

        {\bf Palavras-chave}: \count1=0 \count2=1
        \@whilenum \count1<\value{keywords} \do {%
            \ifnum\count2=\value{keywords}
                \csname uftKeyword:\the\count1 \endcsname.
            \else
                \csname uftKeyword:\the\count1 \endcsname,
            \fi
            \advance\count1 by 1
            \advance\count2 by 1%
        }\par
        \pagestyle{plain}
    }
    \AtEndDocument{\thispagestyle{plain}}
}

\AtBeginDocument{
    \setstretch{1.5}\selectfont
    \normalsize
}

\ProcessOptions\relax
\endinput
%%
%% End of file `uftpibic.cls'.