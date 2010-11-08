require 'yogo/operation'
require 'yogo/datamapper/model/operations'

module Yogo
  module DataMapper
    module Model
      Operations = {}
      Operations['identity'] = Op.on(::DataMapper::Model){ |model| model }
    end # Model
  end # DataMapper
end # Yogo

require 'yogo/datamapper/model/operations/add'
require 'yogo/datamapper/model/operations/clear'