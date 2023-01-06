#
# Cookbook:: station
# Recipe:: other_users
#
# Copyright:: 2022, Maxwell Spangler, All Rights Reserved.

node['station']['other_users'].each do |other_user_name, other_user_info|

  # Create personal group for user
  group other_user_info['group'] do
    gid other_user_info['gid']
    action :create
  end

  # Create this user
  user other_user_name do
    uid other_user_info['uid']
    gid other_user_info['group']
    manage_home true

    action :create
  end

  # Ensure this user is a member of optional groups
  other_user_info['other_groups'].each do |other_group_name|

    group other_group_name do
      # gid group_id
      members other_user_name

      # Append members to this group
      append true

      action :modify
    end
  end

  other_user_info['personal_dot_files'].each do |fname|
    cookbook_file "/home/#{other_user_name}/.#{fname}" do
      source "home/#{fname}"
      owner other_user_name
      group other_user_info['group']
      mode other_user_info['mode_config_file']
      action :create
    end
  end

  directory "/home/#{other_user_name}/bin" do
    owner other_user_name
    group other_user_info['group']
    mode other_user_info['mode_executable_file']
    action :create
  end

  other_user_info['personal_bin_scripts'].each do |fname|
    cookbook_file "/home/#{other_user_name}/bin/#{fname}" do
      source "home/bin/#{fname}"
      owner other_user_name
      group other_user_info['group']
      mode other_user_info['mode_executable_file']
      action :create
    end
  end
end
