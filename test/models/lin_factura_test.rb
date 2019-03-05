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

require 'test_helper'

class LinFacturaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
