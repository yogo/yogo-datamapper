require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

shared_examples_for "All Collections" do  
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
  
  
  it "should have a collection_repository" do
    @collection.should respond_to(:collection_repository)
  end
  
  describe "collection_repository" do
    it "should be a datamapper respository" do
      @collection.collection_repository.should be_a_kind_of(DataMapper::Repository)
    end
  end
  
  it "should have a data_model" do
    @collection.should respond_to(:data_model)
  end
  
  describe "data_model" do
    before(:each) do      
      @data_model = @collection.data_model
    end
    
    it_should_behave_like "All Collection Data Models"
  end
  
  it "should have items" do
    @collection.should respond_to(:items)
  end
  

end