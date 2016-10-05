Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "districts#index"
  resources :districts do
    resources :reviews
  end
end
