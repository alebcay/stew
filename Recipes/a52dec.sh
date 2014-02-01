[ -d "$PKGNAME" ] && rm -rf "$PKGNAME"
mkdir "$PKGNAME"
cd "$PKGNAME"
curl -Lks http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz > a52dec.tar.gz
tar xz a52dec.tar.gz
cd a52dec-0.7.4.tar.gz
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/a52dec --enable-shared
make -j $CORES
make install
ln -s "$STEWDIR"/Bowls/a52dec/bin/a52dec /usr/local/bin/a52dec