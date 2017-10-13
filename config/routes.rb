Rails.application.routes.draw do

  get 'team/index'

  get 'admin/index'
  namespace :admin do
    resources :routines
    resources :groups
    resources :posts
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


  
  get 'user/fillForm'
  get 'user/index'
  match 'access/attempt_login' => 'access/attempt_login', via: [:get,:post]


  #-----------------


end
