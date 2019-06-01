Rails.application.routes.draw do
  get 'student/index'
  get 'teacher/index'
  devise_for :users
  root 'recruitments#index'

  resources :users, only: %i(index show)
  resources :recruitments
  resources :groups do
    resources :messages, only: %i(index create)
  end
end
