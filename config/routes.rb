Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'users/sessions' }  
  devise_for :users
  root :to =>"projects#index"

  post '/projects' ,to: 'projects#create'
  get 'projects/get_developers' ,to: 'projects#get_developers'
  get '/projects/:project_id/tasks' ,to: 'projects#get_tasks'
  post '/tasks' ,to: 'tasks#create'

end
