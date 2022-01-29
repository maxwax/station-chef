#
# Cookbook:: station
# Recipe:: solarized
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Configure vim and bash for solarized color scheme
#>
=end

# Just for each access later
my = node['station']['user']

directory "/home/#{my['username']}/.vim" do
  owner my['username']
  group my['group']
  mode my['mode_config_dir']
  action :create
end

directory "/home/#{my['username']}/.vim/colors" do
  owner my['username']
  group my['group']
  mode my['mode_config_dir']
  action :create
end

cookbook_file "/home/#{my['username']}/.vim/colors/solarized.vim" do
  source "home/vim/colors/solarized.vim"
  owner my['username']
  group my['group']
  mode my['mode_config_file']
  action :create
end
