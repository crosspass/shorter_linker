Rails.application.routes.draw do
  resources :linkers
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root "linkers#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
