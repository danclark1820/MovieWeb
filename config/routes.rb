MovieWeb::Application.routes.draw do
  root to: 'movies#index'
  resources :movies
  devise_for :users
end
