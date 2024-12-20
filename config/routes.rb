Rails.application.routes.draw do
  resources :items do
    member do
      patch :toggle_completed
    end

    collection do
      patch :toggle_all
    end

    collection do
      get :active
      get :completed
      delete :clear_completed
    end
  end


  if Rails.env.development?
    get "console" => "console#index", as: :rails_console
  end
  get "up" => "rails/health#show", as: :rails_health_check
  root "items#index"
end
