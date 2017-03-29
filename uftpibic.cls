\def\filename{uftex2.dtx}
\def\fileversion{v1.6.1}
\def\filedate{2016/11/11}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass {uftdocs} [\filedate\ \fileversion\ Classe personalizada para documentos da UFT]

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
\definecolor{preto}{RGB}{0,0,0}
\definecolor{branco}{RGB}{255,255,255}
\definecolor{cortexto}{RGB}{255,255,255}
\definecolor{cor}{RGB}{102,102,102}

% --------------- Margens
\RequirePackage[a4paper,top=1cm,bottom=2cm,left=3cm,right=1.5cm]{geometry} 
\RequirePackage{pdfpages}
% --------------- Utilização da marca d'agua
\RequirePackage{wallpaper}  
% --------------- Usamos arquivos pdf/png como figuras
\RequirePackage{graphicx}
\RequirePackage{titlesec}

\RequirePackage{newtxmath,newtxtext}

\RequirePackage{hyperref}

\RequirePackage{helvet}

\RequirePackage{lineno}

% --------------- Utilização de comandos básicos como \ifthenelse
\RequirePackage{ifthen}
% --------------- Garantir que dois ou mais blocos de texto ocupam o mesmo espaço horizontal na página.
\RequirePackage{eqparbox}
% --------------- Utilizado para construir a capa e folha de rosto
\RequirePackage{tabularx}


\newcommand{\mybox}[1]{\par\noindent\colorbox{cor}
{\parbox{\textwidth-2\fboxsep\relax}{\color{cortexto}\centering #1}}}

\renewcommand\title[1]{%
  \global\def\local@title{#1}%
}

\newcommand\address[1]{%
  \global\def\local@address{#1}%
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
CIÊNCIAS AGRÁRIAS \par
CIÊNCIAS BIOLÓGICAS E DA SAÚDE \par
CIÊNCIAS EXATAS E DA TERRA \par
CIÊNCIAS HUMANAS, SOCIAIS APLICADAS E LETRAS \par } 

\renewcommand{\baselinestretch}{1.5}
}

\newcommand{\colorsection}[2]{%
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black}\MakeUppercase{ #1~.~#2}}}}
\renewcommand{\thechapter}{\arabic{chapter}}
\titleformat{\chapter}[display]
  {\bf}
  {}
  {-5pt}
  {\colorsection\thechapter}
\titlespacing*{\chapter}{0pt}{0pt}{\baselineskip}


\newcommand{\colorsectionss}[2]{%
  \colorbox{white}{\parbox{\dimexpr\textwidth-2\fboxsep}{\color{black} #1~.~#2}}}
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

%\makeatletter
%\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
%\makeatother

\newcommand\status[1]{%
  \global\def\local@status{#1}%
}

\renewcommand\author[2]{%
  \global\def\@authname{#1}
  \global\def\@authsurn{#2}
}

\newcommand\term[2]{
  \global\def\@termyear{#1}
  \global\def\@termnumber{#2}
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

\ProcessOptions\relax
