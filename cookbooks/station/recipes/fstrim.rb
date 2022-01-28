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

# Old way, remove later
# execute 'fstrim-timer' do
#   command 'systemctl enable fstrim.timer'
#
#   action :run
# end

systemd_unit 'fstrim.timer' do

  action [:enable, :start]

end
