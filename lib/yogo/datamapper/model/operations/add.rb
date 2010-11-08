module Yogo
  module DataMapper
    module Model
      Operations['add/property'] = Op.on(::DataMapper::Model) do |model, name, type, options|
        type ||= "String"
        options ||= {}
        
        type = ::DataMapper::Property.find_class(type.to_s)
        
        model.property(name, type, options)
        model
      end
      
      Operations['add/relationship'] = Op.on(::DataMapper::Model) do |model, method, *args|
        model.send(method, *args)
        model
      end
      
      Operations['add/has_relationship'] = Operations['add/relationship'].partial(X, :has, X, X, X)
      
      Operations['add/has_n'] = Operations['add/has_relationship'].partial(X, Infinity, X, X)
      
      Operations['add/has_1'] = Operations['add/has_relationship'].partial(X, 1, X, X)
      
      Operations['add/belongs_to'] = Operations['add/relationship'].partial(X, :belongs_to, X, X)
      
    end # Model
  end # DataMapper
end # Yogo