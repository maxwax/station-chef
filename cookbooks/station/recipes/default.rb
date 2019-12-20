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

# Install and Remove standard sets of wanted/unwanted packages
include_recipe 'station::usr_local'

# Install personal files for primary user
include_recipe 'station::user'

# Configure firewall for personal workstation use
include_recipe 'station::firewall'

# Install Google Chrome
include_recipe 'station::google-chrome'

# Install VirtualBox
#include_recipe 'station::virtualbox'

# Install VirtualBox
include_recipe 'station::atom'