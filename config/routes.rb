Rails.application.routes.draw do

  get '/', to: "welcome#index"

  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:index, :show, :edit, :update]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
