class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :login, type: String
  field :password_digest, type: String

  has_secure_password

end
