Rails.application.routes.draw do
  root to: 'site#index'
  namespace :external do
    resources :yelps
  end
end
