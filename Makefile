# This Makefile assumes you have Bikeshed and DocToc installed.
#
# Bikeshed can be installed with pip:
#
#     pip3 install bikeshed && bikeshed update
#
# DocToc can be installed via NPM:
#
#     npm install -g doctoc

.PHONY: all clean spec update-explainer-toc
.SUFFIXES: .bs .html

all: update-explainer-toc spec

update-explainer-toc:
	doctoc README.md --title "## Table of Contents" > /dev/null

spec: index.html

.bs.html:
	bikeshed spec $< $@

clean:
	rm -f index.html *~
