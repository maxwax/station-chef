#
# Cookbook:: station
# Recipe:: grub_config
#
# Copyright:: 2022, Maxwell Spangler, All Rights Reserved.

# When running this on my HP Elitebook 840 G8 Laptop, modify the default
# kernel parameters so that the kernel feature acpi_backlight is enabled in
# grub and any kernel updates continue to use this kernel parameter.

file '/etc/default/grub.chef.backup' do
  content lazy { IO.read('/etc/default/grub') }

  only_if do
    node['hostnamectl']['hardware_model'] == 'HP EliteBook 840 G8 Notebook PC'
  end
end

# Change rhgb quiet" at end of line to rhgb quiet acpi_backlight"

# rhgb quiet"
#
# rhgb quiet acpi_backlight"

file '/etc/default/grub' do
  content lazy { IO.read('/etc/default/grub').gsub(/(rhgb quiet\")/, 'rhgb quiet acpi_backlight"') }

  only_if do
    node['hostnamectl']['hardware_model'] == 'HP EliteBook 840 G8 Notebook PC'
  end
end
