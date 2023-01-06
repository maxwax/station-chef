#
# Recipe:: default
# Cookbook:: station
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

# Enable rpm fusion by downloading remote rpms that configure repos
include_recipe 'station::repo_packages'

# Install and Remove standard sets of wanted/unwanted packages
include_recipe 'station::packages'

# Install scripts to /usr/local from cookbook and github
include_recipe 'station::usr_local'

# Install and configure GNOME desktop shortcuts
include_recipe 'station::shortcuts'

# Install mime file helping Firefox display markdown via an extension
include_recipe 'station::firefox-markdown'

# Install personal files for primary user
include_recipe 'station::user'

# Add additional groups to the system
include_recipe 'station::other_groups'

# Install personal files for primary user
include_recipe 'station::other_users'

# Install personal files for root user
include_recipe 'station::root'

# Install Google Chrome
include_recipe 'station::google-chrome'

# Install VirtualBox
include_recipe 'station::virtualbox'

# Install Atom editor
include_recipe 'station::atom'

# Install Visual Studio Code Editor
include_recipe 'station::vscode'

# Install Zoom
include_recipe 'station::zoom'

# Install Skype
include_recipe 'station::skype'

# Install a Gnome shortcut for PyCharm
# Must be run after station:shortcuts to use /usr/share/applications/station
include_recipe 'station::pycharm'

# Install Docker Desktop
include_recipe 'station::docker_desktop'

# Enable SSH Server
include_recipe 'station::sshd'

# Create standard NFS mounts for NAS shares
include_recipe 'station::mount_points'

# Deploy system config files for my custom scripts
include_recipe 'station::etc_config'

# Deploy system config files for my custom scripts
include_recipe 'station::etc_systemd'

# Enable the fstrim time to TRIM SSD drives periodically
include_recipe 'station::fstrim'

# Add optional typefaces from a local maxlab typeface repo
include_recipe 'station::typefaces'

# Install and configure powerline
include_recipe 'station::powerline'

# Configure Solarzied Color Scheme
include_recipe 'station::solarized'

# Install the AWS CLI
include_recipe 'station::aws_cli'

# Install the Time Machine backup script from github
include_recipe 'station::timemachine'

# Install config files for proxychains
include_recipe 'station::proxychains'

# Install config files for proxychains
include_recipe 'station::x11'

# Configure firewall for personal workstation use
include_recipe 'station::firewall'

# Configure cron jobs for personal workstation use
include_recipe 'station::cron_jobs'

# Configure grub config for personal workstation use
include_recipe 'station::grub_config'

# Tag this node as managed by the station cookbook
tag('station-managed')
