[ -d "$PKGNAME" ] && rm -rf "$PKGNAME"
mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz\033[22;0m"
curl -LkOs http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf a52dec-0.7.4.tar.gz >/dev/null 2>&1
cd a52dec-0.7.4
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/a52dec --enable-shared >/dev/null 2>&1
make -j $CORES 2>&1
make install 2>&1
ln -s "$STEWDIR"/Bowls/a52dec/bin/a52dec /usr/local/bin/a52dec >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/a52dec/bin/extract_a52 /usr/local/bin/extract_a52 >/dev/null 2>&1