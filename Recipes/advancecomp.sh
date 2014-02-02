[ -a "/usr/local/bin/advdef" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/advdef
[ -a "/usr/local/bin/advmng" ] && rm /usr/local/bin/advmng
[ -a "/usr/local/bin/advpng" ] && rm /usr/local/bin/advpng
[ -a "/usr/local/bin/advzip" ] && rm /usr/local/bin/advzip
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://downloads.sourceforge.net/advancemame/advancecomp-1.18.tar.gz\033[22;0m"
curl -LkOs http://downloads.sourceforge.net/advancemame/advancecomp-1.18.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf advancecomp-1.18.tar.gz >/dev/null 2>&1
cd advancecomp-1.18
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/advancecomp >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/advancecomp/bin/advdef /usr/local/bin/advdef >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/advancecomp/bin/advmng /usr/local/bin/advmng >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/advancecomp/bin/advpng /usr/local/bin/advpng >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/advancecomp/bin/advzip /usr/local/bin/advzip >/dev/null 2>&1