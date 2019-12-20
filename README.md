# station

Chef automation to provision a fresh Fedora Linux installation into my personal workstation.

Station performs the following actions:

## System Focused Actions

* Installs [rpmfusion](https://rpmfusion.org/) (free and non-free) Linux package repositories

* Installs *my* standard set of Linux packages from the base Fedora and rpmfusion repos

* Installs [Google Chrome](https://www.google.com/chrome/) Browser for Linux

* Installs [Atom](https://atom.io/) text editor for Linux

* Installs [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads) hypervisor for Linux

* Configure [firewalld](https://firewalld.org/) for limited inbound services

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