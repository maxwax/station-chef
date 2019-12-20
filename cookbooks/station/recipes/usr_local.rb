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

%W(shell-basics shell-history shell-prompt-powerline).each do |fname|
  cookbook_file "/usr/local/etc/#{fname}" do
    source "usr/local/etc/#{fname}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end