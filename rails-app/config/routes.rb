Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
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

  get '/settings' => 'settings#index'
  post '/settings' => 'settings#update'
  get '/delete_visits' => 'settings#delete_visits'

  get '/settings/exportcsv' => 'settings#exportcsv'
end
