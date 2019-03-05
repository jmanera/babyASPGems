# == Schema Information
#
# Table name: facturas
#
#  id         :bigint(8)        not null, primary key
#  NumFactura :integer
#  Fecha      :date
#  Cliente    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Factura < ApplicationRecord
	belongs_to :cliente, :foreign_key => :Cliente, :primary_key => :idCliente
	has_many :lin_facturas
end
