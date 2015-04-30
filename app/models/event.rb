class Event
  include Mongoid::Document
  has_one :org
  has_one :repo
  
  field :id, type: String
  field :type, type: String
  field :public, type: Mongoid::Boolean
end
