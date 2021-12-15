Rails.application.routes.draw do
  get 'bugs/index'

  get 'bugs/edit'

  get 'bugs/show'

  get 'bugs/update'

  get 'bugs/destroy'

  get 'bugs/create'

  get 'projects/index'

  get 'projects/edit'

  get 'projects/show'

  get 'projects/update'

  get 'projects/destroy'

  get 'projects/create'

  devise_for :users
  root to: "home#index"

end
