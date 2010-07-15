$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))


require 'spec'
require 'spec/autorun'
require 'yogo/project'

Spec::Runner.configure do |config|
  config.before(:suite) do
    @default = DataMapper.setup(:default, "sqlite3::memory:///yogo")
    @data = DataMapper.setup(Yogo::Project.default_data_repository_name, 
                                    "persevere://localhost:8080")
  end
end
