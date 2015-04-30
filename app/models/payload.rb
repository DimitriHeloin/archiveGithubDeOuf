class Payload
  include Mongoid::Document

	field :push_id, type: Integer
	field :size, type: Integer
	field :distinct_size, type: Integer


  	field :ref, type: String
  	field :head, type: String
  	field :before, type: String
  	field :commits, type: []

  	embedded_in :event
 
  
end