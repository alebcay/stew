stew
====

stew is (another) package manager made for the Mac OS X platform. The name is a spinoff of the Homebrew package manager.

### Features

- Written in bash from top to bottom. Extensible and customizable

(more features are on the way, see section "Planned Features" for details)


### Installation

You can clone this Git repository, but you only need to acquire the file named "stew" that is located in the root of this directory. **In fact, I strongly warn against cloning this Git repository, because you then get a handful of the installation scripts, which could get annoying.** Once you have this file stew, place it anywhere you want, and ensure that it is executable. All packages installed through stew will be in the same directory as it, so be sure to put it somewhere convenient. After that, if you desire, simply add a symlink to stew into your path, so that your life becomes easier. Once your optional symlink is set up, simply run
<pre>
stew install <package>
</pre>
to install packages. *DO NOT* move or rename the stew directory (the directory stew is placed in), or any of the subdirectories created by stew (Recipes and Bowls), as this will disrupt symlinks to the programs.

### Usage

Packages can be installed with `stew install <package>` and removed with `stew remove <package>`. We may occasionally update the versions of applications provided as they are released. To update to the latest version of a package, just install it again with `stew install <package>`.


Package configuration and sources are stored in `<STEW_DIRECTORY>/Recipes`. They aren't cleaned out regularly, in case you want to preserve the older source of a package. To clean out the recipes and the source code from packages, simply run `stew clean` and the recipe box will be emptied.

### Planned Features

- Ability to use your own repositories - sort of like PPAs in apt-get
- More packages (duh!), we only have a handful right now; we're trying to catch up to Homebrew's repository right now
