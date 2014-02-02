[ -a "/usr/local/bin/acpibin" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/acpibin
[ -a "/usr/local/bin/acpidump" ] && rm /usr/local/bin/acpidump
[ -a "/usr/local/bin/acpiexec" ] && rm /usr/local/bin/acpiexec
[ -a "/usr/local/bin/acpihelp" ] && rm /usr/local/bin/acpihelp
[ -a "/usr/local/bin/acpinames" ] && rm /usr/local/bin/acpinames
[ -a "/usr/local/bin/acpisrc" ] && rm /usr/local/bin/acpisrc
[ -a "/usr/local/bin/acpixtract" ] && rm /usr/local/bin/acpixtract
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: https://acpica.org/sites/acpica/files/acpica-unix2-20130823.tar.gz\033[22;0m"
curl -LkOs https://acpica.org/sites/acpica/files/acpica-unix2-20130823.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf acpica-unix2-20130823.tar.gz >/dev/null 2>&1
cd acpica-unix2-20130823
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
make -j $CORES HOST=_APPLE PREFIX="$STEWDIR"/Bowls/acpica >/dev/null 2>&1
make -j $CORES install HOST=_APPLE PREFIX="$STEWDIR"/Bowls/acpica >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acpica/bin/acpibin /usr/local/bin/acpibin >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acpica/bin/acpidump /usr/local/bin/acpidump >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acpica/bin/acpiexec /usr/local/bin/acpiexec >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acpica/bin/acpihelp /usr/local/bin/acpihelp >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acpica/bin/acpinames /usr/local/bin/acpinames >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acpica/bin/acpisrc /usr/local/bin/acpisrc >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/acpica/bin/acpixtract /usr/local/bin/acpixtract >/dev/null 2>&1
