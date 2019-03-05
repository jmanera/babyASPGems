# == Schema Information
#
# Table name: lin_facturas
#
#  id         :bigint(8)        not null, primary key
#  NumFactura :integer
#  Concepto   :text
#  Cantidad   :decimal(, )
#  Precio     :decimal(, )
#  Total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LinFactura < ApplicationRecord
	belongs_to :factura, :foreign_key => :NumFactura, :primary_key => :id
	belongs_to :producto, :foreign_key => :Concepto , :primary_key => :id
end
