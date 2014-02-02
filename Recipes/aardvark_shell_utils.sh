[ -d "$PKGNAME" ] && rm -rf "$PKGNAME"
mkdir "$PKGNAME"
cd "$PKGNAME"
echo -e "\033[1;34m--> Downloading source package: http://downloads.laffeycomputer.com/current_builds/shellutils/aardvark_shell_utils-1.0.tar.gz\033[22;0m"
curl -LkOs http://downloads.laffeycomputer.com/current_builds/shellutils/aardvark_shell_utils-1.0.tar.gz
echo -e "\033[1;34m--> Opening package\033[22;0m"
tar xzvf aardvark_shell_utils-1.0.tar.gz
cd aardvark_shell_utils-1.0
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
./configure --disable-debug --disable-dependency-tracking --prefix="$STEWDIR"/Bowls/aardvark_shell_utils
make -j $CORES install
ln -s "$STEWDIR"/Bowls/aardvark_shell_utils/bin/filebase /usr/local/bin/filebase
ln -s "$STEWDIR"/Bowls/aardvark_shell_utils/bin/fileext /usr/local/bin/fileext
ln -s "$STEWDIR"/Bowls/aardvark_shell_utils/bin/realpath /usr/local/bin/realpath