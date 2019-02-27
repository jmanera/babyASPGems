class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.String :Nombre
      t.String :Descripcion
      t.Integer :Stock
      t.Integer :Precio_Unitario

      t.timestamps
    end
  end
end
