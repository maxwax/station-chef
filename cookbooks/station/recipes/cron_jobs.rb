#
# Cookbook:: station
# Recipe:: cron_jobs
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

cron_config = node['station']['cron_jobs']

cron_config.each do |cron_id, cron_cfg|

  cron cron_id do
    command     cron_cfg['command']
    minute      cron_cfg['minute']
    hour        cron_cfg['hour']
    day         cron_cfg['day']
    month       cron_cfg['month']
    weekday     cron_cfg['day_of_week']
    user        cron_cfg['user']

    action :create
  end
end
