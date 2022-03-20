#
# Cookbook:: station
# Recipe:: sshd
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

service 'sshd' do
  action [:enable, :start]
end
