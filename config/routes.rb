Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :experts, only: [:index, :new, :show ] do
    resources :specializations, only: [:index,:new, :show]
  end

end
