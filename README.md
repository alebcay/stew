stew
====

stew is (another) package manager made for the Mac OS X platform. The name is a spinoff of the Homebrew package manager.

### Features

- Written in shell script from top to bottom. Extensible and customizable
- Add your own repositories, much like PPAs on Ubuntu and apt-get.

(more features are on the way, see section "Planned Features" for details)


### Installation

1. Download stew. It all resides in one file, so who needs archives? Get it at https://raw.github.com/alebcay/stew/master/stew
2. Move stew to a desired directory. All packages installed through stew will be stored also in this directory, so take that into account when choosing a good spot. **After you make your decision, you cannot rename or otherwise change the path to stew or any of it's created subdirectories without installation and removal of packages breaking. If you must move stew, uninstall all of your packages first, then install re-install them after moving.**
3. View a list of available packages with `stew list`. Install any of them with `stew install [packageName]`.

### Usage

Packages can be installed with `stew install <package>` and removed with `stew remove <package>`. We may occasionally update the versions of applications provided as they are released. To update to the latest version of a package, just install it again with `stew install <package>`.


Package configuration and sources are stored in `<STEW_DIRECTORY>/Recipes`. They aren't cleaned out regularly, in case you want to preserve the older source of a package. To clean out the recipes and the source code from packages, simply run `stew clean` and the recipe box will be emptied.

### Using Your Own Repositories

Got your own software you want to have deployed? You don't have to even send a pull request! Simply make a GitHub repo (or any web server that can serve text files will work). Place the shell scripts used for installation and removal in the repo or server. The installation scripts should be named `<PackageName>.sh` and the removal scripts should be named `<PackageName>.rm.sh`. Finally, to instruct stew to search for the packages on your server, run
<pre>
stew add-stove <URLtoEnclosingFolderOfScripts>
</pre>
where <URLtoEnclosingFolderOfScripts> is the URL to the enclosing folder of your scripts. For example, the URL to the Recipes folder that houses the scripts on this repo is https://raw.github.com/alebcay/stew/master/Recipes. **DO NOT INCLUDE A TRAILING BACKSLASH ON THIS URL, IT WILL BE AUTOMATICALLY APPENDED.** Stovetops (aka servers) added will be listed in the file StoveList in your Stew directory. To view the list of stovetops that stew will check when installing packages, run
<pre>
stew list-stove
</pre>
Stovetops are listed in the order in which they were added. This is also the order in which they are checked during installation. We strongly recommend that if you add an install script for a package in your repository, that you also add a removal script. It is also encouraged that you keep your scripts' output clean and similar to that of the scripts in this official repository to ensure regularity.
Finally, to remove a stovetop, run
<pre>
stew remove-stove [URLThatYouWantToRemove]
</pre>
where URLThatYouWantToRemove is the exact URL you entered earlier. If you can't quite remember, just run `stew list-stove`.

### Planned Features

- ~~Ability to use your own repositories - sort of like PPAs in apt-get~~ DONE!
- More packages (duh!), we only have a handful right now; we're trying to catch up to Homebrew's repository right now
