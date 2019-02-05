class CreateLinFacturas < ActiveRecord::Migration[5.2]
  def change
    create_table :lin_facturas do |t|
      t.integer :NumFactura
      t.text :Concepto
      t.decimal :Cantidad
      t.decimal :Precio
      t.decimal :Total

      t.timestamps
    end
  end
end
