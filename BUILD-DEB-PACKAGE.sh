VERSION=`cat VERSION`
TEMP_DIR="perdita_${VERSION}_all"

# Make a directory with the package content (temporary)
mkdir $TEMP_DIR

# Make package directories and structure
mkdir -p $TEMP_DIR/usr/local/bin
mkdir -p $TEMP_DIR/DEBIAN

# Copy binary file
cp perdita $TEMP_DIR/usr/local/bin


# Creates control file
touch $TEMP_DIR/DEBIAN/control

echo """
Package: Perdita
Version: ${VERSION}
Architecture: all
Maintainer: Juanjo Salvador <juanjosalvador@netc.eu>
Description: Durango-X Homebrew Computer Emulator
""" > $TEMP_DIR/DEBIAN/control

# Create postinst script
touch $TEMP_DIR/DEBIAN/postinst

# echo """
# mkdir -p /usr/local/man/man1
# cp man/dog.1 /usr/local/man/man1/dog.1
# gzip /usr/local/man/man1/dog.1
# mandb
# """ > $TEMP_DIR/DEBIAN/postinst
chmod 0755 $TEMP_DIR/DEBIAN/postinst

# Building the package
dpkg-deb --build --root-owner-group $TEMP_DIR

rm -rf $TEMP_DIR