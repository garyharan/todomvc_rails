Rails.application.routes.draw do
  resources :items

  get "up" => "rails/health#show", as: :rails_health_check
  root "items#index"
end
