Rails.application.routes.draw do


  resources :users, only: [:create, :show, :update, :destroy, :index] do
    resources :artworks, only: [:index]
  end

  resources :artworks, only: [:create, :show, :update, :destroy]

  resources :artworkshares, only: [:create, :destroy]

  # resources :
end
