class Author
  include Mongoid::Document

  embeds_many :events

  field :email, type: String
  field :name, type: String
  
end
