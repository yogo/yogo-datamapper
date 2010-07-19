require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe "Yogo::Project::Collection" do  
  
  describe "instance" do
    before(:each) do
      @project = Yogo::Project.create(:name => "A Test Project")
      @collection = @project.collections.create(:name => "CercalDB")
    end
    
    after(:each) do
      @project.collections.destroy
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
    
    it "should have a data_repository" do
      @collection.should respond_to(:data_repository)
    end
    
    describe "data_repository" do
      it "should be a datamapper respository" do
        @collection.data_repository.should be_a_kind_of(DataMapper::Repository)
      end
    end
    
    
    it "should have data" do
      @collection.should respond_to(:data)
    end
    
    describe "data" do
      before(:each) do
        @data_model = @collection.data
      end
      
      require 'yogo/collection_data_model_spec'
      it_should_behave_like "Collection Data Model"
    end
    
    it "should have a data_definition" do
      @collection.should respond_to(:data_definition)
    end
    
    describe "data_definition" do
      before(:each) do
        @data_definition = @collection.data_definition
      end
      
      it "should be a hash" do
        @data_definition.should be_a_kind_of(Hash)
      end
      
      it "should have :properties" do
        @data_definition.should have_key(:properties)
        @data_definition[:properties].should be_a_kind_of(Hash)
      end
      
    end
  end
end