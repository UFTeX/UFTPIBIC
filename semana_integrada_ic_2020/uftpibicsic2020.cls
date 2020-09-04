\def\filename{uftpibicsic2020.dtx}
\def\fileversion{v1.0.0}
\def\filedate{2020/04/09}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass {uftpibicsic2020} [\filedate\ \fileversion\ Classe personalizada para artigos do PIBIC da UFT]

\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass[oneside,\@@ptsize]{book}

% --------------- A codificação de fonte T1 é uma codificação de 8 bits e utiliza fontes que têm 256 glifos
\RequirePackage[T1]{fontenc}
% --------------- Idioma da texto, a acentuação pode ser escrita normalmente
\RequirePackage[brazil]{babel}
% --------------- Codificação do arquivo
\RequirePackage[utf8]{inputenc}
% --------------- Este pacote pode desativar toda a hifenização ou ativar a hifenização de fontes não-alfabéticos ou monoespaçadas.
\RequirePackage{hyphenat}
% --------------- Utilização de cores
\RequirePackage{xcolor}
% --------------- Margens
\RequirePackage[a4paper,top=1.75cm,bottom=2cm,left=1.25cm,right=1.25cm]{geometry} 
% --------------- Usamos arquivos pdf/png como figuras
\RequirePackage{graphicx}
\RequirePackage{ae}
\RequirePackage{ltxcmds}
\RequirePackage{etoolbox}
\RequirePackage{lastpage}
%\RequirePackage{eqparbox}
\RequirePackage{amsfonts,amsthm,amsopn,amssymb,latexsym}
% --------------- Formatação das captions de figuras e tabelas
\RequirePackage[labelfont=bf,textfont=bf,labelsep=endash, singlelinecheck=false,justification=centering]{caption}
% --------------- Links em preto
\RequirePackage[pdftex,unicode=true,plainpages=false,pdfpagelabels,pagebackref,colorlinks=true,citecolor=black,linkcolor=black,urlcolor=black,filecolor=black,bookmarksopen=true]{hyperref}
% --------------- soluciona o problema com o hyperref e capitulos
\RequirePackage[all]{hypcap}
\RequirePackage[nottoc,numbib]{tocbibind}
\RequirePackage{helvet}

% --------------- Utilização de comandos básicos como \ifthenelse
\RequirePackage{ifthen}
% --------------- Garantir que dois ou mais blocos de texto ocupam o mesmo espaço horizontal na página.
\RequirePackage{eqparbox}
% --------------- Utilizado para construir a capa e folha de rosto
\RequirePackage{tabularx}
\RequirePackage{afterpage}
% --------------- Inclusão da marca dagua em todas as folhas
%\RequirePackage{draftwatermark}
%\SetWatermarkText{\includegraphics[width=\paperwidth]{logo_sic_16}}
%\SetWatermarkVerCenter{1.55cm}
%\SetWatermarkAngle{0}

\RequirePackage[section]{placeins}
\RequirePackage[titles]{tocloft}

% --------------- Label das figuras sequenciais
\RequirePackage{titlesec} 
\RequirePackage{chngcntr}
\counterwithout{equation}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% --------------- Comando para definir qual é o campus
\newcommand\campus[1]{%
  \global\def\local@campus{#1}}

% --------------- Comandos para criação da tag de palavras-chaves
\newcounter{keywords}
\newcommand\keyword[1]{%
  \global\@namedef{uftKeyword:\expandafter\the\c@keywords}{#1}
  \global\addtocounter{keywords}{1}}

% --------------- Comandos para inclusão a filiação dos autores
\newcommand{\authortag}[1]{$^{#1}$}
\def\address#1{\gdef\@address{#1}}
\newcounter{instn}
\setcounter{instn}{1}
\newcommand{\instnum}{\arabic{instn}}
\newcommand{\inst}[1]{\ensuremath{^{#1}}}
\newcommand{\nextinstitute}{\\\mbox{}\\[-6pt] \addtocounter{instn}{1}\inst{\instnum}}
\newcommand{\email}[1]{\\\mbox{}\\[-6pt]\footnotesize\texttt{#1}}
\renewcommand{\and}{, }
\def\address#1{\gdef\@address{#1}}

% --------------- Impedir a quebra automática de páginas dos capitulos
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}

% ------------------------------------------------------------------------------------------------------ %
%Redefine chapterheading:
\def\@makechapterhead#1{
  {\normalfont\bfseries
   \vspace*{12pt}%
   \noindent%
	\parbox[b]{\textwidth}{
		\parbox[t]{\textwidth}%
			{\interlinepenalty\@M  \MakeUppercase{ #1}}
		\vskip 20\p@
	}}
}

% ------------------------------------------------------------------------------------------------------ %
\renewcommand\frontmatter{%
  \clearpage
  \let\oldplain\ps@plain
  \let\ps@plain\ps@empty
  \pagestyle{empty}
}

% ------------------------------------------------------------------------------------------------------ %
\renewcommand\mainmatter{%
%\clearpage
% --------------- Estilo da página
\colorlet{NextBlue}{red!25!green!50!blue!75}
\renewcommand*{\ps@plain}{%
  \let\@mkboth\@gobbletwo
  \def\@oddhead{%\@empty
   %\vbox{\centering\textcolor{gray}{\small\sffamily 17/10 a 06/12 de 2018 - \local@campus\ } \vskip 5\p@ \hrule}
  }
  \def\@oddfoot{%
    \reset@font
    {\color{NextBlue} \hrulefill}
     \ \ {\bf Página~\thepage} \ \ 
    {\color{NextBlue}\hrulefill}
  }%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
}
\pagestyle{plain}
}

% ------------------------------------------------------------------------------------------------------ %
\renewcommand\maketitle{

\vspace*{-1.5cm}
\begin{center}
\includegraphics[width=9cm,height=4cm]{logo_sic_16}~\quad ~\includegraphics[width=4.5cm,height=4cm]{logo_pibic_cnpq}
\end{center}

\renewcommand{\baselinestretch}{1}

%\vspace*{-.7cm}
  \begin{center}
  \MakeUppercase{\large\bf\@title}\par
  \end{center}
   %\vglue 6pt plus 3pt minus 3pt
  {\normalsize
   \textbf{\begin{tabular}[t]{l}\@author\end{tabular}}\par}
   \vglue 6pt plus 3pt minus 3pt
  {\small
   \textbf{\begin{tabular}[l]{l}\inst{\instnum}\@address\end{tabular}}\par}
   \vglue 6pt plus 3pt minus 3pt
   \par
}   
% ------------------------------------------------------------------------------------------------------ %
\newenvironment{abstract}{%
\vspace{12pt}%
\chapter{RESUMO}
}{

\count1=0
\noindent\nohyphens{{\bfseries Palavra-chave}: \@whilenum \count1<\value{keywords} \do {%
        \csname uftKeyword:\the\count1 \endcsname;
        \advance\count1 by 1}}\vskip 6\p@}
% ------------------------------------------------------------------------------------------------------ %

% --------------- Alterar rótulo das referências
\addto\captionsbrazil{\renewcommand{\bibname}{Literarura Citada}}

% --------------- Fazer a hifenização
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

% --------------- Identação de parágrafo
\setlength{\parindent}{0cm}

% --------------- Espaçamento entre as linhas
\renewcommand{\baselinestretch}{1.5}

\ProcessOptions\relax
