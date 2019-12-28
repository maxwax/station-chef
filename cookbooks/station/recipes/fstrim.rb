#
# Cookbook:: station
# Recipe:: fstrim
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Enable the fstrim timer event to periodically TRIM SSD drives
#>
=end

execute 'fstrim-timer' do
  command 'systemctl enable fstrim.timer'

  action :run
end
