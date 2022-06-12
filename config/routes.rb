Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "top", to: "mutalks#index"
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :likings
    end
  end
  
  resources :mutalks, only: [:create, :destroy, :new, :edit, :show, :update, :index]
  resources :favorites, only: [:create, :destroy] #お気に入り出来る様にするルーティング
  
end
