# Manual de Utilização da Classe `uftpibic`

A classe `uftpibic` é uma classe LaTeX personalizada, desenvolvida para a elaboração de **Relatórios de Projetos de Pesquisa PIBIC (Programa Institucional de Bolsas de Iniciação Científica) e PIVIC (Programa Voluntário de Iniciação Científica)** da Universidade Federal do Tocantins (UFT).

A classe padroniza o layout, cabeçalhos, rodapés e informações essenciais do projeto.

## 1. Uso Básico

Para iniciar seu documento, utilize a classe, e configure as opções de tamanho de fonte e design, se desejar:

```latex
\documentclass[12pt, consuni, report]{uftpibic}
```
## 2. Opções de Classe

As opções são passadas no comando `\documentclass`.

### 2.1. Tamanho da Fonte (Padrão: 12pt)

Define o tamanho base do texto:
* `10pt`
* `11pt`
* `12pt` (Padrão)

### 2.2. Opções de Design (Cores para Elementos do Título)

Define o esquema de cores principal (`cor`) para caixas de título e seções:
* `consuni`: Define a cor principal como **Azul** (`azul`).
* `consepe`: Define a cor principal como **Verde** (`verde`).
* `geral`: Define a cor principal como **Amarelo** (`amarelo`) e a cor do texto da caixa de título (`cortexto`) como **Preto** (`preto`).

### 2.3. Opções de Formato do Documento

* **`report`**: Aplica a formatação específica para Relatórios, reconfigurando margens, cabeçalho e rodapé para um layout de relatório PIBIC. No modo `report`, o rodapé inclui logotipos da UFT e do CNPq.
* **`professor`**: Altera a formatação para um resumo do projeto com foco no Orientador, ajustando as margens e a saída de `\maketitle`.

## 3. Comandos de Configuração (Metadados do Projeto)

Estes comandos devem ser definidos no preâmbulo (antes de `\begin{document}`).

| Comando | Argumentos | Função | Exemplo de Uso |
| :--- | :--- | :--- | :--- |
| `\title{#1}` | Título do Projeto | Define o título principal do projeto. | `\title{Análise de Dados Climáticos do Tocantins}` |
| `\author{#1}{#2}` | Nome, Sobrenome | Nome e sobrenome do **aluno/bolsista**. | `\author{Ana}{Pereira}` |
| `\advisor{#1}{#2}{#3}{#4}` | Profissão, Nome, Sobrenome, Titulação | Dados do **Orientador**. Use mais de uma vez para Coorientador(es). | `\advisor{Prof.}{Carlos}{Rocha}{Dr.}` |
| `\reporttype{#1}` | `F` ou `P` | Define se o relatório é **Final** (`F`) ou **Parcial** (`P`). | `\reporttype{F}` |
| `\projecttype{#1}` | `bolsa` ou outro | Define o tipo de projeto: **PIBIC** (`bolsa`) ou **PIVIC** (outro valor). | `\projecttype{bolsa}` |
| `\keyword{#1}` | Palavra-chave | Adiciona uma palavra-chave (pode ser usado múltiplas vezes). | `\keyword{Climatologia}` `\keyword{Machine Learning}` |
| `\department{#1}` | Nome do Curso | Curso/Unidade Acadêmica do aluno. | `\department{Ciência da Computação}` |
| `\area{#1}` | Grande Área CNPq | Grande área do conhecimento. | `\area{Ciências Exatas e da Terra}` |
| `\city{#1}` | Cidade do Campus | Cidade do Campus onde o projeto é desenvolvido. | `\city{Palmas}` |
| `\local{#1}` | Local de Execução | Local de execução da pesquisa. | `\local{Laboratório de Sistemas}` |
| `\datainicio{#1}` | Data de Início | Data de início do projeto (dado armazenado, não impresso no `\maketitle` padrão). | `\datainicio{01/08/2024}` |
| `\equipeexecutora{#1}{#2}` | Nome, Categoria | Adiciona um membro da equipe (dado armazenado, não impresso no `\maketitle` padrão). | `\equipeexecutora{Pedro Santos}{Voluntário}` |

## 4. Exemplo de Estrutura de Documento

O código a seguir demonstra a montagem do preâmbulo e a estrutura básica do relatório:

```latex
\documentclass[12pt, consuni, report]{uftpibic}

% 1. Dados do Bolsista e Título
\author{Ana}{Pereira}
\title{Análise de Dados Climáticos do Tocantins: Um Estudo de Caso}

% 2. Tipo de Projeto e Relatório
\reporttype{F}         % Relatório Final
\projecttype{bolsa}    % Projeto PIBIC

% 3. Dados do Orientador (e Coorientador)
\advisor{Prof.}{Carlos}{Rocha}{Dr.}
\advisor{Profa.}{Beatriz}{Sousa}{Ms.} % Coorientador (2ª chamada de \advisor)

% 4. Informações do Projeto
\department{Ciência da Computação}
\area{CIÊNCIAS EXATAS E DA TERRA}
\keyword{Climatologia}
\keyword{Machine Learning}
\keyword{Análise de Séries Temporais}

% 5. Dados do Campus (usados no cabeçalho)
\city{Palmas}
\address{Av. NS 15, Bloco B}
\cep{77000-000}
\phone{(63) 3232-0000}
\mail{propesq@uft.edu.br}

\begin{document}

% Gera a Folha de Rosto e dados de projeto (usando o formato 'report')
\maketitle

% Estrutura do Relatório
\chapter{Introdução e Revisão Bibliográfica}
    A introdução do relatório final deve apresentar o problema de pesquisa e a justificativa.
\section{Objetivos Propostos}
    Nesta seção, revisamos os objetivos definidos no plano de trabalho...

\chapter{Metodologia}
    A metodologia utilizada...

\chapter{Resultados e Discussão}
    Os principais resultados obtidos...

\end{document}
```

## 5. Formato de Layout e Estilo

* **Margens:** O layout padrão tem margens definidas para `top=5cm`, `bottom=2cm`, `left=2cm`, `right=2cm`. O modo `report` ajusta a margem inferior para `3cm`.
* **Espaçamento:** O espaçamento de linha padrão é de 1.5 (`\renewcommand{\baselinestretch}{1.5}`).
* **Títulos:**
    * `\chapter` é formatado em uma caixa colorida.
    * `\section` é formatado em uma caixa colorida com o número da seção e o título separados por travessão.
* **Numeração:** A numeração de Equações, Figuras e Tabelas é contínua e não reinicia a cada capítulo (`\counterwithout`).
* **Comando Principal:** O comando `\maketitle` gera o cabeçalho completo com informações da PROPESQ e os dados do projeto.

---

*Para outros modelos acadêmicos da UFT, visite a organização [UFTeX](https://github.com/UFTeX).*