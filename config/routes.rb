Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root "districts#index"

  resources :districts do
    resources :reviews
  end

  namespace :admin do
    resources :users
  end
end
