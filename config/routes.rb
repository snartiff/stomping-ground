Rails.application.routes.draw do
  root "districts#index"
  resources :districts do
    resources :reviews
  end
end
