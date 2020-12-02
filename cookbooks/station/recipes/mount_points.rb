#
# Cookbook:: station
# Recipe:: nfs_mounts
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install the Atom text editor
#>
=end

my = node['station']['user']

node['station']['mount_points'].each do |parent_dir, subdir|

  # Make NFS parent directory
  directory parent_dir do
    owner 'root'
    group 'root'
    mode 0755

    action :create

    not_if { ::File.directory?("#{parent_dir}") }
  end

  # Make NFS mount points within parent directory
  subdir.each do |dirname|
    directory "#{parent_dir}/#{dirname}" do
      owner 'root'
      group 'root'
      mode 0755

      action :create

      not_if { ::File.directory?("#{dirname}") }

    end
  end

end
