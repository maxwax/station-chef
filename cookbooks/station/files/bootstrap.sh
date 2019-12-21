#!/bin/bash

export EDITOR=vi

cd $HOME/Downloads

echo
firefox --new-window https://downloads.chef.io/chef-workstation &
echo

echo
read -p "Type 'go' when you've downloaded Chef Workstation to $HOME/Downloads"
echo

sudo dnf install ./chef-workstation*rpm

sudo knife node add run_list $(hostname -f) 'recipe[station]'

sudo chef-client -z