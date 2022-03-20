#
# Cookbook:: station
# Recipe:: fstrim
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

systemd_unit 'fstrim.timer' do

  action [:enable, :start]

end
