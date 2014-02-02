[ -a "/usr/local/bin/acme" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/acme
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme/current/acme091src.tar.gz\033[22;0m"
curl -LkOs http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme/current/acme091src.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf acme091src.tar.gz >/dev/null 2>&1
cd acme091
cd src
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
make -j $CORES install BINDIR="$STEWDIR"/Bowls/acme/bin >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acme/bin/acme /usr/local/bin/acme >/dev/null 2>&1