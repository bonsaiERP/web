BonsaiErpSite::Application.routes.draw do

  post '/contact' => 'contact#create'

  root to: 'home#index'
end
