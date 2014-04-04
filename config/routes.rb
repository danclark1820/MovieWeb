MovieWeb::Application.routes.draw do
  root to: 'movies#index'
  resources :movies
  resources :ratings
  devise_for :users
end
