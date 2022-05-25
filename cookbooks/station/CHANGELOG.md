
# station CHANGELOG

# 0.33.3

* Deploying cronjob for root to run hot-tub-timemachine periodically for snapshot backups

# 0.33.2

* Removed an unused desktop shortcut file called .new
* Updated timemachine config to backup individual personal directories instead of all files.  This should greatly cut down on timemachine backups of files that don't need to be backed up.

# 0.33.1

* Fedora 36 Support is being added
* Adjust bootstrap script to place chef rpm in /home/$SUDO_USER/Downloads.  Past breadcrumbs suggest I've struggled with this including using $LOGUSER for the same.  The issue is that when you run bootstrap via sudo, things like ~ and $HOME are /root and I want them in my user's Downloads directory.  We'll try this for now which works.
* Add 'when' in default attributes file for Fedora 36 with packages
* Removing 'fx' package which is not available in default packages
* Deploy .desktop file for pycharm. Not installing pycharm yet.
* Added default attributes for pycharm for future installation work.
* Using updated gnome-terminal icons for personal terminal .desktop shortcuts

# 0.32.2

* Added pycharm path to $HOME/.bashrc

# 0.32.1

* Update $HOME/.open-tunnel-nimbushoio.conf to point to SSH key file aws-nimbus-ohio

# 0.32.0

* Download open-tunnel script v0.9.3
* Updated multiple open-tunnel config files deployed to $HOME/.open-tunnel*.conf.  These now use 'ncat' as default

# 0.31.4

* Updated tuncloud script. Seems I had a work in progress in the past and left it incomplete. Fixed, but not tested much because I'm in a rush for other work.
* Updated $HOME/.tuncloud.conf to add TUNCLOUD_DEFAULT_REGION variable

# 0.31.3

* Second: Minor update of position.conf for cloud study window positions.

# 0.31.2

* Minor update of position.conf for cloud study window positions.

# 0.31.1

* Add root crontab to backup /root/.bash_history

# 0.31.0

* Major cleanup using cookstyle.  Tested in a VM on a fresh Fedora 35 installation and tested on sarko with existing chef provisioned environment.

# 0.30.0

* Adding recipe 'cron_jobs.rb' to configure cron jobs to execute previously deployed scripts on a periodic basis.  Ex: Run cron-backup-history every Sunday, once a week.
* Adding 'fdupes' to standard packages to be installed

# 0.29.1

* Updating attributes to deploy the scripts just added to the repo

# 0.29.0

* Adding the chefpush script to deploy into $HOME/bin
* Adding script 'fix-ipad-images'. Used in the past to identify the proper image format of photos saved on an iPad and being accessed on Linux.  (Ex: File is .png but labeled .jpg)
* Adding script 'inventory-scan'.  Used recently to scan 'source' and 'backup' index files containing file lists of source (NAS data) and backup (external HD) data to help find duplicated data.
* Adding script 'wifi-inventory-location'. Used to walk different physical locations to perform WIFI signal strength mapping.

# 0.28.1

* Modify mount_points so subdirectories are created with maxwell:maxwell permissions

# 0.28.0

* Adding 'export HISTCONTROL=erasedups' to .bashrc to skip recording duplicate commands
* Adding 'export HISTTIMEFORMAT="[%F %T] "' to record date/time in history file
* Adding 'export HISTFILE=~/.bash_history_eternal' to record history in alternate file per internet warnings that some files truncate $HOME/.bash_history

# 0.27.0

* Add export VAGRANT_DEFAULT_PROVIDER=virtualbox to $HOME/.bashrc to direct Vagrant to use Virtualbox as default provider

# 0.26.0

* Adding linux-timemachine backup script from github for deployment
* Bug fix in aws_cli deployment to do a cleanup delete of the download/install directory.
* Deploy /etc/gdm/custom.conf file that switches from Wayland to X11 for displays. This eliminates a manual step in the re-install process

# 0.25.66

