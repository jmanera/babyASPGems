class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.integer :idCliente
      t.string :Nombre
      t.string :CIF

      t.timestamps
    end
  end
end