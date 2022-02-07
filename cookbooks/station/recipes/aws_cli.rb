#
# Cookbook:: station
# Recipe:: aws_cli
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install AWS CLI
#>
=end

my = node['station']['user']

aws_cli_cfg = node['station']['aws_cli_cfg']

# Delete any previous download dir that may exist
# This is normally in /tmp and won't persist reboots or OS-reinstalls,
# but do this for safety reasons to avoid unzip
# asking about overwriting existing files
directory aws_cli_cfg['download_dir'] do

  recursive true

  action :delete
end

directory aws_cli_cfg['download_dir'] do
  action :create
end

# Download the remote file to a unique directory in /tmp
remote_file "aws_cli_zip" do
  path "#{aws_cli_cfg['download_dir']}/#{aws_cli_cfg['package_name']}"

  source "#{aws_cli_cfg['rpm_source']}/#{aws_cli_cfg['package_name']}"

  action :create

  not_if { File.exists?("/usr/local/bin/aws")}
end

# Unpack its files
execute 'unzip_aws_cli' do
  command "unzip #{aws_cli_cfg['package_name']}"

  cwd aws_cli_cfg['download_dir']

  not_if { File.exists?("/usr/local/bin/aws")}
end

execute 'install_aws_cli' do
  command "#{aws_cli_cfg['download_dir']}/aws/install"

  not_if { File.exists?("/usr/local/bin/aws")}
end

directory aws_cli_cfg['download_dir'] do

  recursive true

  action :delete
end
