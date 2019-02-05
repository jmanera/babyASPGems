class FacturasController < ApplicationController
  def edit
  	@factura = Factura.find(params[:id])
  	@lineas = LinFactura.where(NumFactura: @factura.id)
  end

  def update
	factura = Factura.find(params[:id])
	if factura.update(params_factura)
		redirect_to action: "index"
	end
  end

  def index
  	@facturas = Factura.all
  end

  def new
  	@factura = Factura.new
  end

  def show
  	@factura = Factura.find(params[:id])

  	@lineas = LinFactura.where(NumFactura: @factura.id)
  end

  def create
	@nuevo = Factura.new(params_factura)		
	if @nuevo.save
        redirect_to action: "index"	    
    end
  end

  def destroy
		factura = Factura.find(params[:id])
		if factura.destroy!
			redirect_to action: "index"
		end
	end

  # Metodos personalizados
	def exportXLS
		require 'rubygems'
		require 'write_xlsx'

		facturas = Factura.all

		# Creamos el archivo
		archivo_salida = 'facturas.xlsx'
		workbook = WriteXLSX.new(archivo_salida)

		# Anyadimos una hoja
		worksheet = workbook.add_worksheet

		# Creamos un formato (solo negrita)
		format = workbook.add_format
		format.set_bold

		# Le ponemos un titulo
		worksheet.write("A1", "Relacion de TODAS Facturas", format)

		# Ponemos las cabeceras en negrita
		worksheet.write("A2", "Num. Factura", format)
		worksheet.write("B2", "Fecha", format)
		worksheet.write("C2", "Cliente", format)

		row = 3
		facturas.each do |f|
			worksheet.write('A' + row.to_s, f.NumFactura)
			worksheet.write('B' + row.to_s, f.Fecha.strftime("%d-%m-%Y"))
			worksheet.write('C' + row.to_s, f.Cliente)
			row = row + 1
		end

		# Cerramos la hoja
		workbook.close
		send_file archivo_salida, :filename => archivo_salida

		# TODO: Falta borrar el archivo


		#redirect_to action: "index"
	end
	
	def exportPDF
		require 'rubygems'
		require 'wicked_pdf'

		cadena_html = "<h3>Listado de Facturas</h3><table width='100%'><tr><td><strong>Num. Factura</strong></td><td><strong>Fecha</strong></td><td><strong>Cliente</strong></td></tr>";

		facturas = Factura.all

		facturas.each do |f|
			cadena_html = cadena_html + "<tr><td>" + f.NumFactura.to_s + "</td><td>" + f.Fecha.strftime("%d-%m-%Y").to_s + "</td><td>" + f.Cliente.to_s + "</td></tr>";
		end

		cadena_html = cadena_html + "</table>"
		pdf = WickedPdf.new.pdf_from_string(cadena_html)

		archivo_salida = 'facturas.pdf'
		File.open(archivo_salida, 'wb') do |file|
		  file << pdf
		end
		send_file archivo_salida, :filename => archivo_salida
	end

	def printPDF
		require 'rubygems'
		require 'wicked_pdf'

		factura = Factura.find(params[:id])
		cliente = Cliente.where(id: factura.Cliente).take
		lineas = LinFactura.where(NumFactura: factura.id)

		cadena_html = "<div style='border: 1px solid black; width: 49%; float: left; position: relative;'><ul style='list-style-type: none;'><li>EMPRESA DE PRUEBAS</li><li>B-99999999</li><li>C/ Mayor 5</li><li>123466 - LOCALIDAD</li><li>PROVINCIA - PAIS</li></ul></div>";

		cadena_html = cadena_html + "<div style='border: 1px solid black; width: 49%; float: right; position: relative;'><ul style='list-style-type: none;'><li>" + cliente.Nombre + "</li><li>" + cliente.CIF + "</li><li>Bill Date: " + factura.Fecha.strftime("%d-%m-%Y").to_s + "</li></ul></div>";

		cadena_html = cadena_html + '<table width="100%">'
		
		cadena_html = cadena_html + "<tr><td>Concept</td><td>Quantity</td><td>Price</td><td>Total</td></tr>"

		lineas.each do |l|
			cadena_html = cadena_html + "<tr><td>" + l.Concepto + "</td><td>" + l.Cantidad.to_s + "</td><td>" + l.Precio.to_s + "</td><td>" + l.Total.to_s + "</td></tr>"
		end

		cadena_html = cadena_html + "</table>"

		pdf = WickedPdf.new.pdf_from_string(cadena_html)

		archivo_salida = 'facturas_' + factura.NumFactura.to_s + '.pdf'
		File.open(archivo_salida, 'wb') do |file|
		  file << pdf
		end
		send_file archivo_salida, :filename => archivo_salida
	end
	# FIN Metodos personalizados

  private
	  def params_factura
	    params.require(:factura).permit(:NumFactura, :Fecha, :Cliente)
	  end
end
