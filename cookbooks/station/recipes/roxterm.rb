#
# Cookbook:: station
# Recipe:: roxterm
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install the roxterm terminal emulator and deploy custom configuration
#>
=end

my = node['station']['user']

package 'roxterm' do
  action :install
end

directory "/home/#{my['username']}/#{my['roxterm']['deploy_dir']}" do
  owner my['username']
  group my['group']
  mode my['mode']

  action :create
end

my['roxterm']['config_files'].each do |config_dir, config_files|

  directory "/home/#{my['username']}/#{my['roxterm']['deploy_dir']}/#{config_dir}" do
    owner my['username']
    group my['group']
    mode my['mode']

    action :create
  end

  config_files.each do |fname|
    cookbook_file "/home/#{my['username']}/#{my['roxterm']['deploy_dir']}/#{config_dir}/#{fname}" do
      source "#{my['roxterm']['source_dir']}/#{config_dir}/#{fname}"
      owner my['username']
      group my['group']
      mode '0644'

      action :create
    end
  end
end
