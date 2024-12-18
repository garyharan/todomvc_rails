Rails.application.routes.draw do
  resources :items do
    member do
      patch :toggle_completed
    end
    collection do
      get :completed
      get :uncompleted
    end
  end


  get "up" => "rails/health#show", as: :rails_health_check
  root "items#index"
end
