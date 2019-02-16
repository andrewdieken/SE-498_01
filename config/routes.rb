Rails.application.routes.draw do
  resources :voters
  devise_for :users
end
