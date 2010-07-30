$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

SPEC_TMP_DIR = File.join(File.expand_path(File.dirname(__FILE__)), 'tmp')

require 'spec'
require 'spec/autorun'
require 'dm-migrations'
require 'yogo/project'
require 'yogo/collection'

require 'ruby-debug'


Spec::Runner.configure do |config|
  config.before(:suite) do
    DataMapper.finalize
    @default = DataMapper.setup(:default, :adapter => 'sqlite3', :database => "#{SPEC_TMP_DIR}/projects.db")
    # @data = DataMapper.setup(Yogo::Project.default_data_repository_name, 
    #                                     "persevere://localhost:8080")
    debugger
    @collection_data = DataMapper.setup(:collection_data, :adapter => 'sqlite3', :database => "#{SPEC_TMP_DIR}/collection_data.db")
    
    DataMapper.finalize
    DataMapper.auto_migrate!
  end
end
