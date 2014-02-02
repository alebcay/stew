 [ -a "/usr/local/bin/ack" ] && echo -e "\033[1;34m--> Package already configured, upgrading instead of installing\033[22;0m" && rm /usr/local/bin/ack
 [ -d "$PKGNAME" ] || mkdir "$PKGNAME"
 cd "$PKGNAME"
 echo -e "\033[1;34m--> Downloading source package: http://beyondgrep.com/ack-2.12-single-file\033[22;0m"
 curl -Os http://beyondgrep.com/ack-2.12-single-file
 echo -e "\033[1;34m--> Opening package\033[22;0m"
 cp ack-2.12-single-file "$STEWDIR"/Bowls/ack/ack
 echo -e "\033[1;34m--> Building $PKGNAME\033[22;0m"
 chmod 0755 "$STEWDIR"/Bowls/ack/bin/ack
 ln -s "$STEWDIR"/Bowls/ack/bin/ack /usr/local/bin/ack