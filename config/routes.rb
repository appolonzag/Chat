Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :rooms, only: [:show, :create], param: :title
  resources :messages, only: :create
  root to: "rooms#index"
end
