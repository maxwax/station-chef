# station

Chef automation to provision a fresh Fedora Linux installation into my personal workstation.

Station performs the following actions:

## System Focused Actions

* Installs [rpmfusion](https://rpmfusion.org/) (free and non-free) Linux package repositories

* Installs select set of Linux packages from the base Fedora and rpmfusion repos that meet my system requirements. See [    node.default['station']['install_packages']
 within cookbooks/station/attributes/defaults.rb](https://github.com/maxwax/station/blob/master/cookbooks/station/attributes/default.rb)

* Installs [Google Chrome](https://www.google.com/chrome/) Browser for Linux

* Installs [Atom](https://atom.io/) text editor for Linux

* Installs [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads) hypervisor for Linux

* Configure [firewalld](https://firewalld.org/) for limited inbound services

* Configure roxterm (alternative to gnome-terminal) and configure it with solarized color scheme and config options

* Enable service to apply TRIM feature periodically for SSD dicarded blocks maintenance

* Deploy optional typefaces from personal repositories

## User Focused Actions

* Configures *my* standard Linux dot files in
  * /usr/local/etc
  * /etc/bashrc
  * /etc/profile
  * $HOME/.bashrc

* Installs & Configures [powerline](https://github.com/powerline/powerline) prompt

## Things Remaining to Automate:

* Install [Slack](https://slack.com/downloads/instructions/fedora) which doesn't offer static rpm locations

* Install [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) which is tied to the specific version of VirtualBox installed

## Rebuild Procedure

### Install new Fedora Linux OS

1. Backup existing system to external storage (USB drive, NFS mount)
1. Options for preserving /home/maxwell
  1. Reformat /home and restore from back up later (Slow)
  1. *Move /home/maxwell to /home/maxwell.fedora.old, let the installer create a fresh /home/maxwell and selectively restore contents to new /home/maxwell (Preferred)*
  1. Keep /home/maxwell in place, don't reformat /home and let the installer use the existing file base.
1. Install new version of Fedora Linux
1. Boot newly installed Fedora
1. Connect to WIFI
1. Create primary user (this will be system admin / sudo user)
1. Login, start a shell
1. Update all packages - There are always updates.
  ```bash
  sudo dnf -y update
  ```

### Restore files and provision system

1. Login on alternate console (ALT-F3) as maxwell and swap home directories
  ```bash
  mv /home/maxwell /home/maxwell.fedora.new
  mv /home/maxwell.fedora.old /home/maxwell
  ```
  1. Logout and back in to start using restored home directory.
  1. *Be on the lookout for problems with upgraded programs using old config files or settings*
1. Use Firefox to download [latest Chef Workstation for Red Hat Linux 8](https://downloads.chef.io/chef-workstation/)
1. Install Chef workstation
  ```bash
  sudo dnf install ./chef-workstation*rpm
  ```
1. Clone this git repo
   `git clone https://github.com/maxwax/station`
1. Use chef-client to provision system
   `cd station; sudo chef-client -z`

### Restore files and provision system
