# Manual de Utilização e Elaboração de Projetos e Relatórios de Iniciação Científica Utilizando a Classe `uftpibic.cls`

A classe `uftpibic` formata **Projetos e Relatórios de Iniciação Científica (PIBIC/PIVIC)** da Universidade Federal do Tocantins (UFT), nos três formatos exigidos pelo programa: projeto do aluno, projeto do orientador e relatório parcial/final.

Este manual explica as opções de classe e os comandos necessários para montar cada um desses documentos.

---

## 1. Pré-requisitos e Estrutura de Arquivos

```
meu-projeto/
├── meu-projeto.tex
├── uftpibic.cls
└── logos/
    ├── logouft.pdf
    ├── Caninde.pdf
    └── cnpq.pdf        ← usado apenas no modo `report`
```

## 2. Como Compilar

```bash
pdflatex meu-projeto.tex
bibtex   meu-projeto        # se houver referências
pdflatex meu-projeto.tex
pdflatex meu-projeto.tex
```

## 3. Opções de Classe

```latex
\documentclass[<fonte>, <cor>, <formato>]{uftpibic}
```

### 3.1. Tamanho da Fonte (Padrão: 12pt)

* `10pt`
* `11pt`
* `12pt` (Padrão)

### 3.2. Identidade Visual (Cores)

* `consuni`: cor principal **Azul**.
* `consepe`: cor principal **Verde**.
* `geral`: cor principal **Amarela**, com texto da caixa de título em **Preto**.

### 3.3. Formato do Documento

| Opção | Uso | Efeito no `\maketitle` |
| :--- | :--- | :--- |
| *(nenhuma)* | Projeto do aluno | Mostra Nome do Aluno, Curso, Orientador(es) e Palavras-chave. |
| `professor` | Projeto do orientador | Mostra Título, Orientador(es), Curso, Local de Execução, **Equipe Executora** e Palavras-chave. Margens e cabeçalho próprios. |
| `report` | Relatório parcial/final | Folha de rosto com Título, Autor, Orientador(es), Grande Área e Palavras-chave. Rodapé com logos da UFT e do CNPq. |

Essas três opções são mutuamente exclusivas — escolha uma por documento. As opções de fonte e cor (3.1 e 3.2) podem ser combinadas livremente com qualquer uma delas.

```latex
\documentclass[12pt, consuni]{uftpibic}            % projeto do aluno
\documentclass[12pt, consuni, professor]{uftpibic}  % projeto do orientador
\documentclass[12pt, report]{uftpibic}              % relatório
```

## 4. Comandos de Metadados

Devem ser declarados no **preâmbulo**, antes de `\begin{document}`.

| Comando | Argumentos | Função | Exemplo |
| :--- | :--- | :--- | :--- |
| `\title{#1}` | Título | Título do projeto/relatório. | `\title{Análise de Dados Climáticos}` |
| `\author{#1}{#2}` | Nome, Sobrenome | Nome do aluno/bolsista. | `\author{Ana}{Pereira}` |
| `\advisor{#1}{#2}{#3}{#4}` | Título, Nome, Sobrenome, Grau | Orientador. Repita para coorientador(es). | `\advisor{Prof.}{Carlos}{Rocha}{Dr.}` |
| `\department{#1}` | Nome do Curso | Curso do aluno. | `\department{Ciência da Computação}` |
| `\area{#1}` | Grande Área CNPq | Grande área do conhecimento. Impressa apenas no modo `report`. | `\area{Ciências Exatas e da Terra}` |
| `\local{#1}` | Local de Execução | Local onde a pesquisa é executada. Impresso apenas no modo `professor`. | `\local{Laboratório de Sistemas}` |
| `\equipeexecutora{#1}{#2}` | Nome, Categoria | Membro da equipe. Repetível. Impresso apenas no modo `professor`. | `\equipeexecutora{Pedro Santos}{Voluntário}` |
| `\keyword{#1}` | Palavra-chave | Adiciona uma palavra-chave. Repetível. | `\keyword{Machine Learning}` |
| `\city{#1}` | Cidade | Cidade do Campus (usada no cabeçalho institucional). | `\city{Palmas}` |
| `\address{#1}` | Endereço | Endereço institucional (cabeçalho). | `\address{Av. NS 15, Bloco B}` |
| `\cep{#1}` | CEP | CEP do Campus (cabeçalho). | `\cep{77000-000}` |
| `\phone{#1}` | Telefone | Telefone institucional (cabeçalho). | `\phone{(63) 3232-0000}` |
| `\mail{#1}` | E-mail | E-mail institucional (cabeçalho). | `\mail{propesq@uft.edu.br}` |

## 5. Estrutura do Documento

```latex
\documentclass[12pt, consuni]{uftpibic}

% metadados aqui (Seção 4)

\begin{document}

\maketitle

\chapter{Introdução}
...
\chapter{Objetivos}
...

\bibliography{bibliografia}

\end{document}
```

* `\maketitle` deve ser chamado uma única vez, logo após `\begin{document}`. Ele imprime a folha de rosto no formato correspondente à opção escolhida (Seção 3.3).
* A partir daí o documento segue a estrutura normal da classe `book`: `\chapter`, `\section`, tabelas, figuras, etc.

## 6. Formatação Automática

* **Margens:** `top=5cm`, `bottom=2cm` (`3cm` no modo `report`), `left=2cm`, `right=2cm`.
* **Espaçamento:** 1,5 entre linhas.
* **Capítulos e seções:** formatados em caixa colorida (cor definida pela Seção 3.2).
* **Numeração:** Equações, Figuras e Tabelas têm numeração contínua, sem reiniciar a cada capítulo.
* **Links:** `hyperref` já configurado, com cores neutras (preto/azul apenas para URLs).

## 7. Exemplo Completo (Projeto do Aluno)

```latex
\documentclass[12pt, consuni]{uftpibic}

\address{Quadra 109 Norte, Av. NS 15, ALCNO 14, Prédio da Reitoria, Proesq}
\cep{77001-090}
\phone{(63) 3229-4037}
\mail{pibic@uft.edu.br}
\city{Palmas}

\title{Análise de Dados Climáticos do Tocantins}
\advisor{Prof.}{Carlos}{Rocha}{Dr.}
\author{Ana}{Pereira}
\department{Ciência da Computação}
\keyword{Climatologia}
\keyword{Machine Learning}

\begin{document}

\maketitle

\chapter{Introdução}
Texto aqui.

\chapter{Objetivos}
Texto aqui.

\bibliography{bibliografia}

\end{document}
```

## 8. Notas e Limitações

* Os comandos `\campus`, `\grupo`, `\financiamento`, `\reporttype`, `\projecttype`, `\datainicio` e `\dataconclusao` **não existem mais** a partir da v2.1.0 — eram campos que armazenavam valor mas nunca eram impressos em nenhum `\maketitle`. Se você tem um `.tex` antigo que os usa, basta remover as chamadas.
* `\area` só aparece no modo `report`; `\local` e `\equipeexecutora` só aparecem no modo `professor`. Definir esses comandos em outro modo não gera erro, mas o valor não será exibido.
* O logo da UFT deve estar em `logos/logouft.pdf` (ou similar); o modo `report` também espera `logos/Caninde.pdf` e `logos/cnpq.pdf`.