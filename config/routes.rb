Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations"}
  resources :users do
    resources :exercises
  end
  
  resources :dashboards, only: [:index] do
    collection do
      post :search, to: "dashboards#search"
    end
  end
  
  resources :friendships, only: %i[show create destroy]
  root to:  "dashboards#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
