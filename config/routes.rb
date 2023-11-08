Rails.application.routes.draw do  
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create]
      resources :experts, only: [:index, :new, :create, :show] do
        member do
          put :toggle_remove
        end
      end
      resources :users

      resources :specializations, only: [:index, :create]

      get '/getexperts/data', to: 'experts#experts_data', as: 'experts_data'
    end
  end
end
