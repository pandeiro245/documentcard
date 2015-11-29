Rails.application.routes.draw do
  root 'cards#index'
  resources :cards
  get '/auth/:provider/callback' => 'users#login'
  get '/logout' => 'users#logout'
  get '/rand' => 'cards#rand'
  get '/words' => 'words#index'
end
