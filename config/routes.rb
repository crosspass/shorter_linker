Rails.application.routes.draw do
  mount HolidayWorkday::Engine, at: '/holiday_workday'
  resources :linkers
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'linkers#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'successful', to: 'linkers#successful'
  get '*unmatched_route', to: 'application#not_found'
end
