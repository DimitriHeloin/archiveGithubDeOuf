class Commit
  include Mongoid::Document
	has_one :author

  	field :sha, type: String
  	field :message, type: String
  	embedded_in :event
  
end
