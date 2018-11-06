Rails.application.routes.draw do
  root 'pages#index'
  post 'pages/search'
#  post 'pages/search', to: 'pages#update', as: 'pages_update'
end
