Rails.application.routes.draw do
  get 'users/index'
  root to: 'tasks#index' 
  resources :tasks
  get 'task/report', action: :report, controller: 'tasks'
  post 'task/report', action: :report, controller: 'tasks'
 
  devise_for :users, skip: [:registrations]
end
