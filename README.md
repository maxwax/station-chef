# station

Station is a Chef configuration management cookbook to provision my personal Linux workstation running Fedora Linux.

Fedora releases every six months and being able to configure 90% of more of my personal workstation via a script is incredibly useful and productive.

In the near future this Chef based system will be replaced by an Ansible solution since that seems to be where the world is headed.

Update 2025-0105: Updated to support Fedora 41. Previous versions are not supporte and will be removed soon.

## System Focused Actions

Station performs the following _major_ actions in addition to a variety of smaller items:

* Installs the [rpmfusion](https://rpmfusion.org/) (free and non-free) Linux package repositories that provide Linux packages not included in the base Fedora Linux distribution.

* Installs a select set of Linux packages from the base Fedora and rpmfusion repos in order to meet my personal requirements. See the Chef code for [node.default['station']['install_packages']
 ](https://github.com/maxwax/station/blob/master/cookbooks/station/attributes/default.rb) within the file cookbooks/station/attributes/defaults.rb for details.

* Remove any packages installed by default that are unwanted (These are usually foreign typeface packages that I don't need.)

* Add additional Linux system groups to facilitate consistency in my home lab environment's NFS servers.

* Installs [Google Chrome](https://www.google.com/chrome/)

* Installs [Atom](https://atom.io/) text editor for Linux
** This will be removed soon due to Atom being deprecated **

* Installs [Microsoft VS Code Editor](https://code.visualstudio.com/docs/setup/linux)]

* Installs [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads) hypervisor for Linux

* Installs [Zoom](https://zoom.us/download?os=linux)

* Installs [Skype](https://repo.skype.com/rpm/stable/).

* Installs [WebEx](https://help.webex.com/en-us/article/9vstcdb/Webex-App-for-Linux).

* Enable [sshd](https://www.ssh.com/ssh) for inbound network access

* Configure [firewalld](https://firewalld.org/) for limited inbound services

* Enable service to apply TRIM feature periodically for SSD discarded blocks maintenance

* Deploy optional typefaces from personal repositories

* Configure expected mount points for local NFS servers

* Install a variety of Bash scripts that I've written for personal use

In addition to these, this page documents manual steps that are required to customize a new Linux installation to my personal needs.  These steps are easier to perform by hand than invest significant time to automate.

## User Focused Actions

Station performs the following changes specific to my personal user, 'maxwell':

* Configures my standard Linux dot files in
  * ``/usr/local/etc``
  * ``/etc/bashrc``
  * ``/etc/profile``
  * ``$ HOME/.bashrc``

* Installs & Configures [powerline](https://github.com/powerline/powerline) prompt

* Configures a small number of changes for root user, too.

Note: Many GNOME GUI configuration changes will take place simply by restoring my personal home directory from one Linux installation to another. Therefore, these configuration settings are not automated via this cookbook.

## High Level Summary of Steps

This is a high level summary of my process for moving to a new install of Fedora Linux:

1. First, perform multiple backups of the old system to multiple forms of encrypted storage both on-line (NAS) and off-line (USB hard drives).
1. Install Fedora Linux from USB Installer image.
2. Boot the newly installed Linux system and complete the initial steps of making a new user manually.

3. Download Station by cloning this github repo:
```
git clone github.com/maxwax/station
```

4. Execute the bootstrap.sh script as root/sudo in order to download, install, configure and run Chef to configure this workstation.
```
cd station
sudo ./bootstrap.sh
```

5. Manually restore files from backups to the new system.  First, put them in a temporary place, then swap out /home/maxwell with the restored /home/home.old/maxwell.

6. Go through the detailed checklist below to perform fine-tuning of a new Fedora install.

## Detailed Step by Step Guide

### Overview

1. If moving to a new release of Fedora Linux, install the release in a virtual machine and attempt to run this cookbook. Adjust to accommodate things like base packages that have been removed or renamed and push changes to github.
1. Make multiple backups of the existing Fedora installation including all major directories not just /home
1. Install Fedora from USB installer
1. Run dnf to update all system packages
1. Reboot into the updated system
1. Execute this cookbook to deploy and configure the environment
1. Restore the old home directory
1. Reboot one final time to test a clean boot and clean login
1. Debug the surprise problems that may present themselves.
1. Manual Application Installs
1. Manual Configuration Tasks
1. Work-Rounds Accommodations
1. QA Checklist

### Step 1 - Enable support for a new version of Fedora

Complete the following actions to enable cookbook support for a new version of Fedora:

- [ ] Update cookbooks/station/attributes/default.rb case statement to replace the currently supported Fedora version identifier with a new version identifier. (ex: 'fedora_32' -> 'fedora_33')

- [ ] Remove any previously defined packages that are not available for the new version of Fedora

- [ ] Add any packages manually installed to the current Fedora installation that were not included in the cookbook yet.

- [ ] Update the README.md docs with any new accommodations for the new version of Fedora

- [ ] Adjust any unexpected issues with the script caused by changes in behavior of the new Fedora release.  Do this on the first attempt to use this script.

- [ ] Push updates to github

### Step 2 - Backup existing Fedora Installation

1. Perform multiple backups to multiple, encrypted on-line and off-line storage media.

      ```bash
 cp -prv /boot /etc /home /opt /root /usr /var /net/filerdata/backups/$(hostname)/$(date +%Y.%m%d)
    ```

### Step 3 - Install Fedora Linux

1. Use a Fedora Workstation Live USB Installer to boot the computer and perform a base install of Fedora Linux.

2. If you are re-using existing filesystem partitions, make sure to check each one other than /boot/efi as 'Reformat' to clear them out instead of re-using them.
3. Reboot into the new Fedora Linux installation
4. Connect to the WIFI network (optional)
5. Create a primary user (this will be system admin / sudo user)
7. Login, start a shell

### Step 4 - Update all system packages to current releases.

1. Update all packages - There are always updates.
    ```bash
    dnf -y update
    ```

### Step 5 - Download the Station Chef cookbook from github using ``git clone``

1. Clone the station github repo to $ HOME/Download.
  ```
  git clone github.com/maxwax/station
  ```
2. Bootstrap the node with the bootstrap.sh script
  ```
  cd station
  sudo ./bootstrap.sh
  ```

#### Bootstrap.sh Documentation

bootstrap.sh performs the following automated tasks:

1. Download a staged Chef workstation binary from maxwellspangler.com to /tmp.
1. Install the chef-workstation rpm file.
1. Perform a first run of chef-client -z to create a Chef *node* object for this workstation.
1. Modify the new Chef node to be owned by 'maxwell'
1. Modify the new Chef node environment to 'maxlab'
1. Append 'recipe[station]' to the new Chef node
1. Now perform a chef-client run that will execute the recipes configured in the 'station' cookbook to provision the workstation.

### Step 6 - Reboot into updated Fedora Linux

All packages should now be up to date and most packages that can be automatically installed by Chef are installed. Reboot into an updated kernel and package environment.

1. Reboot into new kernel, library, packages, etc

### Step 7 - Restore files from backup

* Skip this step if you're running this on a spare computer or testing VM.

1. From backups made prior to installation, restore /home/maxwell to `/home/maxwell/home.old/maxwell`.

2. Restore other directories like /home/library

3. Ideally, log out of 'maxwell' and into another user or root so that your logged in user 'maxwell' is not actively using any files in /home/maxwell.

4. Move the /home/maxwell directory created by this new installation to a temporary location
    ```bash
    mv /home/maxwell /home/maxwell.fedora.new
    ```

5. Move the restored /home/home.old/maxwell user directory to /home/maxwell for active use.
    ```bash
    mv /home/home.old/maxwell /home/maxwell
    ```
6. Now login on the GUI as 'maxwell' to continue normal operation

### Step 8 - Configure X.org instead of Wayland

Wayland prevents gnome-terminal from using its --geometry parameter to launch terminal windows in specific locations with specific sizes so for this reason I switch back to the legacy X.org X11 window system.

1. Modify `/etc/gdm/custom.conf` to look like this:

```[daemon]
# Uncomment the line below to force the login screen to use Xorg
WaylandEnable=false
DefaultSession=gnome-xorg.desktop
```

Upon next boot you *should* be in X11 instead of Wayland.

### Step 9 - For HP Elitebook, configure kernel parameter for ACPI display backlighting

** This should now be done automatically via a Chef recipe, so just confirm it is in place.

1. Add 'acpi_backlight' to /etc/default/grub
2. Deploy a new grub.cfg file with the new kernel parameter

```
grub2-mkconfig -o /boot/grub2/grub.cfg
```

### Step 10 - Final Reboot

With the provisioning complete, the majority of major software deployments and configurations is complete.

Now is a good time to reboot the system and login.

### Step 11 - Debug the Surprises

Along the way, look for problems, errors and obvious things that are broken. Debug them and resolve them before moving on.

### Step 12 - Manual Application Installs

At this point the system is stable, so we can manual install some applications whose installation is difficult to reliably automate.

These applications are installed manually due to the obstacles their providers make in quickly and easily automating installations without fixed download URLs or yum repositories.

* Install the most recent version of [Slack](https://slack.com/downloads/instructions/fedora)
** This now has a Electron conflict with draw.io, so I use draw.io locally and Slack via a web page.

* Install [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads). This appears to require a manual process.

* Install most recent [draw.io rpm for Linux](https://github.com/jgraph/drawio-desktop/releases)

* Install PyCharm - Python IDE.  [pycharm download page](https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC)

### Step 14 - Manual Configuration Tasks

This is an opportunity to perform any manual steps that have not been automated.

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

### Step 15 - Gnome Tweak Tool Configurations

These settings should already be in place, but if using Station to setup a fresh Fedora installation where config files are not being restored, this is a guide to configure settings:

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

### Step 16 - Gnome Shell Extensions

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

  * [No Overview at Startup](https://extensions.gnome.org/extension/4099/no-overview/)

### Step 17 - Control Panel configurations

* Configure Top Bar Clock with World Clock Eastern and UTC Time zones.

* Configure OpenWeather app for Denver weather, remove Tuvalu

* Configure WIFI: You may need to reconfigure access to known access points

* Configure Bluetooth: Disable if not using it for anything

* Configure Multitasking: Fixed Number of Workspaces: 6
* Configure Multitasking: Multi-Monitor: Workspaces on all displays
* Configure Multitasking: Application Switching: Include applications from the current workspace

* Configure Power: to not 'Automatic Suspend' after idle use
* Configure Power: to show battery Percentage
* Configure Power: Power Button Behavior does 'Nothing'

* Configure Keyboard Shortcuts: 'Lower window below other windows' via 'Menu' (key)

* Configure Printers: Re-configure any known printers as needed

* Configure Default Apps: Set Mail to 'Evolution'

* Configure Date & Time: Enable both 'Automati Date & Time' and 'Automatic Time Zone'
* Configure Date & Time: Time format 24-hour

### Step 18 - Solarize gnome-shell and vim

Apply a low contrast color palette to gnome-shell windows using [this guide on if-not-true-then-false.com](https://www.if-not-true-then-false.com/2012/solarized-linux/#solarized-gnome-terminal

Apply the same to vim using [this guide](https://www.if-not-true-then-false.com/2012/solarized-linux/#solarized-vim)

### Step 19 - Work Around Accommodations

Record any known work arounds to issues here so they can be easily performed on a new deployment.

### Step 20 - VirtualBox Patching

Sometimes the vagrant deployed by Fedora doesn't support the latest release of VirtualBox used with Chef and Test Kitchen for ad-hoc testing in virtual machines.

Follow (https://blogs.oracle.com/scoter/post/getting-vagrant-23-working-with-oracle-vm-virtualbox-70-beta#This Oracle Blog post) or a similar one to modify a variety of vagrant files to treat VirtualBox N+1 as Virtual Box N.

### Step 21 - QA Checklist

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

Editors
- [ ] Atom launches and can edit code
- [ ] VS Code launches and can edit code
- [ ] Pycharm launches and can edit and run Python code

Containers
- [ ] Docker Desktop GUI app launches and can find running docker engine daemon
- [ ] Docker can launch containers from command line

### Step 22 - New, Experimental: Security review with Lynis

* Download and run the latest version of Lynis and review the security posture for vulnerabilities.
