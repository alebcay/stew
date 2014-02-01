[ -d "$PKGNAME" ] && rm -rf "$PKGNAME"
mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://aacgain.altosdesign.com/alvarez/aacgain-1.8.tar.bz2\033[22;0m"
curl -LkOs http://aacgain.altosdesign.com/alvarez/aacgain-1.8.tar.bz2
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xjvf aacgain-1.8.tar.bz2
cd aacgain-1.8
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/aacgain --enable-shared
make -j $CORES install
ln -s "$STEWDIR"/Bowls/aacgain/bin/aacgain /usr/local/bin/aacgain