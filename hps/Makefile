MAKEFILES = $(wildcard hps-*/Makefile)

default: $(patsubst %/Makefile,default-%,$(MAKEFILES))
.PHONY: default

default-%: %
	cd $< && make default
.PHONY: default-%

install_prerequisites: $(patsubst %/Makefile,install_prerequisites-%,$(MAKEFILES))
.PHONY: install_prerequisites

install_prerequisites-%: %
	cd $< && make install_prerequisites
.PHONY: install_prerequisites-%

test: $(patsubst %/Makefile,test-%,$(MAKEFILES))
.PHONY: test

test-%: %
	cd $< && make test
.PHONY: test-%

