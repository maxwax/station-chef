#
# Cookbook:: station
# Recipe:: sshd
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Deploy various scripts to /usr/local/bin and /usr/local/etc
#>
=end

service 'sshd' do
  action [:enable, :start]
end