Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "static_pages/help"

    get "/signup", to: "users#new"
    post "/signup", to: "users#create"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :users
    resources :pitches, only: %i(index show)

    namespace :admin do
      root to: "static_pages#home"
      get "/home", to: "static_pages#home"
      get "/help", to: "static_pages#help"
      resources :users, only: %i(index show)
      resources :pitches
    end
  end
end
