class ClientesController < ApplicationController
	

	def new
		@cl = Cliente.new
	end

	def create
		@nuevo = Cliente.new(params_cliente)		
		if @nuevo.save
	        redirect_to action: "index"	    
	    end
	end

	def index
		@clientes = Cliente.all
	end

	def show
		@cliente = Cliente.find(params[:id])		
	end

	def edit
		@cliente = Cliente.find(params[:id])
	end

	def update
		cliente = Cliente.find(params[:id])
		if cliente.update(params_cliente)
			redirect_to action: "index"
		end
	end

	def destroy
		cliente = Cliente.find(params[:id])
		if cliente.destroy!
			redirect_to action: "index"
		end
	end

	# Metodos personalizados
	def exportXLS
		require 'rubygems'
		require 'write_xlsx'

		clientes = Cliente.all

		# Creamos el archivo
		archivo_salida = 'clientes.xlsx'
		workbook = WriteXLSX.new(archivo_salida)

		# Anyadimos una hoja
		worksheet = workbook.add_worksheet

		# Creamos un formato (solo negrita)
		format = workbook.add_format
		format.set_bold

		# Ponemos las cabeceras en negrita
		worksheet.write("A1", "Num. Cliente", format)
		worksheet.write("B1", "Nombre", format)
		worksheet.write("C1", "CIF", format)

		row = 2
		clientes.each do |c|
			worksheet.write('A' + row.to_s, c.idCliente)
			worksheet.write('B' + row.to_s, c.Nombre)
			worksheet.write('C' + row.to_s, c.CIF)
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

		cadena_html = "<h3>Listado de Clientes</h3><table width='100%'><tr><td><strong>Num. Cliente</strong></td><td><strong>Nombre</strong></td><td><strong>CIF</strong></td></tr>";

		clientes = Cliente.all

		clientes.each do |cl|
			cadena_html = cadena_html + "<tr><td>" + cl.idCliente.to_s + "</td><td>" + cl.Nombre + "</td><td>" + cl.CIF + "</td></tr>";
		end

		cadena_html = cadena_html + "</table>"
		pdf = WickedPdf.new.pdf_from_string(cadena_html)

		archivo_salida = 'clientes.pdf'
		File.open(archivo_salida, 'wb') do |file|
		  file << pdf
		end
		send_file archivo_salida, :filename => archivo_salida
	end
	# FIN Metodos personalizados

	private
	  def params_cliente
	    params.require(:cliente).permit(:idCliente, :Nombre, :CIF)
	  end
end
