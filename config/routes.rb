Rails.application.routes.draw do
  

  get "/signup", to: "usuarios#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  get "/registro", to: "usuarios#registro"
  
  #resources :usuarios
  resources :sessions

  resources :documentos_pedidos do
    resources :documentos_lin_pedidos
  end

  #get 'documentos_lin_pedidos/index'

  
  
  #get 'usuarios/registro'
  post 'usuarios/new'
  
  #Generacion por defecto de las URL o rutas para las clases de todos los usuarios
  #resources :usuarios_clases

  # Generacion de URL o rutas anidadas que corresponde a cada clase(hijo) por usuario(padre) 
  resources :usuarios do
    resources :usuarios_clases
    resources :documentos_pedidos
    get 'RotacionDetallada', action: :index, controller: 'usuarios_clases'
    get 'LotesVencidos', action: :index, controller: 'usuarios_clases'
  end
  

  
  #get 'usuarios_clases/soaprotaciondetallada'
  post 'usuarios_clases/soaprotaciondetallada'

  #get 'usuarios_clases/lotesclase'
  post 'usuarios_clases/lotesclase'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #root 'servicios#index'
  root "sessions#new"
  #root 'sessions#welcome'

  
 
end
