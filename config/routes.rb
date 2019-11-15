Rails.application.routes.draw do
  resources :stories
  resources :writers
  resources :tag
  get '/', :to => 'home#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end