Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/my_page' => 'users#show'
  get '/information/edit' => 'users#edit'
  patch '/information' => 'users#update'
  get '/unsubscribe' => 'users#unsubscribe'
  delete '/information' => 'users#destroy', as: 'destroy_user'

  resources :my_dogs, only: [:new, :create, :edit, :update]
  resources :diaries, only: [:new, :create, :index, :show, :edit, :update]
  resources :strolls, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :photos, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :pins, only: [:new, :create, :update, :destroy]

end
