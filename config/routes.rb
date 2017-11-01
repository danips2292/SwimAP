Rails.application.routes.draw do

  namespace :user do
    get 'pending/index'
  end

  #rutas de goolgle para videos 
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#fail'


  get 'team/index'
  get 'user/fillForm'
  get 'user/index'

  get 'admin/index'
  namespace :admin do
    resources :routines
    resources :groups
    resources :posts
    resources :videos, only: [:new, :index]
    resources :documents
    resources :students
    resources :chat
    resources :rankings, only: [:index]
    get 'requests/index'
    post 'requests/accept'
    post 'requests/reject'

  end

  

  #Rutas para asistencia
  get 'mobile/assistance'
  post 'mobile/new_assistance'
  get 'mobile/selectStudents/:id' => 'mobile#selectStudents'
  post 'mobile/finishAssistance'
  get 'mobile/finishedAssistance'

  #Rutas para Comentarios
  get 'mobile/comments'
  get 'mobile/selectStudent/:id' => 'mobile#selectStudent'
  get 'mobile/newComment/:id' => 'mobile#newComment'
  post 'mobile/addComment'
  get 'mobile/finishedComment'

  #Rutas para ranking
  get 'mobile/ranking'
  get 'mobile/selectStudent/:id' => 'mobile#selectStudent'
  get 'mobile/newRanking/:id' => 'mobile#newRanking'
  post 'mobile/addRanking'
  get 'mobile/finishedRanking'
  

  get 'access/signup'
  post 'access/signup'
  get 'access/index'
  post 'access/new'
  post 'access/logout'


  

  match 'access/attempt_login' => 'access/attempt_login', via: [:get,:post]


  #-----------------


end
