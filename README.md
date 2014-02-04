stew
====

stew is an the easiest way to deploy packages and run executable code across platforms. If your machine has bash on it, you can use stew.

### Features for end users

- **Easy set up for stew.** Download it and run it. No need to install or compile stuff.
- **Powerful.** stew's code can be used for many other things: becoming a makeshift buildbot (we don't recommend this yet; you're better off using `buildbot` for now), running automated tasks...all with the addition or deletion of just a couple of lines!

### Features for software developers

- **Deploy from anywhere!** All you need is an HTTP, FTP, or other text transfer protocol server supported by curl.
- **Flexible!** If you can configure it in your command line, stew can do it too. And if you can't do it in your command line, don't be afraid to invoke other platforms too.
- **You're in control!** Simply give your end users a URL and a package name and they're off. Need to push a bug fix? Just update your website or FTP server.
- **No bureaucracy!** Unlike `brew`, `ports`, or `apt-get` (which all served as inspiration for this project, and I'd like to give them a shout-out and a thank you), there's no specific guide to what you can and cannot do. There's also no line to wait in to get your package out there. Just write your script, upload it, and go! *DISCLAIMER: There are only one requirement for packages deployed through stew. See "Getting Started for Developers" below.*

### Features for enterprise management

- **Set restrictions where necessary.** stew lives on curl. To block a certain repository, just block it's URL.
- **Easy workstation configuration.** To load stew onto machines with a pre-existing configuration, all you need to do is include a special text file with it.
- **Customizable.** stew is open source. Don't be afraid to patch it up, show some love and make it your own.

### Getting Started For End Users
1. Download stew. There's only one file to download; it can't be that hard.
2. Place it somewhere that you like, because once it's there, you can't move it without breaking everything.
3. Optional: Add a symlink to stew into your PATH to make getting to stew a breeze.
4. Find repositories (or have them given to you). Add them with
<pre>
stew add-stove [URLToStove]
</pre>
Note that the URL that a developer gives you should *never* end with a slash (if it does, do us a favor and remove it from the URL). stew will automatically append end slashes to URLs.
5. View packages that are available (from all stoves) with
<pre>
stew list
</pre>
This could take a while, as all stove sites that are configured for you then need to be queried.
6. Install a package you want.
<pre>
stew install [packageName]
</pre>

- Remove packages: `stew remove [packageName]`
- List installed packages on your system: `stes list installed`
- Remove stove: `stew remove-stove [URLtoStove]`
- List stoves that stew will look up: `stew list-stove`

An IMPORTANT note: `stew` will search stoves in the order they are added through `add-stove`. Therefore, if a package exists by the same name (though not necessarily with the same content) in more than one stove, stew will install the first package it finds. It is thus good measure to add stoves in the priority you want them to be in.

### Getting Started for Developers
1. Set up a public web space. It doesn't matter how it looks from a web browser, as long as it can serve plain text.
2. Create installation scripts for your software. **This is the ONLY requirement for using stew: it MUST install into the folder `$STEWDIR/Bowls/[yourPackageHere]`, where `$STEWDIR` is the directory enclosing the stew program.** Developers are encouraged to symlink binaries into the path somewhere (preferably `/usr/local/bin` or `/opt/local/bin`, where root privileges are not required). If for some reason you do need root privileges, you can always prompt for it with `sudo -k` within your script. *If you need help writing installation scripts, check out the `old` branch of this repo to see some examples.*
3. If possible, add a removal script. This removal script is called when the user runs `stew remove [packageName]`. Your removal script does NOT need to remove the folder `$STEWDIR/Bowls/[yourPackageHere]`; this is done automatically. Instead, the removal script should remove symlinks, data directories, and restore settings to the way before your package would have been installed.
4. Upload the installation script to your web space. They can be in the root, or a subdirectory; it doesn't matter. Scripts must be named with the scheme `[myPackageName].sh` in order for stew to find it. Removal scripts should be placed in the *same* directory as the installation script, with the name `[myPackageName].rm.sh`.
5. If possible, add a file called `RecipeList` to the directory with the scripts that contains a list of all packages you offer on your stove. This list is called when the user runs `stew list`. We recommend you place each package on a separate line, but if you decide to separate package names by spaces or tabs, remember that line wrap can make reading text annoying on the command line.

