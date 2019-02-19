Rails.application.routes.draw do

  devise_for :users

  resources :users,except:[:new] do
    put :delete, on: :member
    resources :addresses,only:[:create,:destroy]
  end

  get 'cds/result'

  resources :cds do
    resources :chats,only:[:create,:destroy]
    resource :favorites,only:[:create,:destroy]
    resources :songs,only:[:create,:update,:destroy]
  end

  resources :cart_items,only:[:index,:show,:create,:destroy]
  resources :histories,only:[:index,:create,:destroy]

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
