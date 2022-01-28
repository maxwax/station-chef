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

root = node['station']['root']

# Create a directory where all downloaded tar files will be unpacked.
# This way we can delete this directory to clean up untarred files regardless
# of the subdirectories created by the tar file extractionj
untar_dir = "/tmp/untar"

# We track installed remote scripts with this normal attribute.
# If this doesn't already exist for this node, create the tree branch
# for it so we can use it further below.
if not node['station'].key?('remote_scripts')
  node.normal['station']['remote_scripts'] = {}
end

if not node['station']['remote_scripts'].key?('installed_scripts')
  node.normal['station']['remote_scripts']['installed_scripts'] = {}
end

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

    # I can skip the use of deploy_script and do a conditional like this:
    # If (not A) OR (not B OR not C)
    # But it looks visually confusing in my editor on six wrapped lines
    # So while this is slower, it's more legibile

    # Default to false so we don't re-deploy a script already deployed
    deploy_script = false

    # If we don't have the file we expect, then do [re-]deploy it.
    if (not ::File.exist?(script_info['condition_file']))
      deploy_script = true
    end

    # If we previously deployed, we tracked its version in an attribute
    if not node['station']['remote_scripts']['installed_scripts'].key?(script_name)
      deploy_script = true
    elsif
      previous_deploy_version = node['station']['remote_scripts']['installed_scripts'][script_name]

      # Compare the attributes, did we deploy 1.0 but we want 1.1 now?
      if previous_deploy_version != script_info['version']
        deploy_script = true
      end
    end

    if deploy_script == true

      directory untar_dir do
        owner 'root'
        group 'root'
        mode '0755'
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

      node.normal['station']['remote_scripts']['installed_scripts'][script_name] = script_info['version']

      directory untar_dir do
        owner 'root'
        group 'root'
        mode '0755'
        recursive true
        action :delete
      end

    end
  end
end
