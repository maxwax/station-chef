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

* Installs [Zoom](https://zoom.us/download?os=linux)

* Installs [Skype](https://repo.skype.com/rpm/stable/)

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

* Configures a small number of changes for root user

## Step-by-Step Rebuild Procedure

### High Level Summary

1. Update this cookbook for a new version of Fedora (if required)
1. Backup the old Fedora Installation
1. Install Fedora
1. Update all system packages
1. Reboot into the updated system
1. Restore the old home directory
1. Execute this cookbook to deploy and configure the environment
1. Reboot one final time to test a clean boot and clean login
1. Debug the surprise problems that always present themselves.
1. Manual Application Installs
1. Manual Configuration Tasks
1. Gnome Tweak Tool Configuration
1. Gnome Shell Extensions
1. Control Panel Configurations
1. Solarize gnome-shell and vim
1. Work-Rounds Accommodations
1. QA Checklist

### Step 1 - Enable support for a new version of fedora

Complete the following actions to enable cookbook support for a new version of Fedora:

- [ ] Update cookbooks/station/attributes/default.rb case statement to replace the currently supported Fedora version identifier with a new version identifier. (ex: 'fedora_32' -> 'fedora_33')

- [ ] Remove any previously defined packages that are not available for the new version of Fedora

- [ ] Add any packages manually installed to the current Fedora installation that were not included in the cookbook yet.

- [ ] Update the README.md docs with any new accommodations for the new version of Fedora

### Step 2 - Backup existing Fedora Installation

1. Backup the existing Fedora installation to external media such as an NFS mount or USB storage.  Make two copies of this on two different media.

    ```bash
    cp -prv /boot /etc /home /opt /root /usr /var /net/filerdata/backups/sarko/$(date +%Y.%m%d)
    ```

### Step 3 - Installation Procedure for Fedora Linux Workstation

** You must use Chef *Workstation* not Chef Infra client. This process requires the 'knife' command which as of (Sep 2021) is not installed correctly with Chef Infra Client. (Dangling Symlink from /usr/bin/knife to /opt/chef/bin/knife)

1. Reboot into Fedora Linux into Live mode using a bootable USB Image
2. Start a terminal and relocate the /home/maxwell directory on existing /home filesystem for later use.
    ```bash
    mv /home/maxwell /home/maxwell.old
    ```
3. Run the installer program and install Fedora Linux. Reformat all filesystems except /home
4. Reboot into the new Fedora Linux installation
5. Connect to the WIFI network (optional)
6. Create a primary user (this will be system admin / sudo user)
7. Login, start a shell
8. Set the static hostname with
    ```bash
    hostnamectl set-hostname <hostname>
    ```

### Step 4 - Restore files from backup

1. Update all packages - There are always updates.
    ```bash
    dnf -y update
    ```

### Step 5 - Reboot into updated Fedora Linux

1. Reboot into new kernel, library, packages, etc

### Step 6 - Restore files from backup

1. After booting the system, don't login on the GUI!
2. Switch to a virtual console and login as maxwell
3. Relocate the new, empty /home/maxwell out of the way
    ```bash
    mv /home/maxwell /home/maxwell.fedora.new
    ```
4. Relocate the old, populated /home/maxwell.old into place
    ```bash
    mv /home/maxwell.old /home/maxwell
    ```
5. Now login on the GUI as maxwell to continue normal operation

### Step 7 - Provision the node with this cookbook

1. Login as maxwell into a clean, empty /home/maxwell
2. Clone this git repo
    ```bash
    git clone https://github.com/maxwax/station
    ```
3. Change to the repo directory
    ```bash
    cd station
    ```
4. Run the bootstrap.sh script
    ```bash
    ./bootstrap.sh
    ```

#### Bootstrap.sh Documentation

The bootstrap script simply performs the following tasks. It's good to know them in case something goes wrong and you need to overcome any obstacles:

It will:

1. Launch Firefox and prompt you to download [latest Chef Workstation rpm for Red Hat Linux 8](https://downloads.chef.io/chef-workstation/)
1. Install the downloaded Chef Workstation rpm
1. Perform a first run of chef-client -z to create a Chef *node* object for this workstation.
1. Modify the ownership of the Chef node object to be owned by your user.
1. Modify the node's environment to 'maxlab'
1. Append 'recipe[station]' to the node's run_list
1. Perform a second run of chef-client -z execute the station cookbook in order to provision the system

### Step 8 - Configure X.org instead of Wayland

Make two changes to /etc/gdm/custom.conf in order to replace the Wayland graphics system with classic X.Org based X11.

This allows me to size and position gnome-terminals upon launch, something not supported under Wayland.

Modify `/etc/gdm/custom.conf` to look like this:

```[daemon]
# Uncomment the line below to force the login screen to use Xorg
WaylandEnable=false
DefaultSession=gnome-xorg.desktop
```

Upon next boot you *should* be in X11.

### Step 8 - Final Reboot

With the provisioning complete, the majority of major software deployments and configurations is complete.

Now is a good time to reboot the system and login.

### Step 9 - Debug the Surprises

Along the way, look for problems, errors and obvious things that are broken. Debug them and resolve them before moving on.

### Step 10 - Sign into Firefox Sync

Run Firefox, sign in then wait for synced bookmarks and extensions to appear.

### Step 11 - Manual Application Installs

At this point the system is stable, so we can manual install some applications whose installation is difficult to reliably automate.

* Install the most recent version of [Slack](https://slack.com/downloads/instructions/fedora)

* Install [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads). This appears to require a manual process.

* Install most recent [draw.io rpm for Linux](https://github.com/jgraph/drawio-desktop/releases)

* Install 'duf' storage usage utility.  (duf github repo](https://github.com/muesli/duf/releases)

### Step 12 - Manual Configuration Tasks

Here, perform any manual configuration steps that aren't included in the provisioning cookbook.  These are often accommodations to new changes introduced by Fedora.

* Consider setting a static hostname (if not done earlier)
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

### Step 13 - Gnome Tweak Tool Configurations

The Gnome tweaks have a strong impact on the look and feel operation of the GUI, so verify that the expected settings are in place.

After restoring my home directory most of these should already be restored, so verify that these are set as required.

* General
  * Suspend lid on laptop close - disabled
* Keyboard & Mouse
  * Mouse Click Emulation: Area (to use touchpad areas, not 2-finger gestures)
* Top Bar
  * Show Weekday - enabled
  * Show Date - enabled
  * Show Battery Percentage - enabled
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

### Step 14 - Gnome Shell Extensions

These extensions modify the Gnome GUI environment in ways that make it significantly more comfortable so install them now:

Use Firefox to install these:

These are in addition to the extensions installed by default in Fedora or by the Chef provisioning script.

* Visit [extensions.gnome.org](https://extensions.gnome.org/) and install the following extensions:

  * Install the **Firefox Gnome-Shell-Extension** using the banner at the top of the Gnome Shell Extensions website.

  * [Freon by UshakovVasili](https://extensions.gnome.org/extension/841/freon/) - Gnome temperature sensors applet

  * [gTile](https://extensions.gnome.org/extension/28/gtile/) - Window tiling, sizing and positioning
    * Customize this extension with details
    * Show Icon - disabled
    * Grid Sizes - Customize
    * Resize Presets - See screenshot elsewhere
    * Margins - 0 for all

  * [Launch New Instance](https://extensions.gnome.org/extension/600/launch-new-instance/) - Always launch a new instance even if an application is already running

  * [OpenWeather](https://extensions.gnome.org/extension/750/openweather/) - Weather conditions applet for Gnome title bar
    * Customize this extension with details
    * Set location - Denver, CO

  * [Recent Items by bananenfisch](https://extensions.gnome.org/extension/72/recent-items/) - Track recently opened files and add drop down applet to make re-opening them very easy

  * [Sound Input & Output Chooser by kgshank](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) - Select active speakers and microphone. Very useful after docking/undocking laptops from desk to roaming.
    * Waiting for update for Fedora 35 compatability

  * [Tweaks in System Menu](https://extensions.gnome.org/extension/1653/tweaks-in-system-menu/) - Customization to put Gnome Tweaks Tool launch icon in system menu near control panel icon for natural accessibility.
  * Waiting for update for Fedora 35 compatability

### Step 15 - Control Panel configurations

* Configure Top Bar Clock with World Clock Eastern and UTC Time zones.

* Configure OpenWeather app for Denver weather, remove Tuvalu

* Configure WIFI: You may need to reconfigure access to known access points

* Configure Power: to not 'Automatic Suspend' after idle use
* Configure Power: to show battery Percentage
* Configure Power: Power Button Behavior does 'Nothing'

* Configure Keyboard Shortcuts: 'Lower window below other windows' via 'Menu' (key)

* Configure Printers: Re-configure any known printers as needed

* Configure Default Apps: Set Mail to 'Evolution'

* Configure Date & Time: Enable both 'Automati Date & Time' and 'Automatic Time Zone'
* Configure Date & Time: Time format 24-hour

### Step 16 - Solarize gnome-shell and vim

Apply a low contrast color palette to gnome-shell windows using [this guide on if-not-true-then-false.com](https://www.if-not-true-then-false.com/2012/solarized-linux/#solarized-gnome-terminal

Apply the same to vim using [this guide](https://www.if-not-true-then-false.com/2012/solarized-linux/#solarized-vim)

### Step 17 - Work Around Accommodations

Record any known work arounds to issues here so they can be easily performed on a new deployment.

### Step 18 - QA Checklist

Verify the items on this checklist immediately after installation of Fedora in order to identify and resolve problems now and not 5 minutes before a collaboration with others where you need them.  This list is expected to grow.

Hardware
- [ ] Display uses native resolution and looks good in X
- [ ] Sound works through headphones jack
- [ ] Sound works through laptop speakers
- [ ] Sound works through USB dock speakers
- [ ] USB keyboard, mice and trackpads work
- [ ] Laptop screen can be closed and doesn't cause the laptop to sleep
- [ ] Wireless network connectivity works
- [ ] Wired network connectivity works
- [ ] Laptop continues showing power from AC, power from battery

Gnome UI
- [ ] Top bar has day name, date and time in 24 hour format
- [ ] Top bar has UTC time
- [ ] Openweather knows Denver location
- [ ] Recent files drop down shows recent files
- [ ] Mousefocus switches windows
- [ ] Right menu key lowers windows

Network
- [ ] Hostname is set to host.domain
- [ ] DNS works on local home lab network to resolve other nodes
- [ ] SSH allows incoming connections

Virtualization
- [ ] VirtualBox is installed, Extension pack installed

Shell
- [ ] Terminals come up using Solarized low contrast color scheme
- [ ] Terminals use bash and powerline prompt with custom config file
- [ ] vim keys work with Shell history in bash (set -o vi)

Applications
- [ ] Firefox is installed and sync'd with my account
- [ ] Evolution mail gets to IMAP accounts
- [ ] KeepassXC can load a password safe
- [ ] Draw.io allows diagramming
- [ ] LibreOffice installed and working
- [ ] Atom editor works
- [ ] You can get to Google Drive from the Nautilus File Manager
- [ ] Firefox is logged in and syncing bookmarks
- [ ] Chrome works
- [ ] Slack runs and is signed in
- [ ] Zoom runs, is signed in, can use microphone and webcams

CLI Tools
- [ ] The 'safe' command can open a LUKS safe file
- [ ] You can ssh to an AWS Bastion node for tunneling
- [ ] You can ssh through an AWS Bastion node for a private tunnel
- [ ] AWS CLI can list s3 buckets (simple example)
