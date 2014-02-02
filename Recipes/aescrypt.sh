[ -a "/usr/local/bin/aescrypt" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/aescrypt
[ -a "/usr/local/bin/aesget" ] && rm /usr/local/bin/aesget
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://aescrypt.sourceforge.net/aescrypt-0.7.tar.gz\033[22;0m"
curl -LkOs http://aescrypt.sourceforge.net/aescrypt-0.7.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf aescrypt-0.7.tar.gz >/dev/null 2>&1
cd aescrypt-0.7
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --prefix="$STEWDIR"/Bowls/aescrypt >/dev/null 2>&1
make -j $CORES >/dev/null 2>&1
[ -d "$STEWDIR"/Bowls ] || mkdir "$STEWDIR"/Bowls
[ -d "$STEWDIR"/Bowls/aescrypt ] || mkdir "$STEWDIR"/Bowls/aescrypt
[ -d "$STEWDIR"/Bowls/aescrypt/bin ] || mkdir "$STEWDIR"/Bowls/aescrypt/bin
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aescrypt/bin/aescrypt /usr/local/bin/aescrypt >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aescrypt/bin/aesget /usr/local/bin/aesget >/dev/null 2>&1