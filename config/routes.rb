Rails.application.routes.draw do

  # deviseのcontrollerをいじる記述
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }

  resources :users,except:[:new] do
    put :delete, on: :member
    resources :addresses,only:[:create,:destroy]
  end

  get 'cds/result'

  resources :cds do
    get "search", on: :collection
    resources :chats,only:[:create,:destroy]
    resource :favorites,only:[:create,:destroy]
    resources :songs,only:[:create,:update,:destroy]
  end

    get '/cart_items', to: 'cart_items#index',as: 'carts'

  resources :cart_items,only:[:create,:destroy,:update]
  resources :histories,only:[:index,:create,:destroy,:update]

  resources :animes,only:[:create] do
    get :autocomplete_anime_anime_title, on: :collection
  end

  resources :labels,only:[:create] do
    get :autocomplete_label_label_name, on: :collection
  end

  resources :artists,only:[:create,:update,:destroy] do
    get :autocomplete_artist_artist_name, on: :collection
  end

  root 'cds#top'

  get '/cart_items/purchase', to: 'cart_items#show',as: 'purchase'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
