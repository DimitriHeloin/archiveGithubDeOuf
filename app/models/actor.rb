class Actor
 include Mongoid::Document

	field :_id, type: Integer
	field :login, type: String
	field :gravatar_id, type: Integer
	field :url, type: String
	field :avatar_url, type: String

	embedded_in :event

end