source :rubygems

DATAMAPPER = 'git://github.com/datamapper'
DM_VERSION = '~> 1.0.0'
DO_VERSION = '~> 0.10.3'

# gem 'activesupport',  '~> 3.0.0.beta4', :require => 'active_support'

gem "dm-core",        DM_VERSION
gem "dm-aggregates",  DM_VERSION

# 1.0 Release of dm-types has problems with UUID properties, use git master
gem "dm-types",       DM_VERSION,     :git => "#{DATAMAPPER}/dm-types.git",
                                      :ref => "674738f2a94788b975e9",
                                      :require => false # don't require dm-type/json

gem "dm-migrations",  DM_VERSION    
gem "dm-validations", DM_VERSION     
gem "dm-timestamps",  DM_VERSION
gem 'dm-is-remixable', DM_VERSION

gem 'yogo-support'
gem 'yogo-operation'

group :development do
  gem "rake"
  gem "jeweler"
  gem "rspec"
  gem "yard"
  gem "ruby-debug"
  gem "dm-sqlite-adapter"
  # gem "dm-persevere-adapter", :path => "~/Projects/yogo/dm-persevere-adapter"
end