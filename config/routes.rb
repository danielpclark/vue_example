Rails.application.routes.draw do
  resources :documents
  get 'landing_page/index'
  root to: "landing_page#index"
end
