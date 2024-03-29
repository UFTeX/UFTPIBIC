\def\filename{uftpibic.dtx}
\def\fileversion{v2.0.0}
\def\filedate{2018/20/03}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass {uftpibic} [\filedate\ \fileversion\ Classe personalizada para documentos da UFT]

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
% --------------- A codificação de fonte T1 é uma codificação de 8 bits e utiliza fontes que têm 256 glifos
\RequirePackage[T1]{fontenc}
% --------------- Idioma da texto, a acentuação pode ser escrita normalmente
\RequirePackage[english,brazil]{babel}
% --------------- Codificação do arquivo
\RequirePackage[utf8]{inputenc}
% --------------- Este pacote pode desativar toda a hifenização ou ativar a hifenização de fontes não-alfabéticos ou monoespaçadas.
\RequirePackage{hyphenat}
% --------------- Cabeçalho e rodapé
%\RequirePackage{fancyhdr}
% --------------- Utilização de cores
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

% --------------- Margens
\RequirePackage[a4paper,top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry} 
\RequirePackage{pdfpages}
% --------------- Utilização da marca d'agua
\RequirePackage{wallpaper}  
% --------------- Usamos arquivos pdf/png como figuras
\RequirePackage{graphicx}
\RequirePackage{ae}
\RequirePackage{booktabs}
\RequirePackage{setspace}
\RequirePackage{ltxcmds}
\RequirePackage{etoolbox}
\RequirePackage{lastpage}
\RequirePackage{eqparbox}
\RequirePackage{amsfonts,amsthm,amsopn,amssymb,latexsym}
% --------------- Formatação das captions de figuras e tabelas
\RequirePackage[labelfont=bf,textfont=bf,labelsep=endash, singlelinecheck=false,justification=centering]{caption}
%\RequirePackage{newtxmath,newtxtext}
% --------------- Links em preto
\RequirePackage[pdftex,unicode=true,plainpages=false,pdfpagelabels,pagebackref,colorlinks=true,citecolor=black,linkcolor=black,urlcolor=black,filecolor=black,bookmarksopen=true]{hyperref}
% --------------- soluciona o problema com o hyperref e capitulos
\RequirePackage[all]{hypcap}
\RequirePackage[nottoc,numbib]{tocbibind}
\RequirePackage{helvet}

\RequirePackage{lineno}

% --------------- Utilização de comandos básicos como \ifthenelse
\RequirePackage{ifthen}
% --------------- Garantir que dois ou mais blocos de texto ocupam o mesmo espaço horizontal na página.
\RequirePackage{eqparbox}
% --------------- Utilizado para construir a capa e folha de rosto
\RequirePackage{tabularx}

\RequirePackage[section]{placeins}
\RequirePackage[titles]{tocloft}

\RequirePackage{titlesec} 
\RequirePackage{chngcntr}
\counterwithout{equation}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

\renewcommand{\cftfigpresnum}{Figura }
\renewcommand{\cftfignumwidth}{5em}
\renewcommand{\cftfigaftersnum}{     -- }

\renewcommand{\cfttabpresnum}{Tabela }
\renewcommand{\cfttabnumwidth}{5em}
\renewcommand{\cfttabaftersnum}{     -- }

