#!/bin/bash

#
# bootstrap.sh from https://github.com/maxwax/station
#
# Install Chef Workstation tool then use the 'station' Chef cookbook
# to automate provisioning of my personal workstation
#
# 2019-12-20 Initial WIP

cd $HOME/Downloads

# I'd like to automate this, but it needs a "Download <last stable version"
# link on Chef's download page in order to do so.  Until then, take the user
# to this page and have them select it manually

echo
firefox --new-window https://downloads.chef.io/chef-workstation &
echo

echo
echo "Manually download the latest Chef Workstation via Firefox"
echo
read -p "Type 'go' when ready to proceed:"
echo

sudo dnf -y install $HOME/Downloads/chef-workstation*rpm

cd $HOME/Downloads/station

# First run creates the chef-zero node object
sudo chef-client -z

# Now we can add a runlist to the node object
sudo knife node run_list add $(hostname -f) 'recipe[station]' -z

# Now run chef-client again with the station run list
sudo chef-client -z

# Launch firefox and prompt to download Extension Pack
firefox --new-tab https://www.virtualbox.org/wiki/Downloads &