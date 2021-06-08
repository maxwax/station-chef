#
# Cookbook:: station
# Recipe:: typefaces
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install optional typefaces via tar files from a local, private repository
#>
=end

# Create a directory where all downloaded tar files will be unpacked.
# This way we can delete this directory to clean up untarred files regardless
# of the subdirectories created by the tar file extractionj
download_dir = "/tmp/typefaces"

directory download_dir do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

node['station']['typefaces']['tarfiles'].each do |typeface_file|

  download_filename = "#{download_dir}/#{typeface_file}.tgz"

  remote_file download_filename do
    source "#{node['global']['typefaces_url']}/#{typeface_file}.tgz"
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end

  # Deploy fonts system-wide. Another option would be $HOME/.local/share/fonts
  execute "install-#{typeface_file}" do
    command "tar xf #{download_dir}/#{typeface_file}.tgz"
    cwd "/usr/share/fonts"
  end

end

execute "update-font-cache" do
  command "fc-cache"
end

directory download_dir do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
  action :delete
  # Careful - make sure you delete only the typefaces directory in /tmp and nothing else!!
  only_if { download_dir[0..4] == '/tmp/'}
end
