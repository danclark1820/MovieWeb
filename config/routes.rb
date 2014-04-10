MovieWeb::Application.routes.draw do
  root to: 'movies#index'
  resources :movies
  resuorces :ratings, only: [:create, :update, :delete]

  devise_for :users
end
