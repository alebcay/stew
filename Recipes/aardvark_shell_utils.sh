[ -a "/usr/local/bin/filebase" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/filebase
[ -a "/usr/local/bin/fileext" ] && rm /usr/local/bin/fileext
[ -d "$PKGNAME" ] || mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://downloads.laffeycomputer.com/current_builds/shellutils/aardvark_shell_utils-1.0.tar.gz\033[22;0m"
curl -LkOs http://downloads.laffeycomputer.com/current_builds/shellutils/aardvark_shell_utils-1.0.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf aardvark_shell_utils-1.0.tar.gz >/dev/null 2>&1
cd aardvark_shell_utils-1.0
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/aardvark_shell_utils >/dev/null 2>&1
make -j $CORES install >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aardvark_shell_utils/bin/filebase /usr/local/bin/filebase >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aardvark_shell_utils/bin/fileext /usr/local/bin/fileext >/dev/null 2>&1
ln -s "$STEWDIR"/Bowls/aardvark_shell_utils/bin/realpath /usr/local/bin/realpath >/dev/null 2>&1