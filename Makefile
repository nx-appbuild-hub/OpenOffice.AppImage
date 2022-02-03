# This software is a part of the A.O.D (https://apprepo.de) project
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
SOURCE="https://sourceforge.net/projects/openofficeorg.mirror/files/4.1.11/binaries/en-US/Apache_OpenOffice_4.1.11_Linux_x86-64_install-deb_en-US.tar.gz/download"
DESTINATION="build.tar.gz"
OUTPUT="OpenOffice.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	tar -zxvf $(DESTINATION)

	scripts/unpack.sh en-US/DEBS

	rm -rf AppDir/opt
	mkdir --parents AppDir/opt/application
	cp -r build/opt/openoffice*/* AppDir/opt/application

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -rf AppDir/opt
	rm -rf en-US
	rm -rf build
	rm -rf *.gz