* Added a lot of guards on each resource to skip steps when a typeface is already installed.  Since each typeface is downloaded from the internet and takes a few seconds to do so, this is a considerable time savings if they are (likely) already installed.
* Added a not_if_dir to the typeface related attributes which allows each typeface to be checked to see if it is already installed signaled by the presence of its typeface directory in /usr/share/fonts

# 0.25.65

* Move execution of firewall code to bottom to be more consistent with the operation of my maxlab cookbook code.

# 0.25.65

* Apply multiple guards on the creation / cleanup-deletion of the /tmp directory used to download and install the AWS cli.
* Name reach code block uniquely for best practices

# 0.25.63

* For AWS cli install, download and unzip in a unique directory in /tmp
* Delete any previous install/download directory in /tmp
* After successful install, delete the install/download directory in /tmp

# 0.25.62

* Updated bootstrap-maxlab script with current changes.

# 0.25.61

* Another attempt to get Atom to install without manual confirmation of repo gpgkey.  Trying to make the repo with Chef yum_repository resource.


# 0.25.60

* Bug Fix: Import keys for Atom repo if the package isn't already installed, replacing a guard against whether the key was already installed.  Since we have to install keys in two ways, once the first way is done, the old guard skipped the second way.
* Attempting to pass "yes" to Chef installation prompt

# 0.25.59

* Bug Fix: Change use of USERNAME script in bootstrap.sh to POSIX $LOGNAME. USERNAME exists later, but not on an absolutely fresh install, it seems.
* Bug Fix: When importing GPG keys in atom.rb, name each block uniquely. Copy & paste error, oops.
* When importing Google keys use rpm --import and rpmkeys --import

# 0.25.58

* Bug fix: Import repo keys with 'rpm --import' and 'rpmkeys --import' commands -- both of them.  Per https://access.redhat.com/solutions/3720351 this is required in RHEL 8, later versions of Fedora and assuming, CentOS.

# 0.25.57

* Bug fix: When creating directories to store config script, make sure they are executable by owner so files within them can be accessed.  Impacts $HOME/.vim and $HOME/.vim/colors causing an error when vim launches and the $HOME/.vimrc wants to load the solarized color config in $HOME/.vim/colors/solarized.vim

# 0.25.56

* Personal $HOME/.bashrc cleanup:
* Remove inclusion of $HOME/.gem - this looks like legacy Ruby work
* Set variables CHEF_GEM_HOME,CHEF_GEM_ROOT,CHEF_GEM_PATH so they can be set properly using use_chef_ruby functions
* Remove some previously used but commented out code related to past configuration work for Chef+Ruby.  The new code works, so this is no longer needed even for reference.

# 0.25.55

* Replace a single mode attribute with two mode attributes: one for files deployed as executable and one for files deployed as config files.
* Add the same mode executable/config file attributes for root user for files deployed in /root
* Modify solarized.rb to deploy config files using a config file specific file mode octal.
* Deploy config files in /etc with root's config file octal.
* Remove roxterm.rb recipe, haven't used it in years
* In user.rb place static mode octals in single quotes for consistency
* In shortcuts.rb use root's octal for config file.
* In google-chrome.rb use root's config file octal to deploy google chrome repo in /etc

# 0.25.54

* Create and maintain mount points in /net for NFS shares as owner/group maxwell:maxwell so I can access personal files.

# 0.25.53

* Remove roxterm, haven't used it in years
* Re-enable deployment of Skype

# 0.25.52

* Modify fstrim.rb to enable fstrim.timer systemd unit via Chef systemd resource instead of calling out to a bash command.

# 0.25.51

* Include libffi-devel to aide in updating Ruby gem ffi

# 0.25.50

* Including updated bootstap-maxlab script. Needs more testing, but lets check it in.

# 0.25.49

* Update nas.conf to add NFS share /srv/terawd from depot.maxlab
* Update $HOME/coding.conf to reposition east, mid and west windows to accommodate the primary monitor being physically lowered
* Updating $HOME/.bashrc with updated Chef use of ruby 3.0.0, so commenting out past use of ruby 2.6.0 and adjusting. This is an attempt towards getting Test Kitchen and vagrant working again.

# 0.25.48

