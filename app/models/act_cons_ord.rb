class ActConsOrd
  include Mongoid::Document

  field :code, type: String
  field :desc, type: String
  field :imp_anual_lic, type: Float
  field :imp_anual_adj, type: Float
  field :baja, type: Float
  field :fecha_ini_contrato, type: Date
  field :fecha_fin_contrato, type: Date
  field :clave_proy, type: String
  field :num_ia, type: String
  field :fecha_ia, type: Date
  field :n_pedido, type: String
  field :n_contrato, type: String

  validates_uniqueness_of :code

end
