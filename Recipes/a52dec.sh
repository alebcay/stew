[ -a "/usr/local/bin/a52dec" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/a52dec
[ -a "/usr/local/bin/extract_a52" ] && rm /usr/local/bin/extract_a52
[ -a "/usr/local/share/man/man1/a52dec.1" ] && rm /usr/local/share/man/man1/a52dec.1
[ -a "/usr/local/share/man/man1/extract_a52.1" ] && rm /usr/local/share/man/man1/a52dec.1
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz\033[22;0m"
curl -LkOs http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf a52dec-0.7.4.tar.gz >/dev/null 2>&1
cd a52dec-0.7.4
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/a52dec --enable-shared >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/a52dec/bin/a52dec /usr/local/bin/a52dec >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/a52dec/bin/extract_a52 /usr/local/bin/extract_a52 >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/a52dec/man/man1/a52dec.1 /usr/local/share/man/man1/a52dec.1 >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/a52dec/man/man1/extract_a52.1 /usr/local/share/man/man1/extract_a52.1 >/dev/null 2>&1