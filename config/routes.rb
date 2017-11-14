Rails.application.routes.draw do

  namespace :user do
    get 'chat/index'
    get 'videos/index'
    get 'comments/index'
    get 'assistances/index'
    get 'posts/index'
    post 'register'
    patch 'register'
  end

  #rutas de goolgle para videos 
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#fail'

  get 'team/index'
  get 'user/fillForm'
  get 'user/index'
  get 'user/pending/index'

  get 'admin/index'
  
  namespace :admin do
    resources :routines
    resources :groups
    resources :posts
    resources :videos, only: [:index]
    resources :documents
    resources :students, only: [:index] do
      collection do
        get :view_student
      end
    end
    resources :rankings, only: [:index]
    resources :assistances, only: [:index] do
      collection do
        get :info_student
      end
    end
    resources :chat do
      resources :messages
    end

    get 'requests/index'
    post 'requests/accept'
    post 'requests/reject'
    post 'videos/upload'
    get 'videos/clearDropbox'
    post 'videos/clear'
    get 'videos/selectStudent/:id' => 'videos#selectStudent'
    get 'videos/newVideo/:id' => 'videos#newVideo'

  end

  namespace :team do
    get 'chat/index'
    get 'ranking/index'
    get 'form/index'
    get 'routines/index'
    get 'posts/index'
    match 'form/register' => 'form/register', via: [:patch,:post]
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
  get 'access/recover'
  post 'access/recover_account'
  get 'access/token'
  post 'access/update_account'


  

  match 'access/attempt_login' => 'access/attempt_login', via: [:get,:post]

  root 'access#index'
  #-----------------


end
