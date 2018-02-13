Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'

  root "welcome#index"

  resources :users, only: [:new, :create, :show], shallow: true do
    resources :ideas
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
