Rails.application.routes.draw do
  resources :artists

  resources :artists, only: [:index, :new, :create, :show] do
    resources :songs, only: [:new, :create]
  end
  resources :songs, only: [:show]
end
