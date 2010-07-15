require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe "Yogo::Project" do
  before(:all) do
    
  end
  
  describe "class" do
    it "should be a datamapper model" do
      Yogo::Project.should be_a_kind_of(DataMapper::Model)
    end
    
    it "should have a default_data_repository_name" do
      Yogo::Project.should respond_to(:default_data_repository_name)
    end
    
    describe "default_data_repository_name" do
      it "should be a symbol" do
        Yogo::Project.default_data_repository_name.should be_a_kind_of(Symbol)
      end
      
      it "should initially be :project_data" do
        repo_name = Yogo::Project.default_data_repository_name
        expected = :project_data
      end
    end
  end
  
  describe "creation" do
    it "should require a name"
    it "should not require a description"
  end
  
  describe "instance" do
    before(:each) do
      @project = Yogo::Project.create(:name => "A Test Project")
    end
    
    after(:each) do
      @project.destroy
    end
    
    it "should allow name to be changed" do
      new_name = "Renamed Project"
      @project.name = new_name
      @project.should be_valid
      @project.save.should be_true
      @project.name.should == new_name
    end
    
    it "should allow description to be changed" do
      new_description = "This is a simply a test project."
      @project.description = new_description
      @project.should be_valid
      @project.save.should be_true
      @project.description.should == new_description
    end
    
    it "should have a data_repository" do
      @project.should respond_to(:data_repository)
    end
    
    describe "data_repository" do
      it "should be a datamapper respository" do
        @project.data_repository.should be_a_kind_of(DataMapper::Repository)
      end
    end
    
    it "should have collections"
    describe "collections" do
      it "should create a collection"
      it "should return a list of collections"
    end
  end
  
end