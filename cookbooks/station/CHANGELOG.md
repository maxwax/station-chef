# station CHANGELOG

# 0.4.0

* Added amule and atari++ packages

# 0.3.0

* Enable SSH Server (sshd)

# 0.2.4

* Removing ports 5000/tcp and 5000/udp from firewall attribute.  This was for development and testing purposes only.

# 0.2.3

* Using 'yum_repository' to deploy repo for VirtualBox. Removed some manual code to do the same.

# 0.2.2

* Re-introduce deployment of Virtualbox

# 0.2.1

* In atom recipe, install the atom rpm, not the virtualbox rpm. A bug due to copy & pasting the virtualbox code and re-using it for Atom.
* Set rwx permissions on relocated bootstrap.sh so its easier to run manually after cloning the repo
* Determine if atom is installed via checking node['packages'] not node['package']

# 0.2.0

* Deploy $HOME/.bash_profile

# 0.1.1

* Misc changes not included in CHANGELOG. Moving too fast, workflow distracted.

# 0.1.0

Initial Development Version

- Working on test laptop

