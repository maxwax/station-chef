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
untar_dir = "/tmp/untar"

# We must be on the maxlab private network to access the typefaces repo
if node['domain'] == "maxlab"

  #
  # These are scripts I've published on github
  # Download a tgz release file, untar it, run an install script, remove tar files
  #
  node['station']['typefaces']['tarfiles'].each do |typeface_file|

    # usr_local_dir expected to be bin, etc, sbin, etc

    directory untar_dir do
      owner 'root'
      group 'root'
      mode 0755
      action :create
    end

    download_filename = "#{untar_dir}/#{typeface_file}.tar"

    remote_file download_filename do
      source "#{node['global']['typefaces_url']}/#{typeface_file}.tar"
      owner 'root'
      group 'root'
      mode '0644'
      action :create
    end

    execute "untar-#{typeface_file}" do
      command "tar xf #{download_filename}"
      cwd "#{untar_dir}"
    end

    # Deploy fonts system-wide. Another option would be $HOME/.local/share/fonts
    execute "install-#{typeface_file}" do
      command "tar xvf #{untar_dir}/#{typeface_file}.tar"
      cwd "/usr/share/fonts"
    end

    directory untar_dir do
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
