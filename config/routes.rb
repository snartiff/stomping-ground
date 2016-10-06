Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root "districts#index"

  resources :districts do
    resources :reviews do
      member do
        put "like" => "reviews#upvote"
        put "unlike" => "reviews#downvote"
      end
    end
  end
end
