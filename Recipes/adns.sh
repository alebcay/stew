[ -a "/usr/local/bin/adnssheloex" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/adnssheloex
[ -a "/usr/local/bin/adnshost" ] && rm /usr/local/bin/adnshost
[ -a "/usr/local/bin/adnslogres" ] && rm /usr/local/bin/adnslogres
[ -a "/usr/local/bin/adnsresfilter" ] && rm /usr/local/bin/adnsresfilter
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://www.chiark.greenend.org.uk/~ian/adns/ftp/adns-1.4.tar.gz\033[22;0m"
curl -LkOs http://www.chiark.greenend.org.uk/~ian/adns/ftp/adns-1.4.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf adns-1.4.tar.gz >/dev/null 2>&1
cd adns-1.4
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/adns --disable-dynamic >/dev/null 2>&1
make -j $CORES >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/adns/bin/adnsheloex /usr/local/bin/adnsheloex >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/adns/bin/adnshost /usr/local/bin/adnshost >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/adns/bin/adnslogres /usr/local/bin/adnslogres >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/adns/bin/adnsresfilter /usr/local/bin/adnsresfilter >/dev/null 2>&1