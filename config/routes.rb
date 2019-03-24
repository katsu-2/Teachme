Rails.application.routes.draw do
  root 'static_pages#home'
  %w(about concept).each do |path|
    get path, to: "static_pages##{path}"
  end
  resources :recruitments
end
