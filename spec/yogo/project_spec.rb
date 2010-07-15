require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe "Yogo::Project" do
  before(:all) do
    
  end
  
  describe "Yogo::Project Class" do
    it "should be a datamapper model" do
      Yogo::Project.should be_a_kind_of(DataMapper::Model)
    end
    
    it "should have a default_data_repository_name" do
      Yogo::Project.should respond_to(:default_data_repository_name)
    end
    
    describe "default_data_repository" do
      it "should be a symbol" do
        Yogo::Project.default_data_repository_name.should be_a_kind_of(Symbol)
      end
      
      it "should initially be :project_data" do
        repo_name = Yogo::Project.default_data_repository_name
        expected = :project_data
      end
    end
  end
  
end