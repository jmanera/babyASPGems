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

require 'test_helper'

class FacturaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
