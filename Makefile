# Dependencies and how to fulfill them
#   * bikeshed <https://tabatkins.github.io/bikeshed/#installing>
#   * markdown2 (pip install markdown2)

all: docs spec

clean:
	@rm -f *~ *.html

docs: $(patsubst %.md,%.html,$(wildcard *.md))
spec: $(patsubst %.bs,%.html,$(wildcard *.bs))

%.html: %.bs
	bikeshed spec $< $@

%.html: %.md boilerplate.html.in
	@cat boilerplate.html.in > $@
	markdown2 $< >> $@
