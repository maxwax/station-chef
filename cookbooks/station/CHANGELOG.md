
# station CHANGELOG

# 0.24.8

Updating /etc/nas.conf with current operating config (manual changes made)

# 0.24.7

* Deploy /etc/proxychains.conf for tunneling local CLI clients to my AWS VPC

# 0.24.6

* Disable deployment of Oracle VirtualBox repo because it doesn't [yet] exist for Fedora 33
* Deploy VirtualBox via FreshRPMs instead

# 0.24.5

* Bug fix: NFS mount point 'auxroot' should be 'auxrootdata' to match the NFS share.

# 0.24.4

* Added packages: gthumb (Image viewer), smem (CLI memory stats reporter), Darkplaces Quake (Old FPS game)

# 0.24.3

* Updated documentation with fixes and updates for Fedora 33 experience

# 0.24.2

* Install 'VirtualBox' package not 'VirtualBox-6.1'
* Note VirtualBox is available via rpmfusion-free and there is not currently an Oracle fedora-33 repo available, it seems.

# 0.24.1

* Removing package 'grizzly' not available for Fedora 33.

# 0.24.0

* Enabling support for Fedora 33 by replacing support for Fedora 31.  Won't be going back and no need to include support for any previous Fedora versions.

# 0.23.3

* Minor changes to $HOME/.bashrc to put various directories in exported variables then use aliases that use the variable.
* Minor documentation on $HOME/.bashrc
* Added maxpol alias to take me to maxlab policyfiles dir

# 0.23.2

* Bump pinned version of chef infra from 15.4 to 15.8.

# 0.23.1

* Updated .santoku.conf to use config.rb instead of legacy knife.rb config file.

# 0.23.0 Updated boostrap-maxlab script

* Adding support to bootstrap nodes with specified policy-group and policy-names
* Adding support to bootstrap nodes without policyfiles or an environment (so they can be set manually later)
* Removed package podman-manfiles from install list
* Added package podman-compose to be installed
* Experimental support for using Test Kitchen with this cookbook.. Fails due to differences between my Fedora install and bento/fedora-31. Will resolve later. This is optional.


# 0.22.1 Adjust $PATH in $HOME/.bashrc

* $HOME/.bashrc: Remove some redundancy between Chef Workstation ruby + gems and system ruby + gems
* $HOME/.bashrc: Add two functions that set ruby to chef workstation or system. (Experimental)
* bootstrap.sh: knife node command to set environment was broken because of an extra 'run_list' within it. Removed this and it should now work.
* station/README.md: Removed redundant text from cookbook docs
* README.md: Documentation update for steps performed by bootstrap.sh

# 0.22.1

* Added thunar file manager to gain a tree capable file manager.

# 0.22.0

* Used 'chef shell-init bash' to generate some Chef oriented bash settings and drop them in $HOME/.bashrc

# 0.21.4

* Screen real estate mgmt: Updated coding.conf config file to load sideleft and sideright windows below test and far.

# 0.21.3

* Deploy coding v1.1.0

# 0.21.2

* Alias for bc that uses -q to suppress warranty warning
* Moved my auxillary monitor from right side of main display to left, so updated position.conf and coding.conf to position and size well used apps and terminal windows.
* Deployed updated position script from github.

# 0.21.1

* Deploy nas 1.2.0 script.

# 0.21.0

* Added fedora-media-writer and livecd-to-mediums packages.

# 0.20.2

* Back to VirtualBox-6.1 because Oracle's Virtualbox repos have a bad build for VirtualBox-6.0 that won't compile anymore.

# 0.20.1

* Downgrading auto install of VirtulBox from 6.1 to 6.0. Vagrant doesn't support 6.1 yet.

# 0.20.0

* Adding package dependencies for VirtualBox-6.1

# 0.19.2

* More fixes and such to update-maxlab-chef script. Script now works in a wildcard fashion so I can submit multiple phrases and any cookbooks or data bags which meet those phrases will be uploaded to my local Chef server for testing.

# 0.19.1

* Fixed bug in script update-maxlab-chef, and added a second status statement within it.

# 0.19.0

* Added 'update-maxlab-chef' script for deployment to $HOME/bin.

# 0.18.0

* Add documentation to list of packages to be installed by converting it from an array to a hash.  Add summary of each package in the attributes file.  Modify the recipe to construct an array of package names and then call the package resource once to install everything.  This will help me understand why I have things installed
* Adding new packages:
  * gdbm-devel - to resolve issues with building ruby gems dbm and gdbm
  * ruby-devel - to resolve issues updating and building ruby gems

# 0.17.0

* At the end of the Chef run using station to provision this node, tag it with 'station-managed' as a way of marking that this is in fact managed by station.  This was a first test of adding tags within a recipe.

# 0.16.0

* Trying out a method to use node['station']['remote_scripts']['install_scripts'] to track the scripts that have been downloaded, untarred and installed via shell script.  If not seen as installed, install it and store the script name and version in a normal level node attribute.  Next chef run, see this and don't attempt to re-install the same version.  Worth a try.

# 0.15.0

* Moved firewall configuration from under user config attributes to higher level node['station']['firewall'].  Things under node['station']['user'] should be specific to my user while top level items should be system wide configuration -- like firewall settings.

# 0.14.6

* Remove work.desktop files. Let 'position' remote script deploy this as position.desktop

# 0.14.5

* Deploy GNOME .desktop files to enable launcher shortcuts.
* Added static shortcut .desktop files to this cookbook

# 0.14.4

* Update vital-backup to deploy v1.2.0

# 0.14.3

* Bug fix: Don't check for connection to maxlab home network by checking for node['domain']. Since the FQDN on this workstation is set statically, it will always return 'maxlab' even if connected elsewhere.
* Instead: Just check gateway for now and we'll come back to this later.  Noted near the code that this is not an ideal way to do this.
* Had two untar actions while installing typefaces.  Removed the redundant, unused one where we untarred to an untar directory then were going to move the files to /usr/share/fonts.  Now just untar with a cwd in /usr/share/fonts.
* Changed variable name untar_dir to download_dir to reflect the change above.

# 0.14.2

* Bug fix: Create config directories for roxterm such as Colors and Profiles

# 0.14.1

* Deploy typefaces using .tgz not .tar suffix
* Add maxwell-fonts-atari to typefaces list
* Deploy roxterm and configure it

# 0.14.0

* Deploy additional typefaces from local repo.maxlab file server

# 0.13.0

* Remove some automatically install font rpms that I don't use.

# 0.12.0

* Added recipe other_groups to add additional groups to the system related to other resources in my environment

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
