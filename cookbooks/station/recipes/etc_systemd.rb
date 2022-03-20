#
# Cookbook:: station
# Recipe:: etc_systemd
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

cookbook_file '/etc/systemd/logind.conf' do
  source 'etc/systemd/logind.conf'

  owner 'root'
  group 'root'
  mode '0644'

  action :create
end
