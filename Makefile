PREFIX ?= /usr/local
APP_ID = io.github.jaydens_tasty_slop.Ocellus

all:

install:
	install -Dm755 ocellus $(DESTDIR)$(PREFIX)/bin/ocellus
	install -Dm644 $(APP_ID).desktop \
		$(DESTDIR)$(PREFIX)/share/applications/$(APP_ID).desktop

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/ocellus \
		$(DESTDIR)$(PREFIX)/share/applications/$(APP_ID).desktop

check:
	python3 -c 'import ast, sys; ast.parse(open("ocellus").read())'
	desktop-file-validate $(APP_ID).desktop

.PHONY: all install uninstall check
