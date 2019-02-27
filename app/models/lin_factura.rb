class LinFactura < ApplicationRecord
	belongs_to :factura, :foreign_key => :NumFactura, :primary_key => :id
	belongs_to :producto, :foreign_key => :Concepto , :primary_key => :id
end
