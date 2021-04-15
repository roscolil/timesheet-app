Rails.application.routes.draw do
  root 'pages#index'
  resources :timesheets, only: [:new, :create]
end
