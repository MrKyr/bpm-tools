-include .config

PREFIX ?= /usr/local
INSTALL ?= install

BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

CFLAGS ?= -O3

CFLAGS += -Wall
LDLIBS += -lm

.PHONY:	clean install dist

bpm:	bpm.o

clean:
	rm -f bpm *.o

install:
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) -c bpm bpm-graph bpm-tag $(DESTDIR)$(BINDIR)
	$(INSTALL) -d $(DESTDIR)$(MANDIR)/man1
	$(INSTALL) -c bpm.1 bpm-graph.1 bpm-tag.1 $(DESTDIR)$(MANDIR)/man1

dist:
	mkdir -p dist
	V=$$(git describe) && git archive --prefix=bpm-tools-$$V/ HEAD \
		| gzip > dist/bpm-tools-$$V.tar.gz
