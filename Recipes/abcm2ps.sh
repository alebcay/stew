[ -a "/usr/local/bin/abcm2ps" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/abcm2ps
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://moinejf.free.fr/abcm2ps-6.6.22.tar.gz\033[22;0m"
curl -LkOs http://moinejf.free.fr/abcm2ps-6.6.22.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xjvf aacgain-1.8.tar.bz2 >/dev/null 2>&1
cd aacgain-1.8
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/aacgain --enable-shared >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/abcm2ps/bin/aacgain /usr/local/bin/abcm2ps >/dev/null 2>&1