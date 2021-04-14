Rails.application.routes.draw do
 root 'pages#index'
 get 'new', to:'timesheets#new'
end
