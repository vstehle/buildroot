.PHONY:	all install

PROGS = customu64 customu32

all:	$(PROGS)

%:	%.s
	$(CC) -o $@ $<

install:
	set -eux; \
	for p in $(PROGS); do \
		$(INSTALL) -D -m 755 "$$p" "$(PREFIX)/bin/$$p"; \
	done
