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

require 'test_helper'

class ProductoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
