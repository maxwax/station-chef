#
# Cookbook:: station
# Recipe:: timemachine
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

# my = node['station']['user']

timemachine_cfg = node['station']['timemachine_cfg']

# Delete any previous download dir that may exist
# This is normally in /tmp and won't persist reboots or OS-reinstalls,
# but do this for safety reasons to avoid unzip
# asking about overwriting existing files
directory timemachine_cfg['download_dir'] do

  recursive true

  action :delete

  not_if do
    File.exist?('/usr/local/bin/timemachine') &&
      File.readlines('/usr/local/bin/timemachine').grep(/MY_VERS=\"#{timemachine_cfg['version']}/).any?
  end

  # Safety check, only recursively delete a directory in a variable
  # if the variable is only a subdirectory within /tmp
  only_if do
    Dir.exist?(timemachine_cfg['download_dir']) &&
      timemachine_cfg['download_dir'][0..4] == '/tmp/'
  end
end

directory timemachine_cfg['download_dir'] do
  action :create
end

# Download the remote file to a unique directory in /tmp
remote_file 'timemachine-tarball' do
  path "#{timemachine_cfg['download_dir']}/#{timemachine_cfg['package_name']}"

  source "#{timemachine_cfg['rpm_source']}/#{timemachine_cfg['package_name']}"

  action :create

  not_if do
    File.exist?('/usr/local/bin/timemachine') &&
      File.readlines('/usr/local/bin/timemachine').grep(/MY_VERS=\"#{timemachine_cfg['version']}/).any?
  end
end

# Unpack its files
execute 'untar-timemachine' do
  command "tar xvf #{timemachine_cfg['package_name']}"

  cwd timemachine_cfg['download_dir']

  not_if do
    File.exist?('/usr/local/bin/timemachine') &&
      File.readlines('/usr/local/bin/timemachine').grep(/MY_VERS=\"#{timemachine_cfg['version']}/).any?
  end
end

execute 'install_timemachine' do
  command 'make install'

  cwd "#{timemachine_cfg['download_dir']}/linux-timemachine-#{timemachine_cfg['version']}"

  not_if do
    File.exist?('/usr/local/bin/timemachine') &&
      File.readlines('/usr/local/bin/timemachine').grep(/MY_VERS=\"#{timemachine_cfg['version']}/).any?
  end
end

directory timemachine_cfg['download_dir'] do

  recursive true

  action :delete

  only_if { Dir.exist?(timemachine_cfg['download_dir']) && timemachine_cfg['download_dir'][0..4] == '/tmp/' }
end
