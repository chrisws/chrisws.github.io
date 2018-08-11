#
# smallbasic site generator
#

.SECONDARY :
.PHONY : all clean spell

# tools
sbasic = /home/chrisws/src/SmallBASIC/src/platform/console/sbasic
pandoc = /usr/bin/pandoc

# variables
mkdir = @mkdir -p $(dir $@)
out = _out
pandoc_options=--from markdown-tex_math_dollars --to html5
bas = $(patsubst layouts/%.html, $(out)/%.bas, $(wildcard layouts/*.html))
pages = $(patsubst pages/%.markdown, $(out)/pages3/%.html, $(wildcard pages/*.markdown))

# rules
$(out)/%.bas: layouts/%.html
	$(mkdir)
	$(sbasic) mkpage.bas $< > $@

$(out)/pages/%.html: pages/%.markdown
	$(mkdir)
	$(pandoc) $(pandoc_options) -o $@ $<

$(out)/pages2/%.html: $(out)/pages/%.html $(bas)
	$(mkdir)
	$(sbasic) $(out)/article.bas $< > $@

$(out)/pages3/%.html: $(out)/pages2/%.html
	$(mkdir)
	$(sbasic) $(out)/sitepage.bas $< > $@

all: $(pages)
	@cp $(out)/pages3/*.html ../

clean:
	rm -rf $(out) *.sbu

spell:
	@enchant -l pages/*.markdown | sort | uniq | diff pages.dict -
