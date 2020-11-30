# station

Chef automation to provision a fresh Fedora Linux installation into my personal workstation.

Station performs the following actions:

## System Focused Actions

* Installs [rpmfusion](https://rpmfusion.org/) (free and non-free) Linux package repositories

* Installs select set of Linux packages from the base Fedora and rpmfusion repos that meet my system requirements. See [    node.default['station']['install_packages']
 within cookbooks/station/attributes/defaults.rb](https://github.com/maxwax/station/blob/master/cookbooks/station/attributes/default.rb)

* Remove any packages installed by default that are unwanted (usually foreign typeface packages)

* Add additional Linux system groups for local resources (like NFS servers' groups)

* Installs [Google Chrome](https://www.google.com/chrome/) Browser for Linux

* Installs [Atom](https://atom.io/) text editor for Linux

* Installs [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads) hypervisor for Linux

* Enable [sshd](https://www.ssh.com/ssh) for inbound network access

* Configure [firewalld](https://firewalld.org/) for limited inbound services

* Configure [roxterm](http://roxterm.sourceforge.net/) (alternative to gnome-terminal) and configure it with solarized color scheme and config options

* Enable service to apply TRIM feature periodically for SSD discarded blocks maintenance

* Deploy optional typefaces from personal repositories

* Configure expected mount points for local NFS servers

* Install a variety of scripts that I've written for personal use

## User Focused Actions

* Configures my standard Linux dot files in
  * /usr/local/etc
  * /etc/bashrc
  * /etc/profile
  * $HOME/.bashrc

* Installs & Configures [powerline](https://github.com/powerline/powerline) prompt

* Configures a small number of customizations for root user

## Step-by-Step Rebuild Procedure

### Enable support for a new version of fedora

These steps are required when using this cookbook on a newly released version of Fedora:

- [ ] Update attributes/default.rb case statement to replace the currently supported Fedora version identifier with a new version identifier. (ex: 'fedora_32' -> 'fedora_33')

- [ ] Remove any previously defined packages that are not available for the new version of Fedora

- [ ] Add any packages manually installed that were not included in the cookbook yet.

- [ ] Update the README.md docs with any new accommodations for the new version of Fedora

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
1. Reboot into new kernel, library, packages, etc

### Restore files

This procedure is for when /home was reformatted:

1. Login as user
1. Option 1: scp
```bash
scp -prv user@nasserver.maxlab:/backups/fedora.old /home/fedora.old
```
1. Option 2: NFS mount
```bash
mount -t nfs nasfiler.maxlab:/backups /net/filer/backups
cp -prv /net/filer/backups/fedora.old /home/fedora.old
```
1. Option 3: USB drive mount
  1. Mount the drive
  2. Copy directly
  ```bash
  cp -prv /mnt/usb/backlup/fedora.old /home/fedora.old
  ```

This procedure is available when the previous home directory was kept on a non-reformatted /home filesystem

1. Login on alternate console (ALT-F3) as maxwell and swap home directories
  ```bash
  mv /home/maxwell /home/maxwell.fedora.new
  mv /home/maxwell.fedora.old /home/maxwell
  ```
  1. Logout and back in to start using restored home directory.
  1. *Be on the lookout for problems with upgraded programs using old config files or settings*

### Provision the node

1. Clone this git repo
```bash
git clone https://github.com/maxwax/station
```
1. Change to the repo directory
```bash
cd station
```
1. Run the bootstrap.sh script
```bash
./bootstrap.sh
```

#### Bootstrap.sh Documentation

The bootstrap script simply performs the following tasks. It's good to know them in case something goes wrong and you need to overcome any obstacles:

1. It will: Launch Firefox to download [latest Chef Workstation for Red Hat Linux 8](https://downloads.chef.io/chef-workstation/)
1. It will: Install Chef workstation with ```sudo dnf install chef-workstation*rpm```
1. It will: Run ```sudo chef-client -z``` to create a node object for this workstation
1. It will: change the ownership of the newly created Chef node object to be owned by your user.
1. It will: Set this node's environment to 'maxlab'
1. It will: Append 'recipe[station]' to this node's run_list
1. It will: Now run `sudo chef-client -z` again to provision system
  ```bash
  cd station
  sudo chef-client -z
  ```

### Manual Application Installs

* Install the most recent version of [Slack](https://slack.com/downloads/instructions/fedora)

* Install [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads). This appears to require a manual process.

* Install most recent [draw.io rpm for Linux](https://github.com/jgraph/drawio-desktop/releases)

### Manual Configuration Tasks

* Consider setting a static hostname.
```bash
sudo hostnamectl set-hostname mynode.maxlab
```

* Verify the timezone in use. Make sure its correct
```timedatectl
timedatectl
               Local time: Thu 2020-01-09 22:44:18 MST
           Universal time: Fri 2020-01-10 05:44:18 UTC
                 RTC time: Fri 2020-01-10 05:44:18
                Time zone: America/Denver (MST, -0700)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```

### Gnome Tweak Tool Configurations

After restoring my home directory most of these should already be restored, so verify that these are set as required.

* General
  * Suspend lid on laptop close - disabled
* Top Bar
  * Show Weekday - enabled
  * Show Date - enabled
  * Show Battery Percentage - enabled (Maybe?)
* Windows
  * Attach Model Dialogs - enabled
  * Edge Tiling - enabled
  * Window Focus - Focus on Hover (Mousefocus)
* Window Titlebars
  * Double Click Titlebar Action - Toggle Maximize Vertically
  * Show Minimize - enabled
  * Show Maximize - enabled
* Workspaces
  * Static Workspaces - enabled
  * Number of Workspaces - 5
  * Display Handling - Workspaces Span Displays

### Gnome Shell Extensions

Use Firefox to install these:

These are in addition to the extensions installed by default in Fedora or by the Chef provisioning script.

* Visit [extensions.gnome.org](https://extensions.gnome.org/) and install the following extensions:

  * [Freon by UshakovVasili](https://extensions.gnome.org/extension/841/freon/) - Gnome temperature sensors applet

  * [gTile](https://extensions.gnome.org/extension/28/gtile/) - Window tiling, sizing and positioning
    * Customize this extension with details
    * Show Icon - disabled
    * Grid Sizes - Customize
    * Resize Presets - See screenshot elsewhere
    * Margins - 0 for all

  * [Launch New Instance](https://extensions.gnome.org/extension/600/launch-new-instance/) - Always launch a new instance even if an application is already running

  * [Multi-Monitors Add-On by spin83](https://extensions.gnome.org/extension/921/multi-monitors-add-on/) - Modifies GNOME desktop to use more than one monitor for virtual desktops
    * Customize this extension with details
    * Show Multi Monitors indicator on Top Panel - disabled

  * [OpenWeather](https://extensions.gnome.org/extension/750/openweather/) - Weather conditions applet for Gnome title bar
    * Customize this extension with details
    * Set location - Denver, CO

  * [Recent Items by leonardo.bartoli](https://extensions.gnome.org/extension/977/recent-items/) - Track recently opened files and add drop down applet to make re-opening them very easy
    * Customize this extension with details
    * Display File Full Path - disabled
    * Number of Items - 64
    * Display Indicator Arrow - disabled
    * Case Sensitive Search - disabled

  * [Sound Input & Output Chooser by kgshank](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) - Select active speakers and microphone. Very useful after docking/undocking laptops from desk to roaming.

  * [Timezones extension](https://extensions.gnome.org/extension/2657/timezones-extension/) - Display multiple timezones on the top bar. Helps with keeping track of co-workers in PST, EST and UTC.

  * [Tweaks in System Menu](https://extensions.gnome.org/extension/1653/tweaks-in-system-menu/) - Customization to put Gnome Tweaks Tool launch icon in system menu near control panel icon for natural accessibility.

### Control Panel customizations

* Keyboard Shortcuts - 'Lower window below other windows - Menu (key)'

### Work-Arounds Required

As of Winter 2020, three modifications are required to ensure that VirtualBox 6.1 and Vagrant are allowed to work with each other:
* [Vagrant 2.2.6 doesn't work with VirtualBox 6.1.0 #178
](https://github.com/oracle/vagrant-boxes/issues/178)

### QA Checklist

Execute these when testing a new deployment (especially a new Fedora version)

Network
- [ ] Hostname is set to host.domain
- [ ] DNS works on local home lab network to resolve other nodes
- [ ] SSH allows incoming connections

Browsers
- [ ] Firefox is installed and sync'd with my account
- [ ] Google Chrome is installed and sync'd with my account

Virtualization
- [ ] VirtualBox is installed, Extension pack installed
- [ ] vagrant works with Virtual box
- [ ] Chef Test Kitchen works with Vagrant and VirtualBox

Shell
- [ ] Terminals come up using Solarized low contrast color scheme
- [ ] CLI prompt is provided via Powerline with custom Fonts
- [ ] vim keys work with Shell history in bash

Gnome UI
- [ ] Top bar has day name, date and time in 24 hour format
- [ ] Top bar has UTC time
- [ ] Openweather knows Denver location
- [ ] Recent files drop down shows recent files
- [ ] Mousefocus switches windows
- [ ] Right menu key lowers windows

Applications
- [ ] Draw.io allows diagramming
- [ ] LibreOffice installed and working
- [ ] Slack runs and is signed in
- [ ] Atom editor works
