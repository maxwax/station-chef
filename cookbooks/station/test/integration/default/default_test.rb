# InSpec test for recipe station::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

#
# Package repositories
#

describe yum.repo('rpmfusion-free') do
  it { should exist }
  it { should be_enabled }
end

describe yum.repo('rpmfusion-nonfree') do
  it { should exist }
  it { should be_enabled }
end

describe yum.repo('google-chrome') do
  it { should exist }
  it { should be_enabled }
end

describe yum.repo('virtualbox') do
  it { should exist }
  it { should be_enabled }
end

#
# Scripts from cookbook station
#

describe file('/usr/local/etc/shell-basics') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/etc/shell-history') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/etc/shell-prompt-powerline') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

#
# Scripts from github
#

describe file('/usr/local/bin/coding') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/bin/position') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/sbin/nas') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/sbin/safe') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/sbin/santoku') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/sbin/smartcap') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

describe file('/usr/local/sbin/vital-backup') do
  it { should exist }
  its('mode') { should cmp '0755'}
end

#
# Personal dot files
#

describe file('/home/maxwell/.position.conf') do
    it { should exist }
end

describe file('/home/maxwell/.santoku.conf') do
    it { should exist }
end

describe file('/home/maxwell/.vimrc') do
    it { should exist }
end

#
# Personal bin scripts
#

describe file('/home/maxwell/bin/bootstrap-maxlab') do
    it { should exist }
end

describe file('/home/maxwell/bin/git-run-meld') do
    it { should exist }
end

describe file('/home/maxwell/bin/update-maxlab-chef') do
    it { should exist }
end

#
# Firewalld config
#

describe firewalld do
  it { should be_running }
  its('default_zone') { should be eq 'public' }
  it { should have_service_eanbled_in_zone('ssh', 'public') }
end

#
# sshd config
#

describe service('ssh') do
  it { should be_running }
end

#
# Packges from standard repos
#

describe package('kernel-headers') do
  it { should be_installed }
end

describe package('evolution') do
  it { should be_installed }
end

describe package('gnupg2') do
  it { should be_installed }
end

describe package('golang') do
  it { should be_installed }
end

describe package('keepassx') do
  it { should be_installed }
end

describe package('vlc') do
  it { should be_installed }
end

describe package('powerline') do
  it { should be_installed }
end

describe package('pass') do
  it { should be_installed }
end

describe package('samba') do
  it { should be_installed }
end

describe package('smartmontools') do
  it { should be_installed }
end

describe package('vagrant') do
  it { should be_installed }
end

describe package('vim') do
  it { should be_installed }
end

describe package('wireshark') do
  it { should be_installed }
end

# Third party packages

describe package('atom') do
  it { should be_installed }
end

describe package('google-chrome-stable') do
  it { should be_installed }
end

describe package('VirtualBox-6.1') do
  it { should be_installed }
end
