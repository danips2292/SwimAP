Rails.application.routes.draw do

  get 'access/signup'
  post 'access/signup'
  get 'access/index'
  post 'access/new'

  
  get 'user/fillForm'
  get 'user/index'


  match  'initial_forms/register' => 'initial_forms/register' , via: [:get,:post]
  match 'access/attempt_login' => 'access/attempt_login', via: [:get,:post]

  resources :routines
  resources :groups

  resources :posts
  root to: "posts#index"
  #devise_for :admins
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
