# == Schema Information
#
# Table name: productos
#
#  id              :bigint(8)        not null, primary key
#  Nombre          :string
#  Descripcion     :string
#  Stock           :integer
#  Precio_Unitario :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Producto < ApplicationRecord
  has_many :lin_facturas

	validates :Nombre, presence: true, uniqueness: true
end
