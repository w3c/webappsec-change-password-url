# This Makefile assumes you have Bikeshed and DocToc installed.
#
# Bikeshed can be installed with pip:
#
#     pip3 install bikeshed && bikeshed update
#
# DocToc can be installed via NPM:
#
#     npm install -g doctoc

specs = $(patsubst %.bs,%.html,$(wildcard *.bs))

.PHONY: all clean specs update-explainer-toc
.SUFFIXES: .bs .html

all: update-explainer-toc specs index.html

update-explainer-toc: Makefile
	doctoc README.md --title "## Table of Contents" > /dev/null

specs: $(specs) Makefile

index.html: change-password-url.html
	cp $< $@

.bs.html:
	bikeshed spec $< $@

clean:
	rm -f *.html *~
