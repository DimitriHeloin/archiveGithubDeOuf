class Repo
  include Mongoid::Document
	belongs_to :Event

  field :id, type: Integer
  field :name, type: String
  field :url, type: String
end
