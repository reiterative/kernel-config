SOURCEDIR=$(CURDIR)/docs
OUTPUTDIR=$(CURDIR)/_output
STYLESHEET=asciidoctor-default.css

RUN-AD=asciidoctor -D . --backend=html5 -a stylesheet=$(STYLESHEET) -a linkcss

.PHONY: help index clean

help:
	@echo 'Makefile for document generation'
	@echo ' '
	@echo 'Usage:'
	@echo '    make index           generate index file'
	@echo '    make clean           remove generated files'

index:
	$(RUN-AD) -o $(OUTPUTDIR)/index.html $(SOURCEDIR)/index.adoc
	cp $(SOURCEDIR)/$(STYLESHEET) $(OUTPUTDIR)/

clean:
	rm -rf $(OUTPUTDIR)