\newcommand{\mybox}[1]{\par\noindent\colorbox{cor}
{\parbox{\textwidth-2\fboxsep\relax}{\color{cortexto}\centering #1}}}

\renewcommand\title[1]{%
  \global\def\local@title{#1}%
}

\newcommand\reporttype[1]{%
  \ifthenelse{\equal{#1}{F}}
    {\global\def\local@reporttype{Final}}
    {\global\def\local@reporttype{Parcial}}
}

\newcommand\projecttype[1]{%
  \ifthenelse{\equal{#1}{bolsa}}
    {\global\def\local@projecttype{PIBIC}}
    {\global\def\local@projecttype{PIVIC}}
}

\newcommand\address[1]{%
  \global\def\local@address{#1}%
}

\newcommand\datainicio[1]{%
  \global\def\local@datainicio{#1}%
}

\newcommand\dataconclusao[1]{%
  \global\def\local@dataconclusao{#1}%
}

\newcommand\cep[1]{%
  \global\def\local@cep{#1}%
}

\newcommand\phone[1]{%
  \global\def\local@phone{#1}%
}

\newcommand\mail[1]{%
  \global\def\local@mail{#1}%
}

\newcommand\department[1]{%
  \global\def\local@department{#1}%
}

\newcommand\city[1]{%
  \global\def\local@city{#1}%
}

\newcommand\campus[1]{%
  \global\def\local@campus{#1}%
}

\newcommand\local[1]{%
  \global\def\local@local{#1}%
}

\newcommand\area[1]{%
  \global\def\local@area{#1}%
}

\newcommand\grupo[1]{%
  \global\def\local@grupo{#1}%
}

\newcommand\financiamento[1]{%
  \global\def\local@financiamento{#1}%
}

\newcounter{keywords}
\newcommand\keyword[1]{%
  \global\@namedef{uftKeyword:\expandafter\the\c@keywords}{#1}
  \global\addtocounter{keywords}{1}
}

\newcounter{equipe}
\newcommand\equipeexecutora[2]{%
  \global\@namedef{uftNome:\expandafter\the\c@equipe}{#1}
  \global\@namedef{uftCategoria:\expandafter\the\c@equipe}{#2}
  \global\addtocounter{equipe}{1}
}

\renewcommand\date[3]{%
  \day=#1
  \month=#2
  \year=#3
}

\newcommand\monthname{\ifcase\month\or
  Janeiro\or Fevereiro\or Mar{\c c}o\or Abril\or Maio\or Junho\or
  Julho\or Agosto\or Setembro\or Outubro\or Novembro\or Dezembro\fi}

\newcommand\global@monthname{\ifcase\month\or
  Janeiro\or Fevereiro\or Mar{\c c}o\or Abril\or Maio\or Junho\or
  Julho\or Agosto\or Setembro\or Outubro\or Novembro\or Dezembro\fi}

% ------------------------------------------------------------------------------------------------------ %
\newcommand\local@advisorstring{Orientador}
\newcommand\local@coadvisorstring{Coorientador}
\newcommand\foreign@advisorstring{Advisor}

\newcount\@advisor\@advisor0
\newcommand\advisor[4]{%
  \global\@namedef{uftAdvisorTitle:\expandafter\the\@advisor}{#1}
  \global\@namedef{uftAdvisorName:\expandafter\the\@advisor}{#2}
  \global\@namedef{uftAdvisorSurname:\expandafter\the\@advisor}{#3}
  \global\@namedef{uftAdvisorDegree:\expandafter\the\@advisor}{#4}
  \global\advance\@advisor by 1
  \ifnum\@advisor>1
    \renewcommand\local@coadvisorstring{Coorientador}
    \renewcommand\foreign@advisorstring{Advisors}
  \fi
}

\renewcommand\maketitle{
\newpage
\thispagestyle{empty}
\noindent
\begin{minipage}{.8\textwidth}
\begin{flushright}\renewcommand{\familydefault}{\sfdefault}\normalfont
UNIVERSIDADE FEDERAL DO  TOCANTINS \vspace{-.4\baselineskip} \\
PRÓ-REITORIA DE  PESQUISA E PÓS-GRADUAÇÃO \vspace{-.4\baselineskip} \\
COORDENAÇÃO DE INICIAÇÃO CIENTÍFICA \vspace{-.4\baselineskip}\\
\noindent\makebox[\linewidth]{\rule{\textwidth}{.5pt}}\vspace{-.4\baselineskip}
\footnotesize\fontfamily{phv}\fontseries{mc}\selectfont
\local@address\ | \local@cep\ | \local@city /TO \vspace{-.4\baselineskip} \\
\local@phone\ | www.uft.edu.br | \local@mail 
\end{flushright}
\end{minipage}% This must go next to `\end{minipage}`
\begin{minipage}{.225\textwidth}
\centering
\includegraphics[scale=.4]{logos/logouft}
\end{minipage}
 
 \renewcommand{\baselinestretch}{1}
\begin{center}
\mybox{\MakeUppercase{\bf\local@title}} \vspace{.25cm}
\end{center}

\nohyphens{%
    \count1=0
    %\toks@={}
    \@whilenum \count1<\@advisor \do{%
    \ifcase\count1 % same as \ifnum0=\count1
       \MakeUppercase{\bf\local@advisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \ 
        \csname uftAdvisorName:\the\count1 \endcsname \ 
        \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
    \else
        \MakeUppercase{\bf\local@coadvisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \ 
        \csname uftAdvisorName:\the\count1 \endcsname \ 
        \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
    \fi
    \advance\count1 by 1} \par
}
\MakeUppercase{\bf Nome do Aluno}: \@authname\ \@authsurn \par
\MakeUppercase{\bf campus}: \local@campus \par
\MakeUppercase{\bf curso}: \local@department \par
\MakeUppercase{\bf local de execução}: \local@local\par
\MakeUppercase{\bf grande área do conhecimento}: \local@area \par \vspace{.75cm}
\MakeUppercase{\bf fontes de financiamento}: \local@financiamento \par
\MakeUppercase{\bf nome do grupo de pesquisa}: \local@grupo \par
\MakeUppercase{\bf palavras-chave}: \count1=0 \count2=1
\@whilenum \count1<\value{keywords} \do {%
    \ifnum\count2=\value{keywords}
        \csname uftKeyword:\the\count1 \endcsname.
    \else
        \csname uftKeyword:\the\count1 \endcsname,
    \fi
        \advance\count1 by 1
        \advance\count2 by 1}\par
\MakeUppercase{\bf equipe executora}: \par

\def\xyz{\par}
\begin{tabularx}{16cm}[b]{p{11cm}p{5cm}}
\hline{\bf Nome} & {\bf Categoria} \\ \hline
\toks@={}
\count1=0 
\@whilenum \count1<\value{equipe} \do {%
\ifcase\count1 % same as \ifnum0=\count1
          \toks@=\expandafter{\csname uftNome:\the\count1%
          \expandafter\endcsname\expandafter\space%
          \expandafter&\expandafter\space
          \csname uftCategoria:\the\count1\endcsname\\}
        \else
          \toks@=\expandafter\expandafter\expandafter{%
            \expandafter\the\expandafter\toks@
            %\expandafter&\expandafter\space
            \csname uftNome:\the\count1\expandafter\endcsname%
            \expandafter&\expandafter\space
            \expandafter\space\csname uftCategoria:\the\count1\endcsname\\
          }%
        \fi
        \advance\count1 by 1}
\the\toks@
\hline
\end{tabularx}

\par \vspace{.75cm}

{\bf GRANDES ÁREAS DO CONHECIMENTO DA UFT: \par \vspace{.75cm}
%CIÊNCIAS AGRÁRIAS \par
%CIÊNCIAS BIOLÓGICAS E DA SAÚDE \par
CIÊNCIAS EXATAS E DA TERRA \par
%CIÊNCIAS HUMANAS, SOCIAIS APLICADAS E LETRAS \par 
} 

\renewcommand{\baselinestretch}{1.5}
}

\newcommand{\colorsection}[2]{%
\ifcase#1
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black}\MakeUppercase{#2}}}
\else
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black}\MakeUppercase{ #1~--~#2}}}
 \fi}
\renewcommand{\thechapter}{\arabic{chapter}}
\titleformat{\chapter}		
  {\bf}
  {}
  {-5pt}
  {\colorsection\thechapter}
\titlespacing*{\chapter}{0pt}{-20pt}{\baselineskip}


\newcommand{\colorsectionss}[2]{%
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black} #1~--~#2}}}
%\renewcommand{\thesection}{\arabic{section}}
\titleformat{\section}[display]
  {\bf}
  {}
  {-5pt}
  {\colorsectionss\thesection}
\titlespacing*{\section}{0pt}{0pt}{\baselineskip}


\renewpagestyle{plain}{%
  \setfoot{}{}{\thepage}%
}
\pagestyle{plain}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

\setlength{\parindent}{0cm}
\renewcommand{\baselinestretch}{1.5}

   \def\l@chapter#1#2{\pagebreak[3]
     \vskip 0.0em plus 0pt 
    \@tempdima .65cm
\begingroup
    \def\numberline##1{\hb@xt@\@tempdima{##1~--\hfil}}%<------ this line added
     \parindent \z@ \rightskip \@pnumwidth 
     \bfseries
     \leavevmode     
    \uppercase{#1}\hfil \cftdotfill{\cftdotsep} \hbox to\@pnumwidth{\hss #2}\medskip\par
 \endgroup}

\renewcommand\author[2]{%
  \global\def\@authname{#1}
  \global\def\@authsurn{#2}
}

\newcommand\term[2]{
  \global\def\@termyear{#1}
  \global\def\@termnumber{#2}
}

\DeclareOption{report}{


\renewcommand*{\ps@plain}{%
  \let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \def\@oddfoot{%
    \reset@font
    \hfil
    Página~\thepage~de~\pageref{LastPage}
    \hfil % removed for aligning to the right
  }%
  \let\@evenhead\@empty
  \let\@evenfoot\@oddfoot
}

\renewcommand\maketitle{
\newpage
\thispagestyle{empty}
\noindent
\begin{minipage}{.8\textwidth}
\begin{flushright}\renewcommand{\familydefault}{\sfdefault}\normalfont
UNIVERSIDADE FEDERAL DO {\bf TOCANTINS} \vspace{-.4\baselineskip} \\
PRÓ-REITORIA DE {\bf PESQUISA E PÓS-GRADUAÇÃO} \vspace{-.4\baselineskip} \\
COORDENAÇÃO DE  {\bf INICIAÇÃO CIENTÍFICA} \vspace{-.4\baselineskip}\\
\noindent\makebox[\linewidth]{\rule{\textwidth}{.5pt}}\vspace{-.4\baselineskip}
\small\fontfamily{phv}\fontseries{mc}\selectfont
\local@address\ | \local@cep\ | \local@city /TO \vspace{-.4\baselineskip} \\
\local@phone\ | www.uft.edu.br | \local@mail 
\end{flushright}
\end{minipage}% This must go next to `\end{minipage}`
\begin{minipage}{.225\textwidth}
\centering
\includegraphics[scale=.4]{logouft}
\end{minipage}\vspace{5pt}
\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
\renewcommand{\baselinestretch}{1}

\begin{center}
\bf
PROGRAMA INSTITUCIONAL DE BOLSAS DE INICIAÇÃO CIENT\'IFICA -- \local@projecttype \par \vspace{5pt}
\MakeUppercase{\LARGE\it RELAT\'ORIO \local@reporttype} \par \vspace{10pt}
\mybox{\MakeUppercase{\bf\local@title}} \vspace{.25cm}
\end{center}

\MakeUppercase{\bf Nome do(a) bolsista}: \@authname\ \@authsurn \par

\nohyphens{%
    \count1=0
    %\toks@={}
    \@whilenum \count1<\@advisor \do{%
    \ifcase\count1 % same as \ifnum0=\count1
       \MakeUppercase{\bf\local@advisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \ 
        \csname uftAdvisorName:\the\count1 \endcsname \ 
        \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
    \else
        \MakeUppercase{\bf\local@coadvisorstring}: \csname uftAdvisorDegree:\the\count1 \endcsname \ 
        \csname uftAdvisorName:\the\count1 \endcsname \ 
        \csname uftAdvisorSurname:\the\count1 \endcsname \ \par
    \fi
    \advance\count1 by 1} \par
}

\MakeUppercase{\bf campus}: \local@campus \par
\MakeUppercase{\bf curso}: \local@department \par
\MakeUppercase{\bf local de execução}: \local@local\par
\MakeUppercase{\bf Data de início}: \local@datainicio \par
\MakeUppercase{\bf Data de conclusão}: \local@dataconclusao \par

\vfill

{\it Data e Assinatura do Bolsista:} \par \vspace{.75cm}
\noindent{\rule{10cm}{0.4pt}} \par \vspace{.75cm}
{\it Data e Assinatura do Orientador:} \par \vspace{.75cm}
\noindent{\rule{10cm}{0.4pt}}

\pagebreak
\pagestyle{plain}
\begin{center}
\bf APRESENTAÇÃO
\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
\end{center}

\par \vspace{.75cm}

\MakeUppercase{\bf grande área do conhecimento (UFT)}: \local@area \par
{\bf ÁREA DO CONHECIMENTO (CNPq)}: \local@area \par
\MakeUppercase{\bf nome do grupo de pesquisa}: \local@grupo \par \vspace{.75cm}

{\bf GRANDES ÁREAS DO CONHECIMENTO DA UFT: \par \vspace{.75cm}
%CIÊNCIAS AGRÁRIAS \par
%CIÊNCIAS BIOLÓGICAS E DA SAÚDE \par
CIÊNCIAS EXATAS E DA TERRA \par
%CIÊNCIAS HUMANAS, SOCIAIS APLICADAS E LETRAS \par 
} 

\renewcommand{\baselinestretch}{1.5}
}


% Defining how is typeset the \chapter
\def\@makechapterhead#1{%
  {%
%  \noindent\rule{\textwidth}{1.7pt}\\\par
  \normalfont\bfseries
  \vspace*{0pt}%
  \noindent%
  \parbox[b]{\textwidth}{%
    \parbox[t]{4ex}{}%
    \parbox[t]{\textwidth-4ex-1ex}%
      {\interlinepenalty\@M\centering%
        \MakeUppercase{ #1}
\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
      }%
    \vspace*{10pt}
    }\\[2pt]%
  \vspace{0pt}%
  }%
}

\renewcommand{\colorsectionss}[2]{%
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black} #2}}}


\renewcommand{\colorsection}[2]{%
\ifcase#1
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black}\centering\bf\MakeUppercase{#2}
\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}}}
\else
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black}\MakeUppercase{ #1~--~#2}}}
 \fi}

   \def\l@chapter#1#2{\pagebreak[3]
     \vskip 0.0em plus 0pt 
    \@tempdima .65cm
\begingroup
    \def\numberline##1{\hb@xt@\@tempdima{\hfil}}%<------ this line added
     \parindent \z@ \rightskip \@pnumwidth 
     \bfseries
     \leavevmode     
    \uppercase{#1}\hfil \cftdotfill{\cftdotsep} \hbox to\@pnumwidth{\hss #2}\medskip\par
 \endgroup}

\def\l@section#1#2{\pagebreak[3]
       \vskip 0.0em plus 0pt 
       \@tempdima  .65cm     
       \begingroup
      \def\numberline##1{\hb@xt@\@tempdima{\hfil}}%<------ this line added
         \parindent \z@ \rightskip \@pnumwidth
        % \parfillskip -\@pnumwidth
        \normalsize\bfseries   
         \leavevmode         
         #1\hfil \cftdotfill{\cftdotsep} \hbox to\@pnumwidth{\hss #2}\medskip\par
       \endgroup}

\pagestyle{plain}
}


\DeclareOption{consuni}{
   \colorlet{cor}{azul}
}

\DeclareOption{consepe}{
   \colorlet{cor}{verde}
}

\DeclareOption{geral}{
   \colorlet{cor}{amarelo}
   \colorlet{cortexto}{preto}
}

\DeclareOption{2019}{
   \colorlet{cor}{cinza2}
   \colorlet{cortexto}{preto}
}

\ProcessOptions\relax
