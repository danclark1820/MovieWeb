MovieWeb::Application.routes.draw do
  #root to: 'devise/sessions#create'
  resources :movies
  devise_for :users
end
