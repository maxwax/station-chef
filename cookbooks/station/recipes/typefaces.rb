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
download_dir = "/tmp/chef_typeface_installer"

# Cycle through a list of typeface tar files, download them and untar them
# to /usr/share/fonts. Skip if the typeface's directory already exists
node['station']['typefaces']['tarfiles'].each do |typeface_filename, typeface_config|

  download_filename = "#{download_dir}/#{typeface_filename}.tgz"

  directory download_dir do
    owner 'root'
    group 'root'
    mode 0755
    action :create

    not_if { Dir.exists?(typeface_config['not_if_dir'])}
  end

  remote_file download_filename do
    source "#{node['global']['typefaces_url']}/#{typeface_filename}.tgz"
    owner 'root'
    group 'root'
    mode '0644'
    action :create

    not_if { Dir.exists?(typeface_config['not_if_dir'])}
  end

  # Deploy fonts system-wide. Another option would be $HOME/.local/share/fonts
  execute "install-#{typeface_filename}" do
    command "tar xf #{download_dir}/#{typeface_filename}.tgz"
    cwd "/usr/share/fonts"

    not_if { Dir.exists?(typeface_config['not_if_dir'])}
  end

  execute "update-font-cache" do
    command "fc-cache"

    not_if { Dir.exists?(typeface_config['not_if_dir'])}
  end

  directory "cleanup-delete-#{download_dir}" do
    owner 'root'
    group 'root'
    mode 0755
    recursive true
    action :delete
    # Careful - make sure you delete only the typefaces directory in /tmp and nothing else!!
    only_if { download_dir[0..4] == '/tmp/'}

    not_if { Dir.exists?(typeface_config['not_if_dir'])}
  end

end
