# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

.PHONY: all

all: clean init

	mkdir --parents $(PWD)/build/Boilerplate.AppDir

	wget --output-document=$(PWD)/build/build.tar.gz --continue "https://sourceforge.net/projects/openofficeorg.mirror/files/4.1.13/binaries/en-US/Apache_OpenOffice_4.1.13_Linux_x86-64_install-deb_en-US.tar.gz/download"
	tar -zxvf $(PWD)/build/build.tar.gz

	$(PWD)/scripts/unpack.sh $(PWD)/en-US/DEBS

	rm -rf $(PWD)/AppDir/opt
	mkdir --parents $(PWD)/AppDir/opt/application
	cp -r $(PWD)/build/opt/openoffice*/* $(PWD)/AppDir/opt/application

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/AppDir $(PWD)/OpenOffice.AppImage
	chmod +x $(PWD)/OpenOffice.AppImage

init:
	mkdir --parents $(PWD)/bin

	wget https://apprepo.de/appimage/download/apprepo \
		--output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/AppDir/opt
	rm -rf $(PWD)/en-US
	rm -rf $(PWD)/build
	rm -rf $(PWD)/*.gz
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
