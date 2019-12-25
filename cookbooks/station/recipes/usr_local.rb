#
# Cookbook:: station
# Recipe:: usr_local
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Deploy various scripts to /usr/local/bin and /usr/local/etc
#>
=end
my = node['station']['user']

# Create a directory where all downloaded tar files will be unpacked.
# This way we can delete this directory to clean up untarred files regardless
# of the subdirectories created by the tar file extractionj
untar_dir = "/tmp/untar"

#
# These are scripts or config files stored in this Chef repo
#
node['station']['usr_local']['cookbook_scripts'].each do |usr_local_dir, scripts|

  scripts.each do |script_name|
    cookbook_file "/usr/local/#{usr_local_dir}/#{script_name}" do
      source "usr/local/#{usr_local_dir}/#{script_name}"
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
  end

end

#
# These are scripts I've published on github
# Download a tgz release file, untar it, run an install script, remove tar files
#
node['station']['usr_local']['remote_scripts'].each do |usr_local_dir, script_details|

  # usr_local_dir expected to be bin, etc, sbin, etc

  script_details.each do |script_name, script_info|

    directory untar_dir do
      owner 'root'
      group 'root'
      mode 0755
      action :create
    end

    download_filename = "#{untar_dir}/#{script_info['filename']}"

    remote_file download_filename do
      source "#{script_info['source']}/#{script_info['filename']}"
      owner my['username']
      group my['group']
      mode '0644'
      action :create
    end

    case script_info['file_type']
      when 'tgz'
        execute "untar-#{script_name}" do
          command "tar xf #{download_filename}"
          cwd "#{untar_dir}"
        end
      end

    execute "install-#{script_name}" do
      command "#{untar_dir}/#{script_name}-#{script_info['version']}/#{script_info['install_script']}"
      cwd "#{untar_dir}/#{script_name}-#{script_info['version']}"
    end

    directory untar_dir do
      owner 'root'
      group 'root'
      mode 0755
      recursive true
      action :delete
    end

  end
end