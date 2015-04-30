class Org
  include Mongoid::Document
  field :id, type: Integer
  field :login, type: String
  field :gravatar_id, type: String
  field :url, type: String
  field :avatar_url, type: String
end
