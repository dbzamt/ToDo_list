Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'users/sessions' }  
  devise_for :users
  root :to =>"projects#index"

  post '/projects' ,to: 'projects#create'

end
