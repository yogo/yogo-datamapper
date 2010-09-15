require 'yogo/operation'
require 'yogo/datamapper/model/operations'

module Yogo
  module DataMapper
    module Model
      
      Operations['clear/properties'] = Op.on(::DataMapper::Model) do |model|
        model.properties.clear
        model.properties.instance_variable_get(:@properties).clear #clear out the name index
        model
      end
      
      Operations['clear/relationships'] = Op.on(::DataMapper::Model) do |model|
        model.relationships.clear
        model
      end
      
      Operations['clear/validators'] = Op.on(::DataMapper::Model) do |model|
        model.validators.clear!
        model
      end
      
      Operations['clear/all'] = Operations['clear/properties'] *
                                Operations['clear/relationships'] *
                                Operations['clear/validators']
                                
    end # Model
  end # DataMapper
end # Yogo