source :rubygems

DATAMAPPER = 'git://github.com/datamapper'
DM_VERSION = '~> 1.0.0'
DO_VERSION = '~> 0.10.3'

gem 'activesupport',  '~> 3.0.0.beta4', :require => 'active_support'

gem "dm-core",        DM_VERSION
gem "dm-aggregates",  DM_VERSION    
gem "dm-types",       DM_VERSION,     :git => "#{DATAMAPPER}/dm-types.git",
                                      :require => false
gem "dm-migrations",  DM_VERSION    
gem "dm-validations", DM_VERSION    
gem "dm-serializer",  DM_VERSION    
gem "dm-timestamps",  DM_VERSION
gem 'deep_merge'

group :development do
  gem "rake"
  gem "jeweler"
  gem "rspec"
  gem "yard"
  gem "ruby-debug"
  gem "dm-sqlite-adapter"
  # gem "dm-persevere-adapter", :path => "~/Projects/yogo/dm-persevere-adapter"
end