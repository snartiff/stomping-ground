Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root "districts#index"
  get 'votes/:id/vote_up' => 'votes#vote_up', as: 'vote_up'
  get 'votes/:id/vote_down' => 'votes#vote_down', as: 'vote_down'

  namespace :api do
    resources :votes

    get 'votes/:id/vote_up' => 'votes#vote_up', as: 'vote_up'
    get 'votes/:id/vote_down' => 'votes#vote_down', as: 'vote_down'
  end



  resources :districts do
    resources :reviews
  end
end
