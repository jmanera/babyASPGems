class ProductosController < ApplicationController

  def new
    @pr = Producto.new
  end

  def create
    @nuevo = Producto.new(params_producto)
    if @nuevo.save
      redirect_to action: "index"
    end
  end

  def index
    @productos = Producto.all
  end

  def show
    @producto = Producto.find(params[:id])
  end

  def edit
    @producto = Producto.find(params[:id])
  end

  def update
    producto = Producto.find(params[:id])
    if producto.update(params_producto)
      redirect_to action: "index"
    end
  end

  def destroy
    producto = Producto.find(params[:id])
    if producto.destroy!
      redirect_to action: "index"
    end
  end


  private
  def params_producto
    params.require(:producto).permit(:Nombre, :Descripcion, :Stock, :Precio_Unitario)
  end
end
