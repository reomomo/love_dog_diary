Rails.application.routes.draw do
  get 'strolls/new'
  get 'strolls/index'
  get 'strolls/edit'
  get 'photos/index'
  get 'photos/show'
  get 'photos/edit'
  get 'diaries/new'
  get 'diaries/index'
  get 'diaries/show'
  get 'diaries/edit'
  get 'my_dogs/new'
  get 'my_dogs/edit'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
