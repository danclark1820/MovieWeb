MovieWeb::Application.routes.draw do
  #root to: 'devise/sessions#create'
  devise_for :users
end
