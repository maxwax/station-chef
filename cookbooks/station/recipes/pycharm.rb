#
# Cookbook:: station
# Recipe:: pycharm
#
# Copyright:: 2022, Maxwell Spangler, All Rights Reserved.

#
# Deploys a GNOME desktop shortcut for the manually installed PyCharm IDE
#
# The IDE is installed via tar file not rpm and doesn't have a source repo
#

pycharm_cfg = node['station']['pycharm_cfg']

cookbook_file '/usr/share/applications/station/pycharm.desktop' do
  source 'usr/share/applications/station/pycharm.desktop'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
