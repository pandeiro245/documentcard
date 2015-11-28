Rails.application.routes.draw do
  root 'cards#index'
  resources :cards do
    puts :sort
  end
  get '/auth/:provider/callback' => 'users#login'
  get '/logout' => 'users#logout'
end
