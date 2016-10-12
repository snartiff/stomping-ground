Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root "districts#index"
  get "votes/:id/vote_up" => "votes#vote_up", as: "vote_up"
  get "votes/:id/vote_down" => "votes#vote_down", as: "vote_down"

  resources :districts do
    resources :reviews, except: [:show, :index]
  end

  namespace :admin do
    resources :users
  end
end
