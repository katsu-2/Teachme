Rails.application.routes.draw do
  devise_for :users
  root 'recruitments#index'
  %w(about concept).each do |path|
    get path, to: "static_pages##{path}"
  end
  resources :users, only: %i(index show)
  resources :recruitments
end
