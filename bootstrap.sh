#!/bin/bash

#
# bootstrap.sh from https://github.com/maxwax/station
#
# Install Chef Workstation tool then use the 'station' Chef cookbook
# to automate provisioning of my personal workstation
#
# 2019-12-20 Initial WIP
# 2020-02-04Bug fix on knife node environment set..
# 2020-12-02 Various improvements

CHEF_SEEN=false
function check_chef {

  rpm -q chef > /dev/null 2>&1
  if [[ $? == 0 ]]
  then
    CHEF_SEEN=true
  else
    CHEF_SEEN=false
  fi
}

# Ensure that the user runs this script (and the embedded
# chef-client -z command from within the 'station' directory
# this will ensure that chef zero creates a persistent 'nodes' directory
# alongside the chef code.
if [[ ! -f ./bootstrap.sh ]]
then
  echo "Please run this script from the 'station' directory'"
  exit 1
fi

# I'd like to automate this, but it needs a "Download <last stable version"
# link on Chef's download page in order to do so.  Until then, take the user
# to this page and have them select it manually

check_chef
if [[ $CHEF_SEEN == false ]]
then

  echo
  firefox --new-window https://downloads.chef.io/chef-workstation &
  echo

  echo
  echo "Manually download the latest Chef Workstation via Firefox"
  echo
  read -p "Press 'ENTER' when ready to proceed:"
  echo

  DL=/home/$USERNAME/Downloads

  ls -l $DL/chef*rpm
  CHEF_COUNT=$(ls -l $DL/chef*rpm | wc -l)
  if [[ $CHEF_COUNT -eq 1 ]]
  then
    sudo dnf -y install $DL/chef*rpm
  elif [[ $CHEF_COUNT -gt 1 ]]
    echo "Error: I see more than one chef*rpm file in $DL"
    echo "I don't know which one to install."
    exit 1
  else
    echo "Error: I can't find a $DL/chef*rpm file to install"
    exit 1
  fi
fi

# First run creates the chef-zero node object
sudo chef-client -z

# Change ownership of the root created nodes/ directory to my user from root
sudo chown -R $USER:$USER nodes

# Now we can add a runlist to the node object
sudo knife node run_list add $(hostname -f) 'recipe[station]' -z

# Set the new node to the 'maxlab' environment
sudo knife node environment set $(hostname -f) 'maxlab' -z

# Now run chef-client again with the station run list
sudo chef-client -z

# Launch firefox and prompt to download Extension Pack
firefox --new-tab https://www.virtualbox.org/wiki/Downloads &
