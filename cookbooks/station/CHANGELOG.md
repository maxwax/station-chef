# station CHANGELOG

# 0.7.0

* Deploy custom script config files in /etc for system wide use

# 0.6.0

* Deploying dot files for root user in /root

# 0.5.0

* Adding support to create NFS mount directories. Actual mounting performed by 'nas' script'

# 0.4.4

* Bug fix: When untarring a remote script for /usr/local/bin, cwd should be /tmp not /tmp/coding, etc.

# 0.4.3

* Adding deployment of 'position' script from github as a /usr/local/bin script.

# 0.4.2

* Fixing gnome-terminal postiions and sizes for Feodra 31.

# 0.4.1

* Typo in gpgkey of VirtualBox yum_repository resource.  Copy & paste error found upon testing.

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

