class LinFactura < ApplicationRecord
	belongs_to :factura, :foreign_key => :NumFactura, :primary_key => :id
end
