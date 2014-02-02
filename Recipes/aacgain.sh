[ -a "/usr/local/bin/aacgain" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/aacgain
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://aacgain.altosdesign.com/alvarez/aacgain-1.8.tar.bz2\033[22;0m"
curl -LkOs http://aacgain.altosdesign.com/alvarez/aacgain-1.8.tar.bz2
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xjvf aacgain-1.8.tar.bz2 >/dev/null 2>&1
cd aacgain-1.8
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/aacgain --enable-shared >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aacgain/bin/aacgain /usr/local/bin/aacgain >/dev/null 2>&1