Rails.application.routes.draw do
  root 'recruitments#index'
  %w(about concept).each do |path|
    get path, to: "static_pages##{path}"
  end
  resources :recruitments
end
