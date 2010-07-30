require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe "Collection Schema" do  
  before(:each) do
    @manager = Yogo::Project.create(:name => "A Test Project")
    @collection = @manager.data_collections.create(:name => "CercalDB")
  end
  
  after(:each) do
    @manager.data_collections.destroy
    @manager.destroy
  end
  
  it_should_behave_like "All Collections"
  
  

  

end