# station

Station is a Chef configuration management cookbook to provision my personal Linux workstation running Fedora Linux.

I developed this in 2020 as a way of learning Chef and automating the configuration of my workstation.

I use Fedora Linux which releases every six months and I prefer to do a fresh install instead of an in-place upgrade.

Being able to quickly deploy and configure a fresh Fedora Linux installation and get 90% of my workstation up and running quickly is incredibly rewarding.

This is also **incredibly** useful for switching from an old laptop to another, or grabbing a spare laptop and getting it configured with all the tools I need to make it useful and comfortable.

Note: I'll probably be moving this to Ansible in the future as I use Ansible professionally and no longer work with Chef.

## Features

Station performs the following _major_ actions in addition to a variety of smaller items:

* Installs the [rpmfusion](https://rpmfusion.org/) (free and non-free) Linux package repositories that provide Linux packages not included in the base Fedora Linux distribution.

* Installs a select set of Linux packages from the base Fedora and rpmfusion repos in order to meet my personal requirements. See the Chef code for [node.default['station']['install_packages']
 ](https://github.com/maxwax/station/blob/master/cookbooks/station/attributes/default.rb) within the file cookbooks/station/attributes/defaults.rb for details.

* Remove any packages installed by default that are unwanted (These are usually foreign typeface packages that I don't need.)

* Add additional Linux system groups to facilitate consistency in my home lab environment's NFS servers.

* Installs [Google Chrome](https://www.google.com/chrome/)

* Installs [Microsoft VS Code Editor](https://code.visualstudio.com/docs/setup/linux)]

* Installs [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads) hypervisor for Linux

* Installs [Zoom](https://zoom.us/download?os=linux)

* Enable [sshd](https://www.ssh.com/ssh) for inbound network access

* Configure [firewalld](https://firewalld.org/) for limited inbound services

* Enable service to apply TRIM feature periodically for SSD discarded blocks maintenance

* Deploy optional typefaces from personal repositories

* Configure expected mount points for local NFS servers

* Install a variety of Bash scripts that I've written for personal use

In addition to these, this page documents manual steps that are required to customize a new Linux installation to my personal needs.  These steps are easier to perform by hand than invest significant time to automate.

### User Focused Actions

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

1. Make several backups to encrypted media as a pre-caution.
2. Install Fedora Linux as a new installation using USB media.
3. Boot new Fedora Linux installation.
4. Perform minimal manual initial configuration steps.
5. Download Station by cloning this github repo:

```
git clone github.com/maxwax/station
```

6. Execute the bootstrap script.  This will download a legacy copy of Chef, install it, then run the Chef `station` cookbook.
```
cd station
sudo ./bootstrap.sh
```

6. Restore files from backup.

7. Go through checklist steps below.

Note: Fedora is a leading edge Linux distribution and new versions may introduce significant changes which break things and challenge expectations.  When using `station` with a new version, some effort is usually required to 'port' it and adjust to new changes.  Once ported, it can be re-used comfortably.

## Detailed Step by Step Guide

### Step 1 - Enable support for a new version of Fedora

When using this cookbook with a new version of Fedora, use a spare laptop or a VM 'port' this cookbook to the new version.  Most things will work, but minor effort is required to adapt to things like renamed or removed packages, features that require new configurations, etc.

- [ ] Update the case statement in `cookbooks/station/attributes/default.rb` to introduce a new version of Fedora.  Copy & paste the existing version's section and update the version id. ex: `fedora_40` is updated with `fedora_41`.

- [ ] Perform a fresh installation of the new Fedora version.

- [ ] Run this cookbook and see what breaks.

Common fixes encountered include:

- [ ] Remove desired packages which are no longer in the repos.

- [ ] Adapt to packages that have been renamed in order to deploy them with new names.

- [ ] If there are new packges to be added, add them manually to test then add them to the cookbook.

- [ ] Update the README.md documentation.  Remove behavior now obsolete and add info about behaviors to accomodate the new version.

- [ ] Push updates to github

### Step 2 - Backup the existing Fedora Installation

1. Create multiple multiple backups of the existing system to several forms of encrypted media.

    I often do this to NFS server mounts and USB storage:

    ```bash
    sudo cp -prv /boot /etc /home /opt /root /usr /var /net/filerdata/backups/$(hostname)/$(date +%Y.%m%d)
    ```

### Step 3 - Install Fedora Linux

1. Perform a fresh install of Fedora Linux on the existing system by reformatting existing filesystems.

    Danger: You will lose your data.

    Optional: Reformat the system partitions and leave the `/home` filesystem in place.

3. Reboot into the new Fedora Linux installation

4. Connect to the WIFI network (optional)

5. Create a primary user (this will be system admin / sudo user)

6. Login, start a shell

### Step 4 - Update all system packages to current releases.

On the clean, fresh install update all the existing packages.

1. Update all packages - There are always updates.

    ```bash
    dnf -y update
    ```

### Step 5 - Download the Station Chef cookbook from github using ``git clone``

1. Change to the `Downloads` directory.

    ```
    cd Downloads
    ```

2. Clone the station github repo to `$HOME/Downloads`.

  ```
  git clone github.com/maxwax/station
  ```

3. Change into the `station` directory

  ```
  cd station
  ```

2. Bootstrap the node with the bootstrap.sh script

  ```
  sudo ./bootstrap.sh
  ```

Note: When you run this script, and Chef using `sudo` in this directory, Chef will create some directories and files owned by root.  To delete them later, be prepared to use `sudo rm` to do so.  This is expected.

#### Bootstrap.sh Documentation

The `bootstrap.sh` performs the following automated tasks:

1. Download a staged, legacy[1] Chef workstation packages from maxwellspangler.com to `/tmp`.
2. Install the chef-workstation rpm file.
3. Perform a first run of chef-client -z to create a Chef *node* object for this workstation.
4. Modify the new Chef node to be owned by 'maxwell'
5. Modify the new Chef node environment to 'maxlab'
6. Append 'recipe[station]' to the new Chef node
7. Now perform a `chef-client` run that will execute the recipes configured in the 'station' cookbook to provision the workstation.

[1] This is a convenience for me and to protect against Chef removing this binary from public access.  It may not work for you in the future.

### Step 6 - Reboot into updated Fedora Linux

All packages should now be up to date and most packages that can be automatically installed by Chef are installed. Reboot into an updated kernel and package environment.

1. Reboot into new kernel, library, packages, etc

### Step 7 - Restore files from backup

* Skip this step if you're running this on a spare computer or testing VM.

1. Copy key directories like `/etc` and `/home` from the backups of the old version to a staging directory like `/home/oldfedora`.

    This allows files to be inspected and selectively restored when possible.

2. Verify that the primary `maxwell` user's user-id and group-id numbers have not changed.

3. Log out of the GUI, switch a virtual console with ALT-F2 and login as the primary user, `maxwell`.

    This is done so we can swap out fresh installation files in `/home/maxwell` with restored versions copied from a staging area.  I don't want active running programs to have their config files changed in flight.

4. Move the `/home/maxwell` directory to a temp location

    ```bash
    mv /home/maxwell /home/maxwell.fedora.new
    ```

5. Restore the old version's home directory into its right place.

    ```bash
    mv /home/oldlinux/maxwell /home/maxwell
    ```

6. Use `ALT-F1` to return to the GUI login and login as the primary user, `maxwell`.

    If things go well, you'll now be logged in on a new version of GNOME but with existing user files including personal config files.

### Step 8 - Configure X.org instead of Wayland

In years past, I would switch from using the Wayland GUI display system to the trusted X11.  From 2025 and forward, I'm going to try to move forward as Wayland is the future of GUI on Fedora and Red Hat Linux.

Skip this:

1. Modify `/etc/gdm/custom.conf` to look like this:

```[daemon]
# Uncomment the line below to force the login screen to use Xorg
WaylandEnable=false
DefaultSession=gnome-xorg.desktop
```

Upon next boot you *should* be in X11 instead of Wayland.

### Step 9 - Apply hardware specific accommodations.

Some of my hardware require custom kernel parameters to work around problems.

An example is the HP Elitebook 840 G8 which *might* work better with this display work around.

1. Add 'acpi_backlight' to kernel parameters defined in `/etc/default/grub`.

2. Deploy a new grub.cfg file with the new kernel parameter

    ```
    grub2-mkconfig -o /boot/grub2/grub.cfg
    ```

### Step 10 - Final Reboot

With the provisioning complete, the majority of major software deployments and configurations is complete.

Now is a good time to reboot the system and login.

1. Use the GUI to safely reboot the system.

### Step 11 - Manual Application Installs

Automating the downloading and installation of many software programs is easy if their publisher provides rpm repositories or is consistent with how they are published.

For those applications that aren't in rpm format, aren't published via repos, or that can't reliably be downloaded or installed, list them here and install them manually.

1. Install the [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) extension pack. Virtualbox is deployed by `station` but not the extension pack.

2. Install the [Slack](https://slack.com/downloads/instructions/fedora) desktop app with a manual rpm install.

3. Install [draw.io](https://github.com/jgraph/drawio-desktop/releases) desktop app with a manual rpm install.

4. Install [PyCharm the Python IDE](https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC) by downloading the `.tgz` file and deploying it in `/opt`.

### Step 12 - Manual Configuration Tasks

This a collection of quick manual steps which I've left out of `station` so far.

#### Hostname

* Set a static hostname, otherwise the hostname is set by DHCP.

    ```bash
    sudo hostnamectl set-hostname mynode.maxlab
    ```

#### Date, Time and Timezone

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

#### Realtime clock

* Ensure the RTC clock is in UTC with 

    You will see warnings from `timedatectl` above if this is required.

    ```bash
    timedatectl set-local-rtc 0
    ```

### Step 13 - Restore WIFI connections

Restore `.nmconnection` files from the old system's staging files to `/etc/NetworkManager/system-connections`.

This allows you to avoid manually entering known WIFI access point WPA passwords.

```bash
sudo /home/oldlinux/etc/NetworkManager/system-connections/* /etc/NetworkManager/system-connections
```

### Step 14 - Control Panel configurations

These are configuration settings very easily set via the GUI control panel.

I could figure out how to automate setting them, but since GUI environments like Gnome are rapidly changing, I've felt comfortable making them manually so I know what has changed and what is new.

#### WIFI

* Ensure WIFI is working with DHCP setup

    * If in my home environment, make sure the DHCP server recognizes this hardware's MAC address and gives a static IP associated with a DNS name.

#### Network

* Configure the initial default wired network connection as needed

* If in a home environment test it and ensure the DHCP server is providing a static IP by recognizing this hardware's MAC address.

#### Bluetooth

#### Displays

* Check that the connected monitor is connecting in the native display resolution.

    * This hasn't been a problem for a long time, but..

* Enable the Night Light feature to reduce blue light automatically in the evening

#### Sound

* Test the output devices:

    * Test the laptop speakers

    * Test the HDMI/DisplayPort monitor speakers

    * Test the headphone (Thunderbolt Dock with Powered Speakers)

* Test the Input by clapping

* Change the Alert Sound to `Swing`

#### Power

* If a laptop, note that the laptop battery is reporting power

* If wireless bluetooth devices are connected, check that they report power

* Power Mode: Balanced

* Power Saving: Screen Blank: 5 minutes

* Power Saving: Automatic Power Saver: Disabled

* Power Saving: Automatic Suspend: Disabled

* General: Power Button Behavior: Nothing

* General: Show Battery Percentage: Enabled

#### Multitasking

* Hot Corner: Enabled

* Active Screen Edges: Enabled

* Workspaces: Fixed Number of Workspaces: 6

* Multi-Monitor: Workspaces on all Displays

* App Switching: Include Apps from App Workspaces (?)

#### Appearance

* Set a custom background

#### Apps

* No customizations

#### Notifications

* Lock Screen Notifications: Enabled

#### Search

* Leave most enabled

* Disable Boxes, Calculator, Clocks, Weather, etc.

#### Online Accounts

* Enable Google Account via OATH tokens so I can use Google Drive and Gmail within Evolution

#### Sharing

* Verify system hostname is consistent and right

* Fiel Sharing: Disabled

* Media Sharing: Disabled

#### Mouse and Touchpad

Scroll Direction: Natural

#### Keyboard

* System: Show the Overview: F3 (Like MacOS)

* Lower windows below other windows: Right Menu Key (Windows keyboards)

#### Color

* No customizations

#### Printing

* Setup a local printer if there is one

#### Accessibility

#### Privacy & Security

#### System

Date & Time: Automatic Date & Time
Date & Time: Automatic Time Zone
Date & Time: Time Format: AM/PM
Date & Time: Week Day
Date & Time: Date

Users: Set Photo for primary user login

Users: Enable fingerprint login

Users: Create guest and other users as needed

Remote Desktop: Desktop Sharing: Disabled

Secure Shell: Enabled

### Step 15 - Gnome Tweak Tool Configurations

If the user's previous home directory was restored, these settings should already be configured.

This is my list to track what is important to me:

* Fonts
    * Default fonts: `Cantarell`, Monospace text: `Source Code Pro`
* Appearance:
    * Background/default image: Set to a past nice blue Fedora background.
* Mouse & Touchpad:
    * Touchpad Accelleration: Enabled
    * Scrolling Method: Default
* Keyboard
    * Nothing special
* Windows
    * Double-Click: Toggle Maximize
    * Middle-Click: Toggle Maximize Vertically
    * Maximize (window feature): Enable
    * Minimize (window feature): Enable
    * Placement: Right
    * Attach Modal Dialogs: Enable
    * Window Focus: Focus on Hover (Mousefocus)
* Startup Applications
    * None

### Step 16 - Gnome Shell Extensions

Extensions extend or configure the GNOME Gui environment via Javascript plugins.

Use the Gnome `Extensions` GUI app or visit [extensions.gnome.org](https://extensions.gnome.org/) and install the following extensions:

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

    * Configured via rpm package now

    * Click on Date/Time on top bar to configure locations

* [Media Controls](https://extensions.gnome.org/extension/4470/media-controls/) Controls AV media on the panel.

* [Panel World Clock](https://extensions.gnome.org/extension/72/recent-items/) - Track recently opened files and add drop down applet to make re-opening them very easy

* [Recent Items by bananenfisch](https://extensions.gnome.org/extension/72/recent-items/) - Track recently opened files and add drop down applet to make re-opening them very easy

    * Go to the Recent Items home page, download the most recent and install per instructions.

* [No Overview at Startup](https://extensions.gnome.org/extension/4099/no-overview/)

### Step 17 - Solarize gnome-shell and vim

Apply a low contrast color palette to gnome-shell windows using [this guide on if-not-true-then-false.com](https://www.if-not-true-then-false.com/2012/solarized-linux/#solarized-gnome-terminal

Apply the same to vim using [this guide](https://www.if-not-true-then-false.com/2012/solarized-linux/#solarized-vim)

### Step 18 - Work Around Accommodations

Record any known work arounds to issues here so they can be easily performed on a new deployment.

### Step 19 - QA Checklist

Take the system for a drive and see if anything feels broken.

Instead of a formal checklist (which I always ignored), actual use of the system is the best way to find things.
