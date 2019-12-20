#
# Cookbook:: station
# Recipe:: firewall
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Set default firewalld zone and allow some services
#>
=end

my = node['station']['user']

# Set the default zone
execute "set-default-zone" do
  command "firewall-cmd --set-default-zone=#{my['firewall']['default_zone']}"
end

# Open each allowed service
my['firewall']['services_allowed'].each do |service_name|
  execute "add-service #{service_name}" do
    command "firewall-cmd --zone=#{my['firewall']['default_zone']} --add-service=#{service_name} --permanent"
  end
end

# Open each allowed port
my['firewall']['ports_allowed'].each do |port_name|
  execute "--add-port #{port_name}" do
    command "firewall-cmd --zone=#{my['firewall']['default_zone']} --add-port=#{port_name} --permanent"
  end
end

# Activate the permanent changes made above
execute "reload-firewall" do
  command "firewall-cmd --reload"
end