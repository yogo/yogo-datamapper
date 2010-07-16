require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec_helper'))

describe "Yogo::Project::Collection" do
  describe "creation" do
    it "should require a name"
    it "should not require a description"
  end
  
  describe "instance" do
    before(:all) do
    end
    
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
      @project.should respond_to(:data_repository)
    end
    
    describe "data_repository" do
      it "should be a datamapper respository" do
        @project.data_repository.should be_a_kind_of(DataMapper::Repository)
      end
    end
    
    it "should have data" do
      @collection.should respond_to(:data)
    end
    
    describe "data" do
      before(:each) do
        @data = @collection.data
      end
      
      it "should be a datamapper model" do
        @data.should be_a_kind_of(DataMapper::Model)
      end
      
      it "should use the @collection data_repository" do
        @data.repository.should == @collection.data_repository
      end
      
      describe "with definition" do
        describe "dumping" do
          it "should have dump_definition method" do
            @data.should respond_to(:dump_definition)
          end
          
          it "should return a Hash from dump_definition" do
            @data.dump_definition.should be_a_kind_of(Hash)
          end
          
          it "should return a dump_definition with an added property" do
            prop_name = :test_property
            prop_type = String
            prop_opts = {}
            
            @data.property(:test_property, String, prop_opts)
            
            dump = @data.dump_definition
            dumped_props = dump[:properties]
            dumped_props.size.should == 1
            
            dumped_prop = dumped_props[:test_property]
            dumped_prop[:name].should == prop_name
            dumped_prop[:type].should == prop_type.name
            dumped_prop[:options].should == prop_opts
          end
        end
        
        describe "loading" do
          it "should have load_definition method" do
            @data.should respond_to(:load_definition)
          end
          
          it "should load properties from a definition"
        end
      end
    end
  end
end