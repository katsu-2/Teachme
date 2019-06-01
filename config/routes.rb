Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  get 'student/index'
  get 'teacher/index'
  root 'recruitments#index'

  resources :users, only: %i(index show)
  resources :recruitments
  resources :groups do
    resources :messages, only: %i(index create)
  end
end
