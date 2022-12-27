
current_dir = File.dirname(__FILE__)

# Enables chef-zero with this config
local_mode		true

# Output logs to screen only
log_level                :info
log_location             STDOUT

#cache_type               'BasicFile'
#ssl_verify_mode          :verify_none
#cache_options( :path =>  "/home/maxwell/projects/chef/knife-configs/maxwell/checksums" )
#cache_options( :path =>  "checksums" )

# cookbook_path            ["/home/maxwell/projects/chef/station/cookbooks"]

cookbook_copyright "Maxwell Spangler"
cookbook_email     "maxcode@maxwellspangler.com"
cookbook_license   "mit"
