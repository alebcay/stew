[ -d "$PKGNAME" ] && rm -rf "$PKGNAME"
mkdir "$PKGNAME"
cd "$PKGNAME"
curl -LkOs http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz
tar xzvf a52dec-0.7.4.tar.gz
cd a52dec-0.7.4
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/a52dec --enable-shared
make -j $CORES
make install
ln -s "$STEWDIR"/Bowls/a52dec/bin/a52dec /usr/local/bin/a52dec