class LinFacturaController < ApplicationController
	def createRemoto
		nuevo = LinFactura.new
		nuevo.NumFactura = params[:NumFactura]
		nuevo.Concepto = params[:Concepto]
		nuevo.Precio = params[:Precio]
		nuevo.Cantidad = params[:Cantidad]
		nuevo.Total = nuevo.Precio * nuevo.Cantidad
		nuevo.save!
	end

	def destroyRemoto
		borrar = LinFactura.find(params[:id])
		borrar.destroy!
	end

	
	private
	  def params_lineas
	    params.require(:lin_factura).permit(:NumFactura, :Concepto, :Cantidad, :Precio)
	  end
end
