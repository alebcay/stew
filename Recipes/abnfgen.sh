[ -a "/usr/local/bin/abnfgen" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/abnfgen
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://www.quut.com/abnfgen/abnfgen-0.16.tar.gz\033[22;0m"
curl -LkOs http://www.quut.com/abnfgen/abnfgen-0.16.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf abnfgen-0.16.tar.gz >/dev/null 2>&1
cd abnfgen-0.16
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/abnfgen >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/abnfgen/bin/abnfgen /usr/local/bin/abnfgen #>/dev/null 2>&1