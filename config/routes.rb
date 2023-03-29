Rails.application.routes.draw do
  post 'sessions/create'
  root 'movies#index'
  get 'movies/index'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'share/new', to: 'share#new'
  post 'share_video', to: 'share#create', as: 'share_video'
end
