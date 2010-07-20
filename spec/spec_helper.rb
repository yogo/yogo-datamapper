$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))


require 'spec'
require 'spec/autorun'
require 'dm-migrations'
require 'yogo/project'

require 'ruby-debug'


Spec::Runner.configure do |config|
  config.before(:suite) do
    DataMapper.finalize
    @default = DataMapper.setup(:default, "sqlite3::memory:")
    # @data = DataMapper.setup(Yogo::Project.default_data_repository_name, 
    #                                     "persevere://localhost:8080")
    
    Yogo::Project.auto_migrate!
    Yogo::Project::Collection.auto_migrate!
    
    @project_data = DataMapper.setup(:project_data, "persevere://localhost:8080")
  end
end
