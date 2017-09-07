Rails.application.routes.draw do

  match  'initial_forms/register' => 'initial_forms/register' , via: [:get,:post]
  get 'user/fillForm'
  get 'user/index'


  resources :routines

  resources :groups
  devise_for :admins
  devise_for :users
  resources :posts
  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
