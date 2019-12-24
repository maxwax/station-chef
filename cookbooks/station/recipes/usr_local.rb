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

node['station']['usr_local']['bin']['cookbook_scripts'].each do |fname|
  cookbook_file "/usr/local/bin/#{fname}" do
    source "usr/local/etc/#{fname}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end

#%W(shell-basics shell-history shell-prompt-powerline).each do |fname|
node['station']['usr_local']['etc']['cookbook_scripts'].each do |fname|
  cookbook_file "/usr/local/etc/#{fname}" do
    source "usr/local/etc/#{fname}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end

node['station']['usr_local']['bin']['remote_scripts'].each do |script_name, script_info|

  download_filename = "/tmp/#{script_info['filename']}"

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
        cwd "/tmp"
      end
    end

  execute "install-#{script_name}" do
    command "/tmp/#{script_name}-#{script_info['version']}/#{script_info['install_script']}"
    cwd "/tmp/#{script_name}-#{script_info['version']}"
  end

  file download_filename do
    action :delete
  end

end