Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"

  # resources :projects
  get    '/projects'         , to: 'projects#index'    , as: 'projects'
  post   '/projects'         , to: 'projects#create'
  get    '/projects/new'     , to: 'projects#new'      , as: 'new_project'
  get    '/projects/:id/edit', to: 'projects#edit'     , as: 'edit_project'
  get    '/projects/:id'     , to: 'projects#show'     , as: 'project'
  patch  '/projects/:id'     , to: 'projects#update'
  put    '/projects/:id'     , to: 'projects#update'
  delete '/projects/:id'     , to: 'projects#destroy'

  # resources :bugs
  get    '/bugs'          , to: 'bugs#index'  , as: 'bugs'
  post   '/bugs'          , to: 'bugs#create'
  get    '/bugs/new'      , to: 'bugs#new'    , as: 'new_bug'
  get    '/bugs/:id/edit' , to: 'bugs#edit'   , as: 'edit_bug'
  get    '/bugs/:id'      , to: 'bugs#show'   , as: 'bug'
  patch  '/bugs/:id'      , to: 'bugs#update'
  put    '/bugs/:id'      , to: 'bugs#update'
  delete '/bugs/:id'      , to: 'bugs#destroy'

  # resources :projects_users
  get    '/projectsusers'          , to: 'projectsusers#index'
  # post   '/projectsusers'          , to: 'projectsusers#create'
  get    '/projectsusers/new'      , to: 'projects_users#new'    , as: 'new_projectsusers'
  get    '/projectsusers/:id/edit' , to: 'projects_users#edit'   , as: 'edit_projectsusers'
  # get    '/projectsusers/:id'      , to: 'projectsusers#show'   , as: 'projectsusers'
  # patch  '/projectsusers/:id'      , to: 'projectsusers#update'
  # put    '/projectsusers/:id'      , to: 'projectsusers#update'
  # delete '/projectsusers/:id'      , to: 'projectsusers#destroy'


  get '/:slug', to: 'pages#errorpage'
  get '/:slug/:slug2', to: 'pages#errorpage'
  get '/:slug/:slug2/:slug3', to: 'pages#errorpage'

  # get 'bugs/index'
  # get 'bugs/edit'
  # get 'bugs/show'
  # get 'bugs/update'
  # get 'bugs/destroy'
  # get 'bugs/create'
  # get 'projects/index'
  # get 'projects/edit'
  # get 'projects/show'
  # get 'projects/update'
  # get 'projects/destroy'
  # get 'projects/create'

end
