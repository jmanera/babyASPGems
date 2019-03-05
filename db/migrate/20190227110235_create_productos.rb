class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :Nombre
      t.string :Descripcion
      t.integer :Stock
      t.integer :Precio_Unitario

      t.timestamps
    end
  end
end
