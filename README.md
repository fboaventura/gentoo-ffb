# gentoo-ffb
master: [![Build Status master](https://travis-ci.org/fboaventura/gentoo-ffb.svg?branch=master)](https://travis-ci.org/fboaventura/gentoo-ffb)
testing: [![Build Status testing](https://travis-ci.org/fboaventura/gentoo-ffb.svg?branch=testing)](https://travis-ci.org/fboaventura/gentoo-ffb)

## My Gentoo Overlay repository (AKA Disclaimer)

This is my Gentoo local portage overlay.  I keep here ebuilds for programs that are not on the main portage tree or new versions that haven't hit the main tree yet.  I usually open the bug at [Gentoo's Bugzilla](https://bugs.gentoo.org), reporting the version bump or, when there are bugs already open, follow them until the update is released.

This repository is set with two branches [testing](https://github.com/fboaventura/gentoo-ffb/tree/testing), where I, well, test the ebuilds I'm working on and [master](https://github.com/fboaventura/gentoo-ffb) where I pull the validated and tested ebuilds.  They are, somehow, safe to use, since I use them myself, but I can't be held responsible for any issue you may encounter by installing these ebuilds on your machine.

Feel free to open [issues](https://github.com/fboaventura/gentoo-ffb/issues) to request new ebuilds, updates, removals, ... you know the drill. ;-)

*DISCLAIMER*: I can't be held responsible for any problem you may face due to the usage of any ebuild on this repository.

### How to use it

Make sure that you are using `>=sys-apps/portage-2.2.16` and add, inside the folder `/etc/portage/repos.conf/` a file called `gentoo-ffb.conf`, with the following content:

```yaml
[gentoo-ffb]
location = /usr/local/portage/gentoo-ffb
sync-type = git
sync-uri = https://github.com/fboaventura/gentoo-ffb.git
auto-sync = yes
```

For more information, refer to [Gentoo Documentantion](https://wiki.gentoo.org/wiki/Project:Portage/Sync#Operation)

