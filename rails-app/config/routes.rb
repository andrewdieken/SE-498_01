Rails.application.routes.draw do
  devise_for :users
  resources :voters

  # Set up routes for API. Set namespace to 'api' which is where our api config file is stored.
  namespace 'api' do
    namespace 'v1' do
      # Sets routes for the following:
      # => GET
      # => POST
      # => DELETE
      # => PATCH
      # To view all routes: `rails routes`
      resources :voters
      resources :visits

    end
  end
end
