Rails.application.routes.draw do
  root 'cards#index'
  resources :cards do
    puts :sort
  end
end
