stew
====

stew is an the easiest way to deploy packages and run executable code across platforms. If your machine has bash on it, you can use stew.

### Features for end users

- **Easy set up for stew.** Download it and run it. No need to install or compile stuff.
- **Forget sudo!** We don't touch the sensitive parts of your system, as we don't want you messing with ours' either.
- **Use packages as if they came bundled!** Don't bother remembering absolute paths, stew does the symlinking for you!
- **We include man-files!** Don't worry about developers leaving you in the dark.

### Features for software developers

- **Deploy from anywhere!** All you need is an HTTP, FTP, or other text transfer protocol server supported by curl.
- **Flexible!** If you can configure it in your command line, stew can do it too. And if you can't do it in your command line, don't be afraid to invoke other platforms too.
- **You're in control!** Simply give your end users a URL and a package name and they're off. Need to push a bug fix? Just update your website or FTP server.
- **No bureaucracy!** Unlike `brew`, `ports`, or `apt-get` (which all served as inspiration for this project, and I'd like to give them a shout-out and a thank you), there's no specific guide to what you can and cannot do. There's also no line to wait in to get your package out there. Just write your script, upload it, and go!

### Features for enterprise management

- **Set restrictions where necessary.** stew lives on curl. To block a certain repository, just block it's URL.
- **Easy workstation configuration.** To load stew onto machines with a pre-existing configuration, all you need to do is include a special text file with it.
- **Customizable.** stew is open source. Don't be afraid to patch it up, show some love and make it your own.
