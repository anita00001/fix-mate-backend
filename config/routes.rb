Rails.application.routes.draw do
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

  resources :experts, only: [:index, :new, :show ] do
    resources :specializations, only: [:index,:new, :show]
  end
end
