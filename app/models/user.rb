class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :login, type: String
  field :password_digest, type: String

  has_and_belongs_to_many :roles

  has_secure_password

  validates_uniqueness_of :login

end
