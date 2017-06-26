SHELL := /bin/bash

help:
	@grep --only-matching --word-regexp '^[^[:space:].]*:' Makefile | sed 's|:[[:space:]]*||'

image: clean
	cp -r /var/cache/pacman/pkg ./airootfs/root/packages
	cp packages.both ./airootfs/root/packages/
	sudo ./build.sh -v

clean: 
	sudo rm -rf ./work ./out

usb:
	@echo "Replace sdX with the destination device:"
	@echo "sudo dd if=out/archiso.iso of=/dev/sdX bs=4M"

.PHONY: help image usb clean
