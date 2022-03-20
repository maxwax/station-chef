#
# Cookbook:: station
# Recipe:: repo_packages
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

node['station']['repo_packages'].each do |_repo_name, repo_config|
  repo_config.each do |_rp_key, rp_config|
    remote_file "#{rp_config['path']}" do
      path "/tmp/#{rp_config['path']}"
      source "#{rp_config['source']}"
      action :create

      not_if { node['packages'].key?(rp_config['pkg_name']) }
    end

    package "#{rp_config['path']}" do
      source "/tmp/#{rp_config['path']}"
      action :install

      not_if { node['packages'].key?(rp_config['pkg_name']) }
    end
  end
end
