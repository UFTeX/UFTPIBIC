# Nome do projeto
NAME = uftpibic

# Comandos
LATEX = pdflatex
MKIDX = makeindex

# Regra principal (Gera tudo)
all: sty doc clean_temp

# 1. Extrai o arquivo .sty do arquivo .dtx usando o .ins
# Altere a regra sty para isto:
sty: $(NAME).ins $(NAME).dtx
	@touch $(NAME).ins $(NAME).dtx  # Resolve o erro de data (clock skew)
	-$(LATEX) $(NAME).ins           # O '-' ignora erros bobos de retorno do docstrip

# 2. Gera o manual em PDF a partir do .dtx
# Rodamos duas vezes para resolver referências cruzadas e índices
doc: $(NAME).dtx sty
	$(LATEX) $(NAME).dtx
	$(MKIDX) -s gind.ist $(NAME).idx
	$(MKIDX) -s gglo.ist -o $(NAME).gls $(NAME).glo
	$(LATEX) $(NAME).dtx
	$(LATEX) $(NAME).dtx

# 3. Limpa arquivos auxiliares de compilação
clean_temp:
	rm -f *.aux *.log *.out *.toc *.idx *.ilg *.ind *.glo *.gls *.hd *.pdfsync *.synctex.gz

# 4. Limpeza total (remove inclusive o .sty e o .pdf gerado)
distclean: clean_temp
	rm -f $(NAME).cls $(NAME).pdf

# 5. Ajuda
help:
	@echo "Uso do Makefile para $(NAME):"
	@echo "  make         : Gera o .sty e o manual .pdf"
	@echo "  make sty     : Apenas extrai o arquivo de pacote .sty"
	@echo "  make doc     : Gera a documentação detalhada em PDF"
	@echo "  make clean   : Remove arquivos temporários de compilação"
	@echo "  make distclean: Remove TUDO o que foi gerado"
