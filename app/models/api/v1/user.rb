class Api::V1::User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
end
