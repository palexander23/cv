TEX = $(wildcard *.tex)
PDF = $(TEX:.tex=.pdf)
CONTENT = $(wildcard content/*.tex content/projects/*.tex)

.PHONY: all
all: $(PDF)

%.pdf: %.tex $(CONTENT)
	@echo "" | lualatex $*

clean:
	-rm -r *.aux *.bcf *.log *.out *.toc *.xml *.bbl *.blg
	-rm -r ./*/*.aux
	-rm *.pdf

wordCount:
	@echo "Word Count: \c"
	@texcount -inc -1 -sum main.tex
