
VERSION=02
FILE=palaso

$(FILE)_$(VERSION).rnc : $(FILE)_$(VERSION).txt
	perl -ne 'if(/^----/){$$m=!$$m}elsif($$m){s/\s*<\d+>//;print}' $< > $@

rng : $(FILE)_$(VERSION).rng

$(FILE)_$(VERSION).rng : $(FILE)_$(VERSION).rnc
	trang $< $@

pdf : $(FILE)_$(VERSION).pdf

$(FILE)_$(VERSION).pdf : $(FILE)_$(VERSION).txt
	a2x $<
