class ConsOrd
  include Mongoid::Document
  field :nombre, type: String
  field :codigo, type: String
  field :descr, type: String
end
