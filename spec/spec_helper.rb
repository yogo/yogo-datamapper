$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))


require 'spec'
require 'spec/autorun'
require 'dm-migrations'
require 'yogo/collection'

require 'ruby-debug'


Spec::Runner.configure do |config|
  config.before(:suite) do
    DataMapper.finalize
    @default = DataMapper.setup(:default, "sqlite3::memory:")
    # @data = DataMapper.setup(Yogo::Project.default_data_repository_name, 
    #                                     "persevere://localhost:8080")
    
    
    @collection_data = DataMapper.setup(:collection_data, "persevere://localhost:8080")
    
    class BasicProject
      include DataMapper::Resource
      property :id,   Serial
      property :name, String
      
      remix n, Yogo::Collection, :as => :collections
    end
    
    class SchemaProject
      include DataMapper::Resource
      property :id,   Serial
      property :name, String
      
      remix n, Yogo::Collection, :as => :collections
    end
    
    DataMapper.finalize
    DataMapper.auto_migrate!
  end
end
