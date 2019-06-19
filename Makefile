.PHONY: all
all: test

.PHONY: test
test:
	git ls-files | grep '.pm' | parallel env PERL5LIB=/usr/lib/os-autoinst:lib:$$PERL5LIB perl -c
