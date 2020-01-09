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

# We must be on the maxlab private network to access the typefaces repo
# This is a REALLY LAME way to do this, but it'll work for right now
if node['network']['default_gateway'] == "192.168.9.2"

  #
  # These are scripts I've published on github
  # Download a tgz release file, untar it, run an install script, remove tar files
  #
  node['station']['typefaces']['tarfiles'].each do |typeface_file|

    # usr_local_dir expected to be bin, etc, sbin, etc

    directory download_dir do
      owner 'root'
      group 'root'
      mode 0755
      action :create
    end

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

    directory download_dir do
      owner 'root'
      group 'root'
      mode 0755
      recursive true
      action :delete
    end

    execute "update-font-cache" do
      command "fc-cache"
    end

  end
end
