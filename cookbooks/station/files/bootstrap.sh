#!/bin/bash

export EDITOR=vi

cd $HOME/Downloads

sudo dnf install ./chef-workstation*rpm

sudo knife node add run_list $(hostname -f) 'recipe[station]'

sudo chef-client -z