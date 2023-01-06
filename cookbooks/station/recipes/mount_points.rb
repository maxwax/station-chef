#
# Cookbook:: station
# Recipe:: nfs_mounts
#
# Copyright:: 2022, Maxwell Spangler, All Rights Reserved.

node['station']['mount_points'].each do |parent_dir_name, parent_config|

  # Make NFS parent directory
  directory parent_dir_name do
    owner parent_config['user']
    group parent_config['group']
    mode parent_config['mode']

    action :create

    not_if { ::File.directory?("#{parent_dir_name}") }
  end

  # Make NFS mount points within parent directory
  parent_config['sub_dirs'].each do |sub_dir_name, sub_dir_config|

    directory "#{parent_dir_name}/#{sub_dir_name}" do
      owner sub_dir_config['user']
      group sub_dir_config['group']
      mode sub_dir_config['mode']

      action :create

      not_if { ::File.directory?("#{sub_dir_name}") }
    end
  end

end
