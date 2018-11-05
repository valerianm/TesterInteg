Rails.application.routes.draw do
  root 'pages#home'
  get 'sessions/new'
  get '/home', to: 'pages#home'
  get '/club', to: 'pages#club'
  get '/new', to: 'pages#new'
  post '/new', to: 'pages#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
