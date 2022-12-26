CONTACTS_PATH = $(shell echo "$(CURDIR)/contacts.txt" | sed 's/^\///' | sed 's/\//:/g')

all:
	export CONTACTS_PATH=$(CONTACTS_PATH); osascript send.scpt