* Deploy g++ so some Ruby gems can compile.  This fulfills a dependency for gems helping vagrant helping test kitchen helping Chef development.

# 0.25.47

* Update on NAS /etc/nas.conf config file for tv320 drive moving from media to central
* Cleanup on NAS /etc/nas.conf config file

# 0.25.46

* Added nmon real time system performance monitor
* Added bat, an improved cat command
* Added httpie, a command line HTTP API Utility
* Added exa, an enhanced ls
* Added fx, a JSON cli utility

# 0.25.45

* Add /net/depotdata NFS mount point
* Rename offsite4tb-filer and offsite4tb-aux as 'usb-filer', 'usb-aux', etc.

# 0.25.44

* Deploy mu-editor, a very user friendly editor for Python tutorials

# 0.25.43

* Deploy iperf3. Was deployed in the past, not sure why I removed it.

# 0.25.42

* Removing terminator since I never use it
* Adding iperf3 since I use that a lot

# 0.25.41

* Modify safe.conf to rename old safe files as archive-<safe> so I can open them but don't unless I go out of my way to do so.

# 0.25.40

* Deploy safe v2.0.3 from github

# 0.25.39

* Deploy safe v2.0.2 from github

# 0.25.38

* Deploy safe configuration file safe.conf via Chef, add new safe locker 'maxwell'
* Deploy bc configuration file bcrc via Chef
* Added "Deployed by Chef" header to a variety of config files

# 0.25.37

* Add sarkometal to vital-backups.conf for backup to USB key

# 0.25.36

* Deploy /etc/systemd/logind.conf with an uncommented line to Inhibit the handling of the closed laptop lid as a trigger to suspend the laptop.  Resolves an issue where first booting up and logging in causes logind to report "Can't lock display - Lock disabled by application" and then immediately suspend the laptop.

# 0.25.35

* Add mounting of x320 archive directory on NAS central

# 0.25.34

* Install xrandr X Display Utility

# 0.25.33

* Modifying the bootstrap installer to remove manual processes and error handling for wget of chef

# 0.25.32

* Deploy open-tunnel v0.9.1 via github.

# 0.25.31

* Add eight open-tunnel config files for deployment
* Stop deploying tuncloud.conf

# 0.25.30

* Update window size and position for KeepassXC which requires more screen space than Keepass

# 0.25.29

* Install xwininfo utility which reports information such as size and position on windows.

# 0.25.28

* Install gnome-extensions-app to replace functionality removed from TweakUI app

# 0.25.27

* Replace KeepassX with KeepassXC

# 0.25.26

* OK, ok, install telnet by default

# 0.25.25

* Fedora 35 support
* Add xdpyinfo
* Packages list for Fedora 35 now sorted alphabetically
* Configure powerline via config file in $HOME/.config/powerline/themes/shell/default_leftonly_maxwell.json
* Deploy Google Chrome repo if not deployed AND enabled
* Import Atom repo GPGkey if not already installed (WIP)
* Remove pidgin-logviewer package from Fedora 35 set
* Removed duplicate request for bpytop

# 0.25.24

* Deploy bpytop performance monitor

# 0.25.23

* Enable vim in gnome-terminal to use solarized color scheme even when not using solarized colors in bash. Minor $HOME/.vimrc config option added.

# 0.25.22

* Deploy $HOME/.vim/colors/solarized.vim for Solarized VIM color scheme

# 0.25.21

* Install Atom gpg key from downloaded file not URL

# 0.25.20

* Modify bootstrap to skip chef install if already installed

# 0.25.19

* Install Python IDE "Spyder"

# 0.25.18

* Add support for Fedora 34
* Install chef rpm as $HOME/Downloads/chef*rpm not chef*workstation*rpm

# 0.25.17

* Deploy SF Pro typeface

# 0.25.16

* Added deployment of open-tunnel script from github

# 0.25.15

* Adding hot-tub-timemachine and config file deployment

# 0.25.14

* Improving handling of shutter window positioning so it positions shutter window not others with 'Shutter' in the title bar

# 0.25.13

* Removed 'compression=no' from tuncloud script.

# 0.25.12

