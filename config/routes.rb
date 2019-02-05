Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'clientes/exportXLS' => 'clientes#exportXLS', :via => :get
  match 'clientes/exportPDF' => 'clientes#exportPDF', :via => :get
  resources :clientes

  match 'facturas/exportXLS' => 'facturas#exportXLS', :via => :get
  match 'facturas/exportPDF' => 'facturas#exportPDF', :via => :get
  match '/facturas/:id/printPDF' => 'facturas#printPDF', :via => :get, :as => :facturas_printPDF
  resources :facturas



  match 'lin_factura/createRemoto' => 'lin_factura#createRemoto', :via => :post
  resources :lin_facturas
end
