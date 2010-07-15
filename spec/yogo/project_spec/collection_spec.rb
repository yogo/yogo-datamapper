require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec_helper'))

describe "Yogo::Project::Collection" do
  describe "creation" do
    it "should require a name"
    it "should not require a description"
  end
  
  describe "instance" do
    before(:all) do
      @project = Yogo::Project.create(:name => "A Test Project")
    end
    
    before(:each) do
      @collection = @project.collections.create(:name => "CercalDB")
    end
    
    after(:each) do
      @project.collections.destroy
    end
    
    after(:all) do
      @project.destroy
    end
    
    it "should have a name" do
      @collection.name.should be_a_kind_of(String)
      @collection.name.should_not be_empty
    end
    
    it "should allow name to be changed" do
      new_name = "Cercal Cell DB"
      
      @collection.name = new_name
      @collection.should be_valid
      @collection.save.should be_true
      @collection.name.should == new_name
    end
    
    it "should allow description to be changed" do
      new_description = "Example Database"
      @collection.description = new_description
      @collection.should be_valid
      @collection.save.should be_true
      @collection.description.should == new_description
    end
    
    
    it "should have a project" do
      @collection.project.should == @project
      @project.should have(1).collections
    end
    
    it "should have a schema"
    it "should have data" do
      @collection.should respond_to(:data)
    end
    
    describe "data" do
      it "should be a datamapper model" do
        @collection.data.should be_a_kind_of(DataMapper::Model)
      end
      
      it "should use the project data_repository" do
        data = @collection.data
        data.repository.should == @project.data_repository
      end
    end
  end
end