* Deploy place.desktop file instead of position.desktop file.

# 0.25.11

* Cleanup of typefaces.rb recipe
* Only run fc-cache once, after all new typefaces installed
* Removed previous obsolete comments

# 0.25.10

* Delete /tmp/typefaces after downloaded files contents have been extracted.

# 0.25.9

* Download typefaces from my website instead of maxlab file repo. Experimental.

# 0.25.8

* Typefaces install: create /tmp/typesfaces only once, not multiple times.

# 0.25.7

* Disable install of Skype

# 0.25.6

* Updating vital-backup config with recent manual changes after NAS storage rebuild and re-org

# 0.25.5

* Updating NFS mounts in /etc/nas.conf

# 0.25.4

* Updating NFS mount directories

# 0.25.3

* New version of 'tuncloud' script with recent dev work.

# 0.25.2

* Update santoku config file with pass key 'maxwell' instead of 'chef-maxwell' (reflects current key name, discards lost key)

# 0.25.1

* Update powerline config with manual changes

# 0.24.34

* Updated .coding.conf in home directory to ensure 'right' and 'east' windows don't overlap.

# 0.24.33

* Updated README.md for cookbook as part of another re-install and experience observed
* Modified code to determine if remote scripts should be redeployed. It was broken and scripts weren't deployed.
* Re-worked the condition logic for remote script deployment to be legibile even if its slightly slower. When it doesn't look good, it leads to faults as I just experienced with this re-install.
* Introduced condition_file to define where each remote script is deployed locally so we can check to see if the file exists or not.
* I should just package my personal scripts as rpms and avoid all this, but..

# 0.24.32

* Deploy bpytop, an even better top. Very modern looking.

# 0.24.31

* Deploy atop and ddrescue CLI commands

# 0.24.30

* Minor rules changes to position.conf

# 0.24.29

* Deploy 'sshcloud' and 'tuncloud' scripts from cookbook. They're not generalized so no point in posting them on github.

# 0.24.28

* Deploy proxychains.conf in $HOME/.proxychains not /etc/proxychains.conf. It's a better fit to for personal use not system wide use (even if I am the only expected user).

# 0.24.27

* Deploy 'position' v1.2.1 to bring in a bug fix on window positioning.

# 0.24.26

* Deploy xml file to aide Firefox in supporting markdown text via extension

# 0.24.25

* Deploy 'shutter' screen capture utility
* Deploy wavemon WIFI signal monitoring
* Deploy xsane, xsane-gimp, simple-scan for scanner hardware use

# 0.24.24

* Deploy position v1.2.0

# 0.24.23

* Re-ordering deployment of repos and repo keys. Keys first, only if repos don't exist, then repos.

# 0.24.22

* Changing Atom deployment from package source (broken) to Atom repo
* Change mode on deployed repo files from 755 to 644. Repos don't need to be executable.

# 0.24.21

* Fixing deploy of Atom editor

# 0.24.20

* Deploy studywin desktop shortcut to 'position cloudstudy'

# 0.24.19

* Deploy Skype by deploying repo then package from repo
* Adding flush_cache to Skype and Google Chrome installs. Both install repos before installing packages, so flushing the cache makes contents of the repo avilable for chef to see.
* Removing skype repo file stored in cookbook. Now downloading from remote site.

# 0.24.18

* Fixing install of Zoom
* Fixing install of Atom

# 0.24.17

* Deploy AWS CLI

# 0.24.16

* Update $HOME/.position.conf to have special-rules items for organizing special windows.

# 0.24.15

* Don't create or modify NFS mount points if they already exist.  You don't want Chef messing with MOUNTED NFS shares at the mount points.

# 0.24.14

* Update .gitconfig with default branch name of 'main'

# 0.24.13

* To $HOME/.bashrc add AWS CLI tool completer for smoother tab completion.

# 0.24.12

* Update .gitconfig to use maxcode not maxwell

# 0.24.11

* Deploy Zoom

# 0.24.10

* Update $HOME/.vimrc with solarized dark instructions

# 0.24.9

* Deploy Skype via repo and package

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
