# Install-Guide

Rough guide to go from fresh Fedora Linux install to working DevOps workstation for Maxwell

## Requirements

* Backup of working system on NFS or USB Hard Drive

* Internet access to github for Chef repo ['station'](https://github.com/maxwax/station)

## Process

1. Backup existing workstation

1. Use USB flash to install Fedora (next) on workstation
  1. Keyboard US
  1. Timezone Denver
  1. Filesystem Configuration

    * Encrypt EVERYTHING
    * Preserve /home if possible to avoid having to restore from external source
    * Make volume group name unique for long term use

    Filesystem | Type | Size | Volume
    ---------- | ---- | ---- | ------
    `/boot`      | ext3 | 1G | n/a
    `/boot/efi`  | fat16 | 200G | n/a
    `swap`       | swap | 2G | n/a
    `/`          | ext4 | 24G | vg_sysname
    `/home`      | ext4 | Remaining | vg_sysname
  1. While install is happening, you can open another window and adjust things as needed
    1. Move /home/maxwell to /home/maxwell.backup (if you want an absolutely clean home directory to start with)

1. First boot after install
  1. WIFI selection and WPA password (optional)
  1. Privacy Options (OK)
  1. Online Accounts (skip)
  1. Full name & Username - This will be primary user with sudo
  1. Primary user password

1. Update All Packages

  ```bash
  sudo dnf -y update
  ```
  * If you see an error related to flatpak update failing, just run `dnf -y update` again.

1. Bootstrapping
  1. Clone the Chef repo ['station'](https://github.com/maxwax/station) to $HOME/Downloads
    ```bash
    cd $HOME/Downloads
    git clone https://github.com/maxwax/station
    ```
  1. Run the bootstrap script - (*without sudo!*)
    ```bash
    cd $HOME/Downloads/station
    ./bootstrap.sh
    ```
    1. Bootstrap will open a Firefox browser window on the [Chef Workstation downloads page](https://downloads.chef.io/chef-workstation)
        - Manually download Chef Workstation to $HOME/Downloads
    1. Exit Firefox
    1. Press ENTER in the bootstrap script so it will continue

  1. The bootstrap script expects to find a Chef Workstation rpm in $HOME/Downloads
    - If found, it will install Chef Workstation
    - It will prompt you to accept Chef licenses - say 'yes'
    - It will run Chef Zero once on the node to make a node object
    - It will then add the 'station' cookbook as the node's runlist
    - It will run Chef Zero again to execute the 'station' cookbook's Provisioning

1. Items completed so far
  1. Chef Workstation installed and bootstrapped
  1. rpmfusion repos installed
  1. Standard Linux packages installed
  1. Google Chrome installed
  1. Atom editor installed
  1. VirtualBox hypervisor installed
  1. Firewall configured for SSH access
  1. SSH Server enabled and started

1. Manual Steps Required
  1. Switch from Wayland display server to X-Windows

      `/etc/gdm/custom.conf`
      ```bash
      WaylandEnable=false
      ```

1. Manual Software Installation
  1. Install VirtualBox Extension Pack (and install via VirtualBox GUI Preferences)
  1. Install Slack rpm
  1. Install draw.io

1. Things to Verify
  1. Gnome Shell Extensions
    - Gnome Shell Extensions stored in a user's home dir may not work with a new version of Feora, so visit the Gnome Tweaks tool app to see what still works and what does not.
    1. Enable Launch New Instance
      - Ensures additional copies of apps launch and run if one is already running
    1. Multi-Monitors
      - Enables the Gnome Overview to summarize multiple monitors worth of content
