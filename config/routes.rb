MovieWeb::Application.routes.draw do
  root to: 'movies#index'
  resources :movies
  resources :ratings, only: [:create, :update]

  devise_for :users
end
