class Role
  include Mongoid::Document

    field :code, type: String
    field :desc, type: String

    # has_and_belongs_to_many :users


end
