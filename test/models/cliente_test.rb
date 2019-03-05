# == Schema Information
#
# Table name: clientes
#
#  id         :bigint(8)        not null, primary key
#  idCliente  :integer
#  Nombre     :string
#  CIF        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
