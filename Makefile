SOURCE="https://netix.dl.sourceforge.net/project/openofficeorg.mirror/4.1.7/binaries/en-US/Apache_OpenOffice_4.1.7_Linux_x86-64_install-deb_en-US.tar.gz"
DESTINATION="build.tar.gz"
OUTPUT="Open-Office.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	tar -zxvf $(DESTINATION)

	scripts/unpack.sh en-US/DEBS

	rm -rf AppDir/opt
	mkdir --parents AppDir/opt/application
	cp -r build/opt/openoffice4/* AppDir/opt/application

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	# rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf en-US
	rm -rf build
