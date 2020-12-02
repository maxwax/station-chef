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

remote_file "aws_cli_zip" do
  path "/home/#{my['username']}/Downloads/#{node['station']['aws_cli']['package_name']}"
  source "#{node['station']['aws_cli']['rpm_source']}/#{node['station']['aws_cli']['package_name']}"
  action :create

  not_if { File.exists?("/usr/local/bin/aws")}
end

execute 'unzip_aws_cli' do
  command "unzip /home/#{my['username']}/Downloads/#{node['station']['aws_cli']['package_name']}"

  cwd "/home/#{my['username']}/Downloads"

  not_if { File.exists?("/usr/local/bin/aws")}
end

execute 'install_aws_cli' do
  command "/home/#{my['username']}/Downloads/aws/install"

  not_if { File.exists?("/usr/local/bin/aws")}
end
