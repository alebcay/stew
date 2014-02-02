[ -a "/usr/local/bin/aespipe" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/aespipe
[ -a "/usr/local/share/man/man1/aespipe.1" ] && rm /usr/local/share/man/man1/aespipe.1

[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://loop-aes.sourceforge.net/aespipe/aespipe-v2.4c.tar.bz2\033[22;0m"
curl -LkOs http://loop-aes.sourceforge.net/aespipe/aespipe-v2.4c.tar.bz2
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xjvf aespipe-v2.4c.tar.bz2 >/dev/null 2>&1
cd aespipe-v2.4c
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --prefix="$STEWDIR"/Bowls/aespipe >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aespipe/bin/aespipe /usr/local/bin/aespipe >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aespipe/share/man/man1/aespipe.1 /usr/local/share/man/man1/aespipe.1 >/dev/null 2>&1