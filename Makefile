SHELL=/bin/bash

RTOOLS=/usr/local/repo/repo-tools
RINCOMING=$(RTOOLS)/incoming

all:
	@echo Docs need to be done
	@echo 'make astbuild' to build the asterisk debs

# To avoid $(shell pwd) getting confused...
ASTROOT=$(shell pwd)/submodules/asterisk

include $(wildcard submodules/*/Makefile)

.PHONY: publish
# This will only work if you're xrobau. Sorry.
publish:
	cp $(ALLASTDEBS) $(RINCOMING)
	cd $(RTOOLS); make repo

