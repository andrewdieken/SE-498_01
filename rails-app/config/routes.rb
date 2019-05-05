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
      post 'update_houses' => 'stats#update_houses'
      post 'update_volunteers' => 'stats#update_volunteers'

    end
  end

  devise_scope :user do
    unauthenticated do
      root 'devise/registrations#new'
    end
    authenticated do
      root 'settings#index'
    end

  end
  # settings/stats
  get '/settings/stats' => 'settings#stats'

  # settings
  get '/settings' => 'settings#index'
  post '/settings' => 'settings#update'
  get '/settings_update' => 'settings#update'
  get '/delete_visits' => 'settings#delete_visits'
  get '/settings/export_csv' => 'settings#export_csv'
end
