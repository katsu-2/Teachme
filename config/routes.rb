Rails.application.routes.draw do
  get 'student/index'
  get 'teacher/index'
  devise_for :users
  root 'recruitments#index'
  %w(about concept).each do |path|
    get path, to: "static_pages##{path}"
  end
  resources :users, only: %i(index show)
  resources :recruitments
  resources :groups do
    resources :messages, only: %i(index create)
  end
end
