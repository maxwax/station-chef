# station CHANGELOG

# 0.11.0

* Deploy smartpcap script to capture storage devices S.M.A.R.T. health values

# 0.10.5

Updated coding.conf positioning for home office after experiencing terminal position and size issues on Fedora 31.  Might be Fedora 31 problems, might be using a non-standard GNOME theme. This helps me get work done.

# 0.10.4

* Replaced 'knife X' command with 'santoku maxlab X' commands in my personal bootstrap-maxlab command.  This ensures the knife commands required only execute against the maxlab environment and not whatever active $HOME/.chef/knife.rb file is set to use.
* Added a variety of echo statements to let users know what the script is doing. It's rather slow, so this helps be much more user friendly as users wait.

# 0.10.3

* Whoops.. Replace blue.maxlab hard coding with ${NODE} not ${NODE}.maxlab.  I'm running to fast, but testing caught this quickly.

# 0.10.2

* Fix bug in 'bootstrap-maxlab' script where hard coded node name blue.maxlab was used instead of ${NODE} parameter

# 0.10.1

* Deploy upated versions of 'coding' and 'position' from github
* Deploy config files for coding (.coding.conf) and position (.position.conf) using new .conf names.

# 0.10.0

* Deploy 'santoku' wrapper script for Chef knife command.

# 0.9.0

* Add recipe 'fstrim' to activate periodic TRIM actions on SSD drives.

# 0.8.3

* Install nas v1.1.1

# 0.8.2

Atom removed the final newline on the final config line of /etc/nas.conf and broke the script. Adding it back.


# 0.8.1

* Changing nfs mount points from filer-offsite4tb to offsite4tb-filer.

# 0.8.0

* Pull down newly written safe 2.0.0.  Updated attributes to do this.

# 0.7.1

* Cleaned up NAS config file.
* Using NFSv4 by default on Fedora 31. Firewall appears to block NFSv3
* Add additional NFS mount point shares via attribute list

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
