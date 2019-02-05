class Factura < ApplicationRecord
	belongs_to :cliente, :foreign_key => :Cliente, :primary_key => :idCliente
	has_many :lin_facturas
end
