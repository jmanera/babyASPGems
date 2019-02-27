class Producto < ApplicationRecord
    has_many :lin_facturas

	validates :Nombre, presence: true, uniqueness: true
end
