Rails.application.routes.draw do
  devise_for :users
  root "districts#index"
  resources :districts do
    resources :reviews
  end
end
