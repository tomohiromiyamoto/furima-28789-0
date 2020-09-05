Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :deals, only: %i[index create]
  end
end
