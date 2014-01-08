BonsaiErpSite::Application.routes.draw do

  post '/contact' => 'contact#create'

  get '/404', to: 'home#index'
  root to: 'home#index'
end
