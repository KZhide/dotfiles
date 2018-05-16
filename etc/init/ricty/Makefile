INCONSOLATA_TTFS=Inconsolata-Regular.ttf Inconsolata-Bold.ttf
MIGU_DIR=migu-1m-20150712
MIGU_ZIP=$(MIGU_DIR).zip
MIGU_TTFS=$(addprefix $(MIGU_DIR)/, migu-1m-regular.ttf migu-1m-bold.ttf)
RICTY_TTFS= Ricty-Bold.ttf Ricty-BoldOblique.ttf Ricty-Oblique.ttf Ricty-Regular.ttf RictyDiscord-Bold.ttf RictyDiscord-BoldOblique.ttf RictyDiscord-Oblique.ttf RictyDiscord-Regular.ttf
RICTY_TTFS_INSTALLED=$(addprefix ~/.fonts/, $(RICTY_TTFS))

ricty: $(RICTY_TTFS)

$(RICTY_TTFS): $(INCONSOLATA_TTFS) $(MIGU_TTFS) ricty_generator.sh os2version_reviser.sh
	./ricty_generator.sh $(INCONSOLATA_TTFS) $(MIGU_TTFS)
	./os2version_reviser.sh $(RICTY_TTFS)

Inconsolata-Bold.ttf:
	wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf

Inconsolata-Regular.ttf:
	wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf

$(MIGU_TTFS): $(MIGU_ZIP)
	unzip -o $<

$(MIGU_ZIP):
	wget https://osdn.jp/projects/mix-mplus-ipa/downloads/63545/$(MIGU_ZIP)

ricty_generator.sh:
	wget http://www.rs.tus.ac.jp/yyusa/ricty/$@
	chmod 755 $@

os2version_reviser.sh:
	wget http://www.rs.tus.ac.jp/yyusa/ricty/$@
	chmod 755 $@

install: $(RICTY_TTFS)
	cp $(RICTY_TTFS) ~/.fonts/

.PHONY: clean

clean:
	-rm $(RICTY_TTFS) $(INCONSOLATA_TTFS) $(MIGU_ZIP)
	-rm *.bak *.ttf
	-rm -r $(MIGU_DIR)
	-rm ricty_generator.sh os2version_reviser.sh
