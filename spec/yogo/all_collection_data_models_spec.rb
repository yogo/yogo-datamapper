require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

shared_examples_for "All Collection Data Models" do
  it "should be a datamapper model" do
    @data_model.should be_a_kind_of(DataMapper::Model)
  end

  it "should use the collection data_repository" do
    @data_model.repository.should == @data_model.collection.collection_repository
  end

  describe "with definition" do
    describe "dumping" do
      it "should have dump_definition method" do
        @data_model.should respond_to(:dump_definition)
      end
    
      it "should return a Hash from dump_definition" do
        @data_model.dump_definition.should be_a_kind_of(Hash)
      end
    
      it "should return a dump_definition with an added property" do
        prop_name = 'test_property'
        prop_type = String
        prop_opts = {}
        
        original_props_size = @data_model.properties.size
      
        @data_model.property(prop_name.to_sym, prop_type, prop_opts)
      
        dump = @data_model.dump_definition
        dumped_props = dump['properties']
        dumped_props.size.should == original_props_size+1
      
        dumped_prop = dumped_props[prop_name]
        dumped_prop['type'].should == prop_type.name
        dumped_prop['options'].should == prop_opts
        puts dumped_prop.inspect
      end
    end
  
    describe "loading" do
      it "should have load_definition method" do
        @data_model.should respond_to(:load_definition)
      end
    
      it "should load properties from a definition" do
        definition = {
          'properties' => {
            'loaded_property' => {
              'type' => "String",
              'options' => {
                'label' => "A Test Property That Was Loaded",
                'required' => true
              }
            }
          }
        }
      
        original_props_size = @data_model.properties.size
      
        lambda { @data_model.load_definition(definition) }.should_not raise_error
        
        @data_model.properties[:loaded_property].should be_a_kind_of(DataMapper::Property)
        @data_model.properties[:loaded_property].name.should == :loaded_property
      end
    end
  end
end