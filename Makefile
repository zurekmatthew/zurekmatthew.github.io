PAGES := index
# PAGES := index notes
HTML  := $(PAGES:%=%.html)

.PHONY: all clean
all: $(HTML)

%.html: pages/%.md template.html assets/css/style.css
	DATE=$$(git log -1 --format=%cs -- $< 2>/dev/null || date +%Y-%m-%d); \
	pandoc --standalone \
	  --from markdown \
	  --to html5 \
	  --template=template.html \
	  --metadata date="$$DATE" \
	  --output $@ $<

clean:
	rm -f $(HTML)

