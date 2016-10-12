Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root "districts#index"

  resources :districts do
    resources :reviews, except: [:show, :index]
  end

  namespace :api do
    resources :districts
  end

  namespace :admin do
    resources :users
  end
end
