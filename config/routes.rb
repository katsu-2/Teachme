Rails.application.routes.draw do
  root 'static_pages#home'
  %w(about concept).each do |path|
    get path, to: "static_pages##{path}"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
