.SUFFIXES: .tex .cls .dia .eps .dvi .pdf

FILES_DIST = icmsec.cls thesis.tex thesis.pdf thesis-fig.eps

FILES = icmsec.cls thesis.tex thesis-fig.eps \
	Makefile thesis-fig.dia \
	preprint.tex

ver="`grep ProvidesClass icmsec.cls | \
    	sed -e 's/.*\[\(20..\)\/\(..\)\/\(..\).*/\1\2\3/'`"

template-icmsec.zip: $(FILES)
	@zip -9 -u $@ $^

dist:
	@echo 1>&2 "$(HOME)/template-$(ver).zip:"
	make -s thesis-fig.eps thesis.pdf
	@zip -9 -u $(HOME)/template-$(ver).zip $(FILES_DIST) thesis.pdf

clean:
	@rm -f ctextemp_* *.aux *.log *.dvi *.aux *.toc *.lof *.lot *.ilg

.dia.eps:
	dia --nosplash -e $*.eps $*.dia
.tex.dvi:
	ctex $*.tex
.dvi.pdf:
	dvipdfmx $*.dvi
