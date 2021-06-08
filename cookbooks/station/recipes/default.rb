#
# Recipe:: default
# Cookbook:: station
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Call sub recipes to install and configure various components
#>
=end

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

# Install personal files for root user
include_recipe 'station::root'

# Configure firewall for personal workstation use
include_recipe 'station::firewall'

# Install Google Chrome
include_recipe 'station::google-chrome'

# Install VirtualBox
include_recipe 'station::virtualbox'

# Install Atom editor
include_recipe 'station::atom'

# Install Zoom
include_recipe 'station::zoom'

# Enable SSH Server
include_recipe 'station::sshd'

# Create standard NFS mounts for NAS shares
include_recipe 'station::mount_points'

# Deploy system config files for my custom scripts
include_recipe 'station::etc_config'

# Enable the fstrim time to TRIM SSD drives periodically
include_recipe 'station::fstrim'

# Add additional groups to the system
include_recipe 'station::other_groups'

# Add optional typefaces from a local maxlab typeface repo
include_recipe 'station::typefaces'

# Install and configure roxterm
include_recipe 'station::roxterm'

# Install Skype
#include_recipe 'station::skype'

# Install the AWS CLI
include_recipe 'station::aws_cli'

# Tag this node as managed by the station cookbook
tag('station-managed')
