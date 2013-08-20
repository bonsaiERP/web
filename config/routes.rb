BonsaiErpSite::Application.routes.draw do

  get '/product' => 'home#product'
  get '/prices' => 'home#prices'
  get '/about' => 'home#about'


  root to: 'home#index'
end
