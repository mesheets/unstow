# Stow helper and default configuration install and uninstall

BINSUBDIR=bin

DESTDIR ?= 
prefix ?= /usr/local
exec_prefix ?= ${prefix}
bindir ?= ${exec_prefix}/${BINSUBDIR}


install:
	@echo "Installing commands"
	install -v --mode=755 unstow restow "$(DESTDIR)$(bindir)"
	@echo "Installing user configuration for user \"root\" to $${HOME}"
	install -v --mode=644 dot-stowrc "$(DESTDIR)$${HOME}/.stowrc"
	@echo "Installing user configuration for user \"$$SUDO_USER\""
	install -v --mode=644 dot-stowrc "$(DESTDIR)/home/$${SUDO_USER}/.stowrc"

uninstall:
	@echo "Uninstalling commands"
	rm -f "$(DESTDIR)$(bindir)/unstow"
	rm -f "$(DESTDIR)$(bindir)/restow"
	@echo "Uninstalling user configuration for user \"root\" from $${HOME}"
	rm -f "$(DESTDIR)$${HOME}/.stowrc"
	@echo "Uninstalling user configuration for user \"$${SUDO_USER}\""
	rm -f "$(DESTDIR)/home/$${SUDO_USER}/.stowrc"
