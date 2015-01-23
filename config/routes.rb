Rails.application.routes.draw do
  resources :users

  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'help', to: 'static_pages#help'

  get 'signup', to: 'users#new'

  root 'static_pages#home'
end